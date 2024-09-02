import React, { useState, useRef } from "react";

const ImportExams: React.FC = () => {
  const [fileName, setFileName] = useState<string>("Choose File");
  const [isDragging, setIsDragging] = useState<boolean>(false);
  const fileInputRef = useRef<HTMLInputElement | null>(null);

  const handleFileChange = (event: React.ChangeEvent<HTMLInputElement>) => {
    if (event.target.files && event.target.files.length > 0) {
      setFileName(event.target.files[0].name);
    } else {
      setFileName("Choose File");
    }
  };

  const handleDragEnter = (event: React.DragEvent<HTMLDivElement>) => {
    event.preventDefault();
    event.stopPropagation();
    setIsDragging(true);
  };

  const handleDragOver = (event: React.DragEvent<HTMLDivElement>) => {
    event.preventDefault();
    event.stopPropagation();
  };

  const handleDragLeave = (event: React.DragEvent<HTMLDivElement>) => {
    event.preventDefault();
    event.stopPropagation();
    setIsDragging(false);
  };

  const handleDrop = (event: React.DragEvent<HTMLDivElement>) => {
    event.preventDefault();
    event.stopPropagation();
    setIsDragging(false);

    if (event.dataTransfer.files && event.dataTransfer.files.length > 0) {
      setFileName(event.dataTransfer.files[0].name);

      // Set file input manually
      if (fileInputRef.current) {
        fileInputRef.current.files = event.dataTransfer.files;
      }
    }
  };

  return (
    <>
      <div className="flex justify-center mt-10">
        <div
          className={`border-4 ${
            isDragging ? "border-dashed" : "border-purple2-0"
          } flex px-96 py-48 mr-4 text-2xl text-gray-500`}
          onDragEnter={handleDragEnter}
          onDragOver={handleDragOver}
          onDragLeave={handleDragLeave}
          onDrop={handleDrop}
        >
          <label className="text-gray-400 px-4 py-1 rounded cursor-pointer text-center font-semibold">
            {fileName}
            <input
              type="file"
              className="hidden"
              ref={fileInputRef}
              onChange={handleFileChange}
            />
          </label>
        </div>
      </div>
      <div className="flex justify-end mr-4 mt-2 mb-2">
            <button className="bg-purple2-0 px-5 py-1 rounded-md cursor-pointer hover:bg-purple1-0">
                Prosses File
            </button>
        </div>
    
    </>
  );
};

export default ImportExams;
