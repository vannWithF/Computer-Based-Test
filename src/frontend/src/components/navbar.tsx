import React from "react";

import Penus from "/assets/penus.png";

const Navbar: React.FC = () => {
    return (
        <nav className="w-full flex flex-col justify-between bg-white sticky top-0">
        <div className="flex justify-between border-b-2">
            <span className="bg-white rounded-full w-14 h-14`x place-self-center ml-11" >
                <img src={Penus} alt="logo penus" className="w-full" />
            </span>
            <div className="flex items-center justify-between">
                <div className="clippath bg-purple1-0 w-[800px] h-12 mb-2 "></div>
            </div>
        </div>
        <div className="w-full h-8 bg-purple2-0 mt-3"></div>
        </nav>
    )
}

export default Navbar;
