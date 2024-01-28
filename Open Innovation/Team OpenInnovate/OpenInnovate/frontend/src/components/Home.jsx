// src/components/Home.jsx
import React from 'react';
import { Link } from 'react-router-dom';

const Home = () => {
  return (
    <div>
      <h1>Welcome to Open Innovate!</h1>
      <p>
        Explore challenges and contribute to innovation.{' '}
        <Link to="/challenges">View Challenges</Link>
      </p>
    </div>
  );
};

export default Home;
