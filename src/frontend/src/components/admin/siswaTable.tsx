import React, { useState, useEffect } from "react";

interface Teacher {
  id: number;
  nis: number;
  nama: string;
  sandi: string;
  id_kelas: string;
}

const Teacher: React.FC = () => {
  const [teachers, setTeachers] = useState<Teacher[]>([]);

  useEffect(() => {
    fetch("http://localhost:7774/api/siswa")
      .then((response) => response.json())
      .then((data) => setTeachers(data))
      .catch((error) => console.error("Error fetching data:", error));
  }, []);

  return (
    <>
        <div className="flex justify-center py-36">
          <div className="overflow-x-auto">
            <table className="min-w-full bg-purple-100">
              <thead>
                <tr className="border border-black">
                  <th className="px-12 py-1 text-center text-xs font-medium text-black uppercase tracking-wider ">NO</th>
                  <th className="px-6 py-1 text-center text-xs font-medium text-black uppercase tracking-wider">NIS</th>
                  <th className="px-6 py-1 text-center text-xs font-medium text-black uppercase tracking-wider">Nama</th>
                  <th className="px-9 py-1 text-center text-xs font-medium text-black uppercase tracking-wider">Sandi</th>
                  <th className="px-6 py-1 text-center text-xs font-medium text-black uppercase tracking-wider">Kelas</th>
                  <button className="absolute mx-6 px-6 border border-black">ADD</button>
                </tr>
              </thead>
              <br/>
              <tbody>
                {teachers.map((teacher, index) => (
                  <tr key={teacher.id}>
                    <td className="px-6 py-2 text-center border border-black text-sm font-medium text-gray-900">{index + 1}</td>
                    <td className="px-6 py-2 text-center border border-black text-sm text-black">{teacher.nis}</td>
                    <td className="px-6 py-2 text-center border border-black text-sm text-black">{teacher.nama}</td>
                    <td className="px-6 py-2 text-center border border-black text-sm text-black">{teacher.sandi}</td>
                    <td className="px-6 py-2 text-center border border-black text-sm text-black">{teacher.id_kelas}</td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        </div>
    </>
  );
};

export default Teacher;






// import React, { useState, useEffect } from "react";

// // Definisikan antarmuka untuk siswa
// interface Siswa {
//   id: number;
//   nis: string;
//   nama: string;
//   sandi: string;
//   id_kelas: string;
// }

// const Teacher: React.FC = () => {
//   const [teacherMap, setTeacherMap] = useState<Map<number, Siswa>>(new Map()); // State untuk menyimpan data siswa sebagai Map

//   useEffect(() => {
//     // Fetch data dari API ketika komponen pertama kali di-mount
//     fetch("http://localhost:7774/api/siswa")
//       .then((response) => response.json())
//       .then((data) => {
//         console.log(data); // Debugging: Tampilkan data yang diterima dari API
        
//         // Konversi objek yang diterima dari API menjadi Map
//         const map = new Map<number, Siswa>();
//         (Object.values(data) as Siswa[]).forEach((siswa: Siswa) => {
//           map.set(siswa.id, siswa); // Menggunakan id siswa sebagai kunci
//         });
        
//         setTeacherMap(map); // Set state dengan Map yang sudah terbentuk
//       })
//       .catch((error) => console.error("Error fetching data:", error));
//   }, []);

//   return (
//     <div className="flex justify-center py-36">
//       <div className="overflow-x-auto">
//         <table className="min-w-full bg-purple-100">
//           <thead>
//             <tr className="border border-black">
//               <th className="px-12 py-1 text-left text-xs font-medium text-black uppercase tracking-wider">No</th>
//               <th className="px-6 py-1 text-left text-xs font-medium text-black uppercase tracking-wider">NIS</th>
//               <th className="px-6 py-1 text-left text-xs font-medium text-black uppercase tracking-wider">Nama</th>
//               <th className="px-9 py-1 text-left text-xs font-medium text-black uppercase tracking-wider">Sandi</th>
//               <th className="px-6 py-1 text-left text-xs font-medium text-black uppercase tracking-wider">Kelas</th>
//               <button className="absolute mx-6 px-6 border border-black">ADD</button>
//             </tr>
//           </thead>
//           <br />
//           <tbody>
//             {Array.from(teacherMap.values()).map((teacher, index) => (
//               <tr key={teacher.id}>
//                 <td className="px-6 py-2 text-center border border-black text-sm font-medium text-gray-900">{index + 1}</td>
//                 <td className="px-6 py-2 text-center border border-black text-sm text-black">{teacher.nis}</td>
//                 <td className="px-6 py-2 text-center border border-black text-sm text-black">{teacher.nama}</td>
//                 <td className="px-6 py-2 text-center border border-black text-sm text-black">{teacher.sandi}</td>
//                 <td className="px-6 py-2 text-center border border-black text-sm text-black">{teacher.id_kelas}</td>
//               </tr>
//             ))}
//           </tbody>
//         </table>
//       </div>
//     </div>
//   );
// };

// export default Teacher;
