import * as React from "react";
import City from "./Cities";

export default function Map(props){
  return (
    <div className=" bg-pink-300 bg-opacity-30 flex flex-col items-stretch pl-2.5 pr-16 pt-2.5 pb-12 max-md:pr-5">
      <div className="items-stretch backdrop-blur-[15px] bg-white bg-opacity-30 flex justify-between gap-5 px-5 py-3 border-solid border-pink-700 border-opacity-20 max-md:max-w-full max-md:flex-wrap">
        <img
          loading="lazy"
          srcSet="https://cdn.builder.io/api/v1/image/assets/TEMP/96eca204cab4594a837f5b4c3dbc742dbdb6047388ebd44b0c3235b9e9669665?apiKey=39e7f970288f4e2bb51544d854259214&width=100 100w, https://cdn.builder.io/api/v1/image/assets/TEMP/96eca204cab4594a837f5b4c3dbc742dbdb6047388ebd44b0c3235b9e9669665?apiKey=39e7f970288f4e2bb51544d854259214&width=200 200w, https://cdn.builder.io/api/v1/image/assets/TEMP/96eca204cab4594a837f5b4c3dbc742dbdb6047388ebd44b0c3235b9e9669665?apiKey=39e7f970288f4e2bb51544d854259214&width=400 400w, https://cdn.builder.io/api/v1/image/assets/TEMP/96eca204cab4594a837f5b4c3dbc742dbdb6047388ebd44b0c3235b9e9669665?apiKey=39e7f970288f4e2bb51544d854259214&width=800 800w, https://cdn.builder.io/api/v1/image/assets/TEMP/96eca204cab4594a837f5b4c3dbc742dbdb6047388ebd44b0c3235b9e9669665?apiKey=39e7f970288f4e2bb51544d854259214&width=1200 1200w, https://cdn.builder.io/api/v1/image/assets/TEMP/96eca204cab4594a837f5b4c3dbc742dbdb6047388ebd44b0c3235b9e9669665?apiKey=39e7f970288f4e2bb51544d854259214&width=1600 1600w, https://cdn.builder.io/api/v1/image/assets/TEMP/96eca204cab4594a837f5b4c3dbc742dbdb6047388ebd44b0c3235b9e9669665?apiKey=39e7f970288f4e2bb51544d854259214&width=2000 2000w, https://cdn.builder.io/api/v1/image/assets/TEMP/96eca204cab4594a837f5b4c3dbc742dbdb6047388ebd44b0c3235b9e9669665?apiKey=39e7f970288f4e2bb51544d854259214&"
          className="aspect-square object-contain object-center w-9 shrink-0 "
        />
        <div className="text-center text-neutral-700 text-5xl font-extrabold leading-[70px] tracking-normal grow shrink basis-auto my-auto max-md:max-w-full">
          Crime in India
        </div>
      </div>
      <div className="mt-3 max-md:max-w-full">
        <div className="gap-5 flex max-md:flex-col max-md:items-stretch max-md:gap-0">
          <div className="flex flex-col items-stretch w-[17%] max-md:w-full max-md:ml-0">
            <div className="flex flex-col items-stretch max-md:mt-2.5">
              <div className="items-stretch backdrop-blur-[15px] bg-white bg-opacity-40 rounded-3xl border-solid border-white flex flex-col whitespace-nowrap px-4 py-8">
                <div className="justify-center text-neutral-600 font-bold text-3xl tracking-normal self-center">
                  &nbsp; Total Confirmed
                </div>
                
              </div>
              <div className="justify-center items-stretch border flex flex-col mt-2.5 border-solid border-zinc-300 border-opacity-20">
                <div className="text-neutral-500 font-semibold text-3xl items-stretch backdrop-blur-[15px] bg-white bg-opacity-40 rounded-3xl px-1 py-4 max-md:px-6 " >
                  Confirmed Cases by Cities
                </div>
                
                 <City/>

              </div>
            </div>
          </div>
          <div className="flex flex-col items-stretch w-[83%] ml-5 max-md:w-full max-md:ml-0">
            <div className="flex-col overflow-hidden relative flex min-h-[873px] grow pl-9 pr-20 py-11 max-md:max-w-full max-md:mt-2.5 max-md:px-5">
              <img
                loading="lazy"
                srcSet="https://cdn.builder.io/api/v1/image/assets/TEMP/f65350bba8ebb763aa3fe519ae91001822b5af8f2547d8727d0d50cd9ef96bf6?apiKey=39e7f970288f4e2bb51544d854259214&width=100 100w, https://cdn.builder.io/api/v1/image/assets/TEMP/f65350bba8ebb763aa3fe519ae91001822b5af8f2547d8727d0d50cd9ef96bf6?apiKey=39e7f970288f4e2bb51544d854259214&width=200 200w, https://cdn.builder.io/api/v1/image/assets/TEMP/f65350bba8ebb763aa3fe519ae91001822b5af8f2547d8727d0d50cd9ef96bf6?apiKey=39e7f970288f4e2bb51544d854259214&width=400 400w, https://cdn.builder.io/api/v1/image/assets/TEMP/f65350bba8ebb763aa3fe519ae91001822b5af8f2547d8727d0d50cd9ef96bf6?apiKey=39e7f970288f4e2bb51544d854259214&width=800 800w, https://cdn.builder.io/api/v1/image/assets/TEMP/f65350bba8ebb763aa3fe519ae91001822b5af8f2547d8727d0d50cd9ef96bf6?apiKey=39e7f970288f4e2bb51544d854259214&width=1200 1200w, https://cdn.builder.io/api/v1/image/assets/TEMP/f65350bba8ebb763aa3fe519ae91001822b5af8f2547d8727d0d50cd9ef96bf6?apiKey=39e7f970288f4e2bb51544d854259214&width=1600 1600w, https://cdn.builder.io/api/v1/image/assets/TEMP/f65350bba8ebb763aa3fe519ae91001822b5af8f2547d8727d0d50cd9ef96bf6?apiKey=39e7f970288f4e2bb51544d854259214&width=2000 2000w, https://cdn.builder.io/api/v1/image/assets/TEMP/f65350bba8ebb763aa3fe519ae91001822b5af8f2547d8727d0d50cd9ef96bf6?apiKey=39e7f970288f4e2bb51544d854259214&"
                className="absolute object-cover object-center inset-0 size-full"
              />
              <img
                loading="lazy"
                src="https://cdn.builder.io/api/v1/image/assets/TEMP/9eb2bd680b24a25e7219c51f1a7a5470f4a2117a59e55221e6c5d1751d0b40ae?apiKey=39e7f970288f4e2bb51544d854259214&"
                className="aspect-[2.33] object-contain object-center w-[974px] max-w-full mt-64 self-start max-md:mt-10"
              />
              <div className="relative items-stretch border bg-neutral-800 self-center flex w-[30px] flex-col ml-60 mt-14 px-1.5 py-1.5 border-solid border-zinc-300 border-opacity-20 max-md:mt-10">
                <div className="flex flex-col items-stretch py-2">
                  <div className="bg-stone-300 z-10 flex shrink-0 h-3 flex-col" />
                  <div className="bg-stone-300 flex shrink-0 h-0.5 flex-col" />
                </div>
                <div className="flex aspect-square flex-col justify-center items-stretch mt-2 px-1 py-2.5">
                  <div className="bg-stone-300 flex shrink-0 h-0.5 flex-col" />
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
