import * as React from "react";
import { Link } from 'react-router-dom';
export default function NavBar(props) {
  return (
    <div className="bg-pink-300 bg-opacity-30 flex flex-col justify-center items-stretch p-12 max-md:px-5">
      <div className="border backdrop-blur-[15px] bg-white bg-opacity-30 flex flex-col items-stretch pt-12 pb-4 px-12 rounded-3xl border-solid border-white max-md:max-w-full relative max-md:px-5">
        <div className="flex w-full items-stretch justify-between gap-5 max-md:max-w-full max-md:flex-wrap">
          <div className="flex items-stretch justify-between gap-3.5">
            <div
              className="aspect-square w-[150px] 
 absolute rounded-full bg-yellow-500 opacity-20 z-[-10]"
            ></div>
            <img
              loading="lazy"
              src="../public/Frame 9919.png"
              className="aspect-square object-contain object-center w-[38px] fill-neutral-600 shrink-0"
            />
            <div className="text-neutral-600 text-2xl font-bold grow whitespace-nowrap mt-2.5 self-start">
              Crime Detector
            </div>
          </div>
          <div className="flex items-center justify-between gap-5 max-md:max-w-full max-md:flex-wrap">
            <div className="text-neutral-700 text-lg font-semibold self-stretch grow my-auto">
            <Link to="/">Home</Link>
            </div>
            <div className="text-neutral-700 text-lg font-semibold self-stretch my-auto">
            <Link to="/login">Login</Link>
            </div>
            <div className="text-neutral-700 text-lg font-semibold self-stretch my-auto">
            <Link to="/map-view">Map-view</Link>
            </div>
            <div className="aspect-square w-[170px] absolute rounded-full bg-yellow-500 opacity-20 z-[-10]"></div>
          </div>
        </div>
      </div>
    </div>
  );
}
