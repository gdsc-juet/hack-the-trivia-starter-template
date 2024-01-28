// src/components/CreateChallenge.jsx
import React, { useState } from 'react';
import Navbar from './Navbar';
import Footer from './Footer';
import '../styles.css';

const CreateChallenge = () => {
  const [challengeTitle, setChallengeTitle] = useState('');
  const [challengeDescription, setChallengeDescription] = useState('');

  const handleSubmit = (e) => {
    e.preventDefault();
    // Handle the submission of the challenge (you can add API calls or store the data as needed)
    console.log('Challenge submitted:', { title: challengeTitle, description: challengeDescription });
    // Add logic to handle the challenge submission (e.g., API call, storing data, etc.)
    // You may use a state management library like Redux to handle global state if needed.
  };

  return (
    <div>
      <Navbar />
      <div className="create-container">
        <h2>Create a New Challenge</h2>
        <form onSubmit={handleSubmit}>
          <label htmlFor="challengeTitle">Challenge Title:</label>
          <input
            type="text"
            id="challengeTitle"
            value={challengeTitle}
            onChange={(e) => setChallengeTitle(e.target.value)}
            required
          />

          <label htmlFor="challengeDescription">Challenge Description:</label>
          <textarea
            id="challengeDescription"
            value={challengeDescription}
            onChange={(e) => setChallengeDescription(e.target.value)}
            required
          ></textarea>

          <button type="submit">Submit Challenge</button>
        </form>
      </div>
      <Footer />
    </div>
  );
};

export default CreateChallenge;
