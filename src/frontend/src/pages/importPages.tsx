import React from "react";
import ImportExams from "../components/admin/importExam.js";
import Sidebar from "../components/sidebar.js";
import Navbar from "../components/navbar.js";

const Importfile : React.FC = () => {
    return(
        <>
         <Navbar/>
         <div className="flex">
         <Sidebar/>
         <div className="ml-4">
         <ImportExams/>
         </div>
        
         </div>
        </>
       

    )
}

export default Importfile