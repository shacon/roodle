import React, { useState, useEffect } from "react";
import { Link } from "react-router-dom";

import TestResultsContainer from "./TestResultsContainer";
import CodeEditor from "./Editor";

const Home = () => {
  const [prompt, setPrompt] = useState(null);
  const [results, setResults] = useState([]);
  const [storageKey, setStorageKey] = useState("");
  const [allResults, setAllResults] = useState([]);
  const [isPromptLoaded, setIsPromptLoaded] = useState(false);
  const [loading, setLoading] = useState(false);
  const [lastTestCaseResults, setLastTestCaseResults] = useState({});
  const [allTestsPassed, setAllTestsPassed] = useState(false);

  useEffect(() => {
    if (isPromptLoaded) {
      localStorage.setItem(storageKey, JSON.stringify(allResults));
      const today = new Date();
      const formattedDate = today.toLocaleDateString("en-US");
      localStorage.setItem(
        `lastTestResults_${formattedDate}`,
        JSON.stringify(lastTestCaseResults)
      );
    }
  }, [allResults, lastTestCaseResults]);

  useEffect(() => {
    if (isPromptLoaded) {
      if (results.length > 0) {
        let storedResults = [];
        try {
          storedResults = JSON.parse(localStorage.getItem(storageKey)) || [];
        } catch (e) {
          storedResults = [];
        }
        const updatedResults = [...storedResults, ...results];
        setAllResults(updatedResults);
      }
    }
  }, [isPromptLoaded, results]);

  useEffect(() => {
    const fetchPromptAndPreviousAttempts = async () => {
      try {
        const response = await fetch("/api/v1/prompts/today");
        if (response.ok) {
          const data = await response.json();
          setPrompt(data);
          setIsPromptLoaded(true);
          const key = `prompt_${data.id}_results`;
          setStorageKey(key);

          const storedResults = JSON.parse(localStorage.getItem(key)) || [];
          const today = new Date();
          const formattedDate = today.toLocaleDateString("en-US");
          const testKey = `lastTestResults_${formattedDate}`;
          const savedTestResults = localStorage.getItem(testKey);
          if (savedTestResults) {
            setLastTestCaseResults(JSON.parse(savedTestResults));
          }
          setAllResults(storedResults);
          const numTestCases = 5;

          // Check if the last submission's tests all passed
          const latestResults = storedResults.slice(-numTestCases);
          const allTestsPassed =
            latestResults.length === numTestCases &&
            latestResults.every((r) => r.passed);

          console.log("All tests passed:", allTestsPassed);
          setAllTestsPassed(allTestsPassed); // Add this state variable
          // TODO - check stored results to see if last result was all passing and if so show passed message
        } else {
          throw new Error("Network response was not ok.");
        }
      } catch (error) {
        setError(error.message);
      }
    };
    fetchPromptAndPreviousAttempts();
  }, []);

  const handleSubmit = async (answer) => {
    const url = "/api/v1/code_submissions/create";
    const token = document.querySelector('meta[name="csrf-token"]').content;
    const body = { code_submission: { submission: answer } };

    try {
      setLoading(true);
      setLastTestCaseResults({});
      const response = await fetch(url, {
        method: "POST",
        headers: {
          "X-CSRF-Token": token,
          "Content-Type": "application/json",
        },
        body: JSON.stringify(body),
      });

      const data = await response.json();
      setResults(data.results);
      console.log("data.results", data.results);
      const lastFailed = [...data.results]
        .reverse()
        .find((result) => result.passed === false);
      console.log("last failed", lastFailed);
      if (lastFailed) {
        setLastTestCaseResults({
          expected: lastFailed.expected_output_value,
          output: lastFailed.actual_output,
          input: lastFailed.input,
        });
      }
      const numTestCases = 5;

      // // Check if the last submission's tests all passed
      // const latestResults = data.results;
      const latestResults = data.results.slice(-numTestCases);
      const allTestsPassed =
        latestResults.length === numTestCases &&
        latestResults.every((r) => r.passed);

      console.log("All tests passed:", allTestsPassed);
      setAllTestsPassed(allTestsPassed);
      console.log("lastTestCaseResults: ", lastTestCaseResults);
      setLoading(false);
    } catch (err) {
      console.log(err);
    }
  };

  return (
    <div className="prompt-and-results-container">
      <div className="prompt-section main-text">
        <h3 className="main-text">Today's Prompt: </h3>
        {prompt ? (
          <div>
            <h4 className="main-text">{prompt.content}</h4>
            <h5 className="example-text">{prompt.example}</h5>
          </div>
        ) : (
          <p>Loading...</p>
        )}
      </div>
      <br />
      <div className="code-runner-container">
        <div className="code-editor">
          <div className="test-result-output mb-3">
            {allTestsPassed ? (
              <div className="all-tests-passed">
                <p>🎉 All tests pass!</p>
              </div>
            ) : (
              Object.keys(lastTestCaseResults).length > 0 && (
                <div>
                  <p className="test-failure-title m-0">Last failing test</p>
                  <div>
                    <span className="label">Input:</span>
                    <code className="value">
                      {JSON.stringify(lastTestCaseResults.input, null, 2)}
                    </code>
                  </div>
                  <div>
                    <span className="label">Expected:</span>
                    <code className="value">
                      {JSON.stringify(lastTestCaseResults.expected, null, 2)}
                    </code>
                  </div>
                  <div>
                    <span className="label">Output:</span>
                    <code className="value error">
                      {typeof lastTestCaseResults.output === "string"
                        ? lastTestCaseResults.output
                        : lastTestCaseResults.output}
                    </code>
                  </div>
                </div>
              )
            )}
          </div>
          <CodeEditor
            onSubmit={handleSubmit}
            loading={loading}
            disableSubmit={allTestsPassed}
          ></CodeEditor>
          <br />
        </div>
        <TestResultsContainer results={allResults} loading={loading} />
      </div>
    </div>
  );
};

export default Home;
