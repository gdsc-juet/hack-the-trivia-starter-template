import * as React from "react";
import { Link } from 'react-router-dom';
export default function About(props) {
  return(
    <div className="bg-pink-300 bg-opacity-30 flex flex-col justify-center items-stretch p-12 max-md:px-5">
      <div className="border backdrop-blur-[15px] bg-white bg-opacity-30 flex flex-col items-stretch pt-12 pb-4 px-12 rounded-3xl border-solid border-white max-md:max-w-full relative max-md:px-5">
    <div className="mt-20 max-md:max-w-full max-md:mt-10">
      <div className="gap-5 flex max-md:flex-col max-md:items-stretch max-md:gap-0">
        <div className="flex flex-col items-stretch w-[54%] max-md:w-full max-md:ml-0">
          <div className="flex flex-col self-stretch items-stretch my-auto max-md:max-w-full max-md:mt-10">
            <div className="text-neutral-700 text-5xl font-extrabold leading-[70px] max-md:max-w-full max-md:text-4xl max-md:leading-[65px]">
              Lorem ipsum
              <br />
              dolor sit amet!
            </div>
            <div className="text-neutral-400 text-lg font-medium leading-10 mt-14 max-md:max-w-full max-md:mt-10">
              Lorem ipsum dolor sit amet, consectetur adipiscing elit. Amet
              maecenas mattis tellus tristique non. Enim dictum rhoncus
              feugiat purus fringilla dictum est quam aenean.
            </div>
            <div className="text-zinc-100 text-lg font-semibold whitespace-nowrap justify-center items-center bg-red-400 w-64 max-w-full mt-24 px-16 py-5 rounded-[100px] max-md:mt-10 max-md:px-5">
            <Link to="/">Get Started</Link>
            </div>
          </div>
        </div>
        <div className="flex flex-col items-stretch w-[46%] ml-9 mt-10 max-md:w-full max-md:ml-0">
          <div className="aspect-square w-[160px] absolute top-60 left-150 rounded-full bg-pink-400 backdrop-filter backdrop-blur-[40px] opacity-10 z-[-10]"></div>
        </div>
        <div className="flex flex-col items-stretch w-[46%] ml-3 max-md:w-full max-md:ml-0">
          <img
            loading="lazy"
            src="../public/41 1.png"
            className="aspect-[1.05] object-contain object-center w-full grow max-md:max-w-full max-md:mt-10"
          />
        </div>
      </div>
    </div>
      </div>
    </div>
  )
}