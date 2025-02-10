import React, { useState } from "react";

import { ruby } from "@codemirror/legacy-modes/mode/ruby";
import CodeMirror from "@uiw/react-codemirror";
import { StreamLanguage } from "@codemirror/language";

const CodeEditor = ({ onSubmit }) => {
  const [answer, setAnswer] = useState("");

  const handleSubmit = () => {
    onSubmit(answer);
  };

  return (
    <div>
      <CodeMirror
        value={answer}
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
      <button onClick={handleSubmit} type="button">
        Submit Test
      </button>
    </div>
  );
};

export default CodeEditor;
