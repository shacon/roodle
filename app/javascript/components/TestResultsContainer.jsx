import React, { useEffect } from "react";
import PropTypes from 'prop-types';

import ResultBox from './ResultBox';

const TestResultsContainer = ({results}) => {

  const gridItems = Array.from({ length: 25 }, (_, index) => {
    if (index < results.length) {
      const currentResult = results[index]
      let result;
      if (currentResult.passed) {
        result = 'passed';
      } else if (!currentResult.stderr) {
        result = 'failed';
      } else {
        result = 'exception';
      }
      return { id: index, result };
    } else {
      return { id: index, result: null };
    }
  });
  return (
    <div className="test-results test-results-grid">
      {gridItems.map((item) => (
        <ResultBox
         className="row"
          key={item.id}
          result={item.result}
      ></ResultBox>
      ))}
    </div>

  )
};

TestResultsContainer.propTypes = {
  results: PropTypes.arrayOf(PropTypes.bool),
};

export default TestResultsContainer;



