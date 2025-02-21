import React, { useState, useMemo } from "react";

import { ruby } from "@codemirror/legacy-modes/mode/ruby";
import CodeMirror from "@uiw/react-codemirror";
import { StreamLanguage } from "@codemirror/language";

const CodeEditor = ({ attemptCountKey, onSubmit, loading }) => {
  const [answer, setAnswer] = useState("");
  const attempts = localStorage.getItem(attemptCountKey) || 0;

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
      <button
        onClick={handleSubmit}
        type="button"
        disabled={loading || isMaxAttempts}
      >
        Submit Test
      </button>
    </div>
  );
};

export default CodeEditor;
