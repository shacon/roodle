import React, { useEffect, useRef } from "react";
import { EditorView, basicSetup } from "codemirror";
import { StreamLanguage } from "@codemirror/language";
import { ruby } from "@codemirror/legacy-modes/mode/ruby";

// TODO
// - add min required number of lines
// - figure out how to get the response
const CodeEditor = ({ onSubmit }) => {
  const containerRef = useRef(null);
  const viewRef = useRef(null);

  useEffect(() => {
    console.log("here");
    if (!containerRef.current) return;

    viewRef.current = new EditorView({
      extensions: [basicSetup, StreamLanguage.define(ruby)],
      parent: containerRef.current,
      theme: "monokai",
    });

    return () => viewRef.current.destroy();
  }, []);

  const handleSubmit = () => {
    const lines = viewRef.current.state.doc.toString().split(",");
    const contentWithNewlines = lines.map((line) => line + "\n").join("");

    const parsedAnswer = viewRef.current.state.doc.toString();
    console.log("viewref", viewRef);
    console.log("parsed answer", parsedAnswer);
    onSubmit(parsedAnswer);
  };

  return (
    <div>
      <div ref={containerRef} />
      <button onClick={handleSubmit} type="button">
        Submit Test
      </button>
    </div>
  );
};

export default CodeEditor;

// import React, { useEffect, useRef } from 'react';
// import CodeMirror from 'codemirror';
// // import 'codemirror/lib/codemirror.css';
// // import { StreamLanguage } from '@codemirror/language';
// // import { ruby } from '@codemirror/legacy-modes/mode/ruby';

// const CodeEditor = () => {
//   const containerRef = useRef(null);

//   useEffect(() => {
//     console.log('testing...')
//     if (!containerRef.current) return;

//     const editor = CodeMirror(containerRef.current, {
//       mode: 'ruby',
//       lineNumbers: true,
//       theme: 'monokai'
//     });

//     return () => {
//       // Optional cleanup if needed
//     };
//   }, []);

//   return <div ref={containerRef} />;
// };

// export default CodeEditor;
