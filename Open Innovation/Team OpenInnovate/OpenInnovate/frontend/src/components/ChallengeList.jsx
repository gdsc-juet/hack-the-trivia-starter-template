// src/components/ChallengeList.jsx
import React, { useState } from 'react';
import challengesData from '../challengesData';
import { Link } from 'react-router-dom';
import Navbar from './Navbar';
import Footer from './Footer';
import '../styles.css';

const ChallengeList = () => {
  const [showDescriptions, setShowDescriptions] = useState({});

  const toggleDescription = (challengeId) => {
    setShowDescriptions((prevState) => ({
      ...prevState,
      [challengeId]: !prevState[challengeId],
    }));
  };

  return (
    <div>
      <Navbar />
      <div className="about-container">
        <h2>Challenges</h2>
        <ul>
          {challengesData.map((challenge) => (
            <li key={challenge.id} className="challenge-item">
              {/* Challenge title with link */}
              <div className="challenge-title">
                <Link to={`/challenges/${challenge.id}`}>
                  {challenge.title}
                </Link>

                {/* Plus symbol to toggle description (moved to the right) */}
                <span
                  className="plus-symbol"
                  onClick={() => toggleDescription(challenge.id)}
                >
                  {showDescriptions[challenge.id] ? '-' : '+'}
                </span>
              </div>

              {/* Challenge description (conditionally rendered) */}
              {showDescriptions[challenge.id] && (
                <div className="challenge-description">
                  {/* Sample description (replace with actual description) */}
                  <p>{challenge.description || 'No description available.'}</p>
                </div>
              )}
            </li>
          ))}
        </ul>
      </div>
      <Footer />
    </div>
  );
};

export default ChallengeList;
