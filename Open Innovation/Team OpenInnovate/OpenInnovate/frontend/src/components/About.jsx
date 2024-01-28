// src/pages/About.jsx
import React from 'react';
import Navbar from './Navbar';
import Footer from './Footer';

const About = () => {
  return (
    <>
    <Navbar />
    <section className='about-container'>
      <h2>About Open Innovate</h2>
      <p>
        Open Innovate is a collaborative platform that brings together innovators, problem solvers,
        and creators. Our mission is to harness the power of collective creativity and drive positive change
        through collaborative problem-solving.
      </p>
      <p>
        At Open Innovate, we believe that great ideas can come from anyone, anywhere. Whether you're an
        experienced professional or a passionate newcomer, you have the potential to make a significant impact.
      </p>
      <p>
        Join our community to explore a diverse range of challenges, share your expertise, and collaborate with
        like-minded individuals. Together, we can create innovative solutions and contribute to a better future.
      </p>
    </section>
    <Footer/>
    </>
  );
};

export default About;
