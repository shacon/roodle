import React, { useState, useEffect } from "react";
import { Link } from "react-router-dom";

const Home = () => {

  const [answer, setAnswer] = useState('')
  const [prompt, setPrompt] = useState(null);
  const [error, setError] = useState(null);


  useEffect(() => {
    const fetchPrompt = async () => {
      try {
        const response = await fetch("/api/v1/prompts/today");
        if (response.ok) {
          const data = await response.json();
          setPrompt(data);
        } else {
          throw new Error("Network response was not ok.");
        }
      } catch (error) {
        setError(error.message);
      }
    };

    fetchPrompt();
  }, []);

  const testSolution = (e) => {
    const url = "/api/v1/code_submissions/create";
    const token = document.querySelector('meta[name="csrf-token"]').content;
    const body = { code_submission: { submission: answer }}
    fetch(url, {
      method: "POST",
      headers: {
        "X-CSRF-Token": token,
        "Content-Type": "application/json",
      },
      body: JSON.stringify(body),
    })

  }

  return (
    <div className="p-5">
      <div>
      <h3>Today's Prompt: </h3>
      {prompt ? (
        <h4>{prompt.content}</h4>
      ) : (
        <p>Loading...</p>
      )}
      </div>
      <br />
      <div className="">

        <form action={testSolution}>
        <input
            value={answer}
            onChange={(e) => setAnswer(e.target.value)}
            name="query"
          />
          <br />
          <button type="submit">Submit</button>
        </form>
      </div>
    </div>

  )
};

export default Home;


