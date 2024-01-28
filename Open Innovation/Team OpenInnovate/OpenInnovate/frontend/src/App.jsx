// src/App.jsx
import React from 'react';
import { BrowserRouter as Router, Route, Routes } from 'react-router-dom';
import Home from './components/Home';
import ChallengeList from './components/ChallengeList';
import ChallengeDetails from './components/ChallengeDetails';
import LandingPage from './components/LandingPage';
import CreateChallenge from './components/CreateChallenge';
import Navbar from './components/Navbar';
import About from './components/About';
// import Header from './components/Header';

const App = () => {
  return (
    <Router>
      <Routes>
        <Route path="/" element={<LandingPage />} />
        <Route path="/home" element={<Home />} />
        <Route path="/challenges" element={<ChallengeList />} />
        <Route path="/challenges/:id" element={<ChallengeDetails />} />
        <Route path="/create-challenge" element={<CreateChallenge />} />
        <Route path="/about" element={<About />} />
      </Routes>
    </Router>
  );
};

export default App;
