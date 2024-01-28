// src/components/LandingPage.jsx
import React from 'react';
import { Link } from 'react-router-dom';
import Navbar from './Navbar';

const LandingPage = () => {
  return (
    <div>
      <Navbar/>
      <header>
        <h1>Welcome to Open Innovate</h1>
        <p>Empowering Innovation through Collaborative Challenges</p>
      </header>
      <main>
      <section>
        <h2>Explore Challenges</h2>
        <p>
          Join our community to explore and contribute to a variety of challenges.
        </p>
        <Link to="/challenges">
          <button>View Challenges</button>
        </Link>
      </section>
      <section>
        <h2>About Open Innovate</h2>
        <p>
          Open Innovate is a platform that connects innovators, problem solvers,
          and creators. We believe in the power of collaboration to drive
          positive change.
        </p>
        <Link to="/about"><button>About</button></Link>
      </section>
      <section>
      <h2>Create Challenge</h2>
      <p>
        Have a unique idea or problem to solve? Create a challenge and invite others to collaborate!
      </p>
      <Link to="/create-challenge">
        <button>Create a Challenge</button>
      </Link>
    </section>
      <section>
        <h2>Get Started</h2>
        <p>
          Ready to make an impact? Join Open Innovate and start participating
          in challenges today.
        </p>
        <Link to="/get-started">
          <button>Get Started</button>
        </Link>
      </section>
      </main>
      <footer>
        &copy; 2024 Open Innovate
      </footer>
    </div>
  );
};

export default LandingPage;
