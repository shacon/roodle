import React from "react";

const CodeBlock = ({ children }) => {
  return (
    <pre className="bg-gray-100 p-2 rounded-md overflow-x-auto whitespace-pre-wrap break-words">
      <code className="text-sm">{children}</code>
    </pre>
  );
};

const CodeExample = ({ example }) => {
  const exampleInput = (content) => {
    // Look for the text between "Input: " and "Expected Output:"
    const inputMatch = content.match(/Input:\s*(.+?)\s*Expected Output:/);
    return inputMatch ? inputMatch[1].trim() : "No input found";
  };

  // Method to extract output from the example string
  const exampleOutput = (content) => {
    // Look for the text after "Expected Output:"
    const outputMatch = content.match(/Expected Output:\s*(.+)/);
    return outputMatch ? outputMatch[1].trim() : "No output found";
  };

  return (
    <div className="code-example-container max-w-2xl mx-auto p-3 bg-white shadow-sm rounded-lg">
      <h5 className="text-2xl font-bold mb-1">Example</h5>

      <div className="mb-2">
        <h6 className="text-xl font-semibold mb-1">Input:</h6>
        <CodeBlock>{exampleInput(example)}</CodeBlock>
      </div>

      <div>
        <h6 className="text-xl font-semibold mb-1">Expected Output:</h6>
        <CodeBlock>{exampleOutput(example)}</CodeBlock>
      </div>
    </div>
  );
};

export default CodeExample;
