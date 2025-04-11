import React, { useState, useEffect, useMemo } from "react";
import Button from "@mui/material/Button";

import { ruby } from "@codemirror/legacy-modes/mode/ruby";
import CodeMirror from "@uiw/react-codemirror";
import { StreamLanguage } from "@codemirror/language";

const CodeEditor = ({ onSubmit, loading, disableSubmit }) => {
  const [answer, setAnswer] = useState("");
  const [attemptCountKey, setAttemptCountKey] = useState("");
  const attempts = localStorage.getItem(attemptCountKey) || 0;

  useEffect(() => {
    const today = new Date();
    const formattedDate = today.toLocaleDateString("en-US");
    const formattedAttemptCountKey = `roodle_${formattedDate}_attempts`;
    setAttemptCountKey(formattedAttemptCountKey);
  }, []);

  const handleSubmit = () => {
    localStorage.setItem(attemptCountKey, Number(attempts) + 1);
    onSubmit(answer);
  };

  const isMaxAttempts = useMemo(
    () => localStorage.getItem(attemptCountKey) >= 5,
    [localStorage.getItem(attemptCountKey)]
  );

  return (
    <div>
      <CodeMirror
        value={`def solve(input)
end`}
        onChange={setAnswer}
        height="200px"
        extensions={[StreamLanguage.define(ruby)]}
        basicSetup={{
          foldGutter: false,
          dropCursor: false,
          allowMultipleSelections: false,
          indentOnInput: false,
        }}
      />

      <Button
        variant="contained"
        color="primary"
        onClick={handleSubmit}
        type="button"
        disabled={loading || isMaxAttempts || disableSubmit}
        sx={{
          padding: "12px 24px",
          margin: 2,
        }}
      >
        Submit
      </Button>
    </div>
  );
};

export default CodeEditor;
