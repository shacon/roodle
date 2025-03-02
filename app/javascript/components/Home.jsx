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

  useEffect(() => {
    if (isPromptLoaded) {
      localStorage.setItem(storageKey, JSON.stringify(allResults));
    }
  }, [allResults]);

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
          setAllResults(storedResults);
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
      setLoading(false);
    } catch (err) {}
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
          {/* optionally show last test case failure- input: output: expected: */}
          <CodeEditor onSubmit={handleSubmit} loading={loading}></CodeEditor>
          <br />
        </div>
        <TestResultsContainer results={allResults} loading={loading} />
      </div>
    </div>
  );
};

export default Home;
