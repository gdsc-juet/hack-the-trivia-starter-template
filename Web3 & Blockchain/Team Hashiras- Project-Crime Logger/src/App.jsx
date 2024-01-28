import "./App.css";
// import { useEffect,useState } from "react";
// import axios from "axios";
import { BrowserRouter,Route,Routes } from 'react-router-dom'
import NavBar from "./components/Navbar";
import Map from "./components/Map";
import About from "./components/About";
// const url = "http://localhost:3000/cities";


export default function App() {
  return (
      <BrowserRouter>
    <main>
      <NavBar />
      <Routes>
        <Route path="/" element={<About/>}/>
        <Route path="/login" element={<About/>}/>
        <Route path="/map-view" element={<Map/>}/>
      </Routes>
    </main>
      </BrowserRouter>
  );
}
