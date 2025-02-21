import React from "react";
import PropTypes from "prop-types";

import ResultBox from "./ResultBox";

const TestResultsContainer = ({ results, loading }) => {
  const gridItems = Array.from({ length: 25 }, (_, index) => {
    if (index < results.length) {
      const currentResult = results[index];
      let result;
      if (currentResult.passed) {
        result = "passed";
      } else if (!currentResult.stderr) {
        result = "failed";
      } else {
        result = "exception";
      }

      return { id: index, result };
    } else {
      const loadingItemIndexes = Array.from(
        { length: results.length + 4 - results.length + 1 },
        (_, i) => results.length + i
      );
      const loading = loadingItemIndexes.includes(index);
      return { id: index, result: null, loading: loading };
    }
  });
  return (
    <div className="test-results test-results-grid placeholder-glow">
      {gridItems.map((item) => (
        <ResultBox
          className={`${
            loading && item.loading ? "placeholder result-placeholder" : ""
          }`}
          key={item.id}
          result={item.result}
        ></ResultBox>
      ))}
    </div>
  );
};

TestResultsContainer.propTypes = {
  results: PropTypes.arrayOf(PropTypes.bool),
};

export default TestResultsContainer;
