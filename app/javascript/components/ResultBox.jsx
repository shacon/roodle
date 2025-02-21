import React, { useEffect } from "react";
import PropTypes from "prop-types";

const ResultBox = ({ result, className }) => {
  return (
    <div
      className={`single-result-box ${
        result === "passed"
          ? "test-passed"
          : result === "failed"
          ? "test-failed"
          : result === "exception"
          ? "test-exception"
          : result === null || result === undefined
          ? "test-not-run"
          : ""
      } ${className || ""}`}
    >
      {result === "passed"
        ? "."
        : result === "failed"
        ? "F"
        : result === "exception"
        ? "!"
        : ""}
    </div>
  );
};

ResultBox.propTypes = {
  result: PropTypes.oneOf(["passed", "failed", "exception"]),
};

export default ResultBox;
