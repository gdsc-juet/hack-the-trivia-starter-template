// src/components/ChallengeDetails.jsx
import React from 'react';
import { Link, useParams } from 'react-router-dom';
import Navbar from './Navbar'; // Assuming you have a Navbar component
import challengesData from '../challengesData';
import '../styles.css';

const ChallengeDetails = () => {
  const { id } = useParams();
  const challengeId = Number(id);
  const challenge = challengesData.find(challenge => challenge.id === challengeId);

  if (!challenge) {
    return (
      <div>
        <Navbar />
        <div>Challenge not found</div>
      </div>
    );
  }

  return (
    <div>
      <Navbar />
      <div className="container">
        <h2>{challenge.title}</h2>
        <p>{challenge.description}</p>
        <Link to="/challenges">Back to Challenges</Link>
      </div>
    </div>
  );
};

export default ChallengeDetails;
