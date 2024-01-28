import * as React from "react";
import { useEffect,useState } from "react";
import axios from "axios";
const url = "http://localhost:3000/cities";
export default function City(){
    const [cities,setCities] = useState([]);
    useEffect(()=>{
        const fetchData = async() => {
            try {
                const response = await axios.get(url); 
                setCities(response.data.cities);
            } catch (error) {
                console.log('Error Occured ',error.response);
            }
        }
        fetchData();
    },[])
const divs = []
for (let i = 0; i < cities.length; i++) {
    divs.push(<div key={cities[i]} className="items-stretch flex justify-between gap-1.5 text-xl whitespace-nowrap px-2.5 py-2">
    <div className="justify-center text-neutral-400 font-medium text-1xl grow shrink basis-auto">
        {cities[i]}
    </div>
</div>);
  }
    return(
        <div className="items-stretch backdrop-blur-[15px] bg-white bg-opacity-40 rounded-3xl border-solid border-white flex w-full flex-col">
        {/* {console.log(cities.cities)} */}
        {/* {cities.map(city=>{
            {console.log("hello")}
            <div key={city} className="items-stretch flex justify-between gap-1.5 text-xl whitespace-nowrap px-2.5 py-2">
            <div className="justify-center text-neutral-400 font-medium text-1xl grow shrink basis-auto">
                {city}
            </div>
        </div>
                    
                })} */}
                {divs}
        </div>
    );
}