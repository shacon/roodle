import React, { useEffect } from "react";
import PropTypes from 'prop-types';

const ResultBox = ({result}) => {

  // useEffect(() => {
    
  //   console.log(result)
  //   // initiate the 5x5 grid here? and then 
  // }, []);
  return (
    <div className={`single-result-box ${
      result === 'passed' ? 'test-passed' :
      result === 'failed' ? 'test-failed' :
      result === 'exception' ? 'test-exception' : 
      result === null || result === undefined ? 'test-not-run' : ''
    }`}>
     {result === 'passed' ? '.' :
      result === 'failed' ? 'F' :
      result === 'exception' ? '!':
      ''
      }
            
    </div>
      

  )
};

ResultBox.propTypes = {
  result: PropTypes.oneOf(['passed', 'failed', 'exception']),
};

export default ResultBox;



