import React from "react";
import Reports from "/assets/report.png"
import soal from "/assets/soal.png"
import classes from "/assets/training.png"
import collection from "/assets/collection.png"
import exit from "/assets/exit.png"

const Sidebar: React.FC = () => {
    return (
        <aside className="w-72 flex flex-col h-full justify-center items-center gap-12 max-w-72 my-6">
            <div className='flex justify-center items-center gap-5 w-full'>
                <div className='h-16 w-16 rounded-full bg-purple-300 '></div>
                <div className='h-11 w-1/2 rounded-lg bg-purple-300'></div>
            </div>
            <ul className="bg-purple-300 w-4/5 h-3/4 mx-auto flex flex-col rounded-xl p-3">
                <li className="border-b-2 border-black px-1 py-2 flex items-center"><img src={soal} className="size-8 mx-2" alt="" /> New Questions</li>
                <li className="px-1 py-2 flex items-center"><img src={Reports} className="size-8 mx-2" alt="" />Reports</li>
                <li className="px-1 py-2 flex items-center"><img src={classes} className="size-8 mx-2" alt="" />Classes</li>
                <li className="px-1 py-2 flex items-center"><img src={collection} className="size-8 mx-2" alt="" />Collections</li>
                <li className="px-1 py-2 mt-16 flex items-center"><img src={exit} className="size-8 mx-2" alt="" /> Logout</li>
            </ul>
        </aside>
    )
}

export default Sidebar;
