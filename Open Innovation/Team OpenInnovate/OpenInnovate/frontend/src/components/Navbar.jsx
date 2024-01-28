// src/components/Navbar.jsx
import React from 'react';
import { Link } from 'react-router-dom';

const Navbar = () => {
  return (
    <nav>
      <Link to="/">Home</Link>
      <Link to="/challenges">Challenges</Link>
      <Link to="/create-challenge">Create Challenge</Link> {/* Add this link */}
      <Link to="/about">About</Link>
      <Link to="/get-started">Get Started</Link>
    </nav>
  );
};

export default Navbar;
