import React, { useEffect } from "react";
import PropTypes from 'prop-types';

import ResultBox from './ResultBox';

const TestResultsContainer = ({results}) => {

  // const mockResults = [
  //   {
  //     passed: false,
  //     expected_output: "5",
  //     actual_output: {
  //       run: {
  //         stdout: "5",
  //         stderr: "",
  //       }
  //     }
  //   },
  //   {
  //     passed: false,
  //     expected_output: "-1",
  //     actual_output: {
  //       run: {
  //         stdout: "",
  //         stderr: "solution.rb:3: syntax error, unexpected end-of-input, expecting `end'\n",
  //       }
  //     }
  //   },
  //   {
  //     passed: true,
  //     expected_output: "10",
  //     actual_output: {
  //       run: {
  //         stdout: "10",
  //       }
  //     }
  //   },
  //   {
  //     passed: true,
  //     expected_output: "10",
  //     actual_output: {
  //       run: {
  //         stdout: "10",
  //       }
  //     }
  //   },
  //   {
  //     passed: true,
  //     expected_output: "10",
  //     actual_output: {
  //       run: {
  //         stdout: "10",
  //       }
  //     }
  //   },
  //   {
  //     passed: true,
  //     expected_output: "10",
  //     actual_output: {
  //       run: {
  //         stdout: "10",
  //       }
  //     }
  //   },
  //   {
  //     passed: true,
  //     expected_output: "10",
  //     actual_output: {
  //       run: {
  //         stdout: "10",
  //       }
  //     }
  //   }
  // ];


  // Add the results to localStorage
  // When generating girdItems, grab the totalResults from localStorage
  
  // useEffect(() => {
  //   // const storageKey = `prompt_${promptId}_results`;
  //   console.log('storage key', storageKey);

  //   const storedResults = JSON.parse(localStorage.getItem(storageKey) || '[]');
  //   console.log('storedResults', storedResults);
  //   setAllResults(storedResults);
  // }, [promptId]);

  const gridItems = Array.from({ length: 25 }, (_, index) => {
    // add results to allResults every time submit happens
    if (index < results.length) {
      const currentResult = results[index]
      let result;
      if (currentResult.passed) {
        result = 'passed';
        console.log('passed is here')
      } else if (!currentResult.actual_output.run.stderr) {
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



