import React, { useState, useEffect } from "react";
import Reports from "/assets/report.png";
import soal from "/assets/soal.png";
import classes from "/assets/training.png";
import collection from "/assets/collection.png";
import exit from "/assets/exit.png";

// Interface untuk tipe data teacher
interface Teacher {
  id: number;
  nama: string;
}

const Sidebar: React.FC = () => {
  const [teachers, setTeachers] = useState<Teacher[]>([]);
  const [loading, setLoading] = useState<boolean>(true);

  useEffect(() => {
    const fetchTeachers = async () => {
      try {
        const token = localStorage.getItem('authToken');
        if (!token) {
          console.error('No authentication token found.');
          return;
        }
        
        const response = await fetch('https://49kdgk28-7774.asse.devtunnels.ms', {
          headers: {
            'Authorization': `Bearer ${token}`
          }
        });
        const data = await response.json();
        setTeachers(data);
      } catch (error) {
        console.error('Error fetching teachers:', error);
      } finally {
        setLoading(false);
      }
    };

    fetchTeachers();
  }, []);

  const firstTeacherName = teachers.length > 0 ? teachers[0].nama: "No Teacher Available";

  return (
    <aside className="w-72 flex flex-col h-full justify-center items-center gap-12 max-w-72 my-6">
      {loading ? (
        <div>Loading...</div>
      ) : (
        <div className="h-16 w-64 rounded-lg bg-purple2-0 flex items-center justify-center text-white font-bold p-4">
          {firstTeacherName}
        </div>
      )}
      <ul className="w-4/5 h-3/4 mx-auto flex flex-col rounded-xl gap-2 p-3 bg-purple2-0">
        <li className="hover:border-b-2 hover:border-black ease-linear transition-transform duration-[3s] px-1 py-2 flex items-center">
          <img src={soal} className="size-7 mx-2" alt="New Questions Icon" /> New Questions
        </li>
        <li className="hover:border-b-2 hover:border-black ease-linear transition-transform duration-[3s] px-1 py-2 flex items-center">
          <img src={Reports} className="size-6 mx-2" alt="Reports Icon" /> Reports
        </li>
        <li className="hover:border-b-2 hover:border-black ease-linear transition-transform duration-[3s] px-1 py-2 flex items-center">
          <img src={classes} className="size-6 mx-2" alt="Classes Icon" /> Classes
        </li>
        <li className="hover:border-b-2 hover:border-black ease-linear transition-transform duration-[3s] px-1 py-2 flex items-center">
          <img src={collection} className="size-6 mx-2" alt="Collections Icon" /> Collections
        </li>
        <li className="hover:border-b-2 hover:border-black ease-linear transition-transform duration-[3s] px-1 py-2 mt-32 flex items-center">
          <img src={exit} className="size-6 mx-2" alt="Logout Icon" /> Logout
        </li>
      </ul>
    </aside>
  );
};

export default Sidebar;
