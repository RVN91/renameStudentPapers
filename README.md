# renameStudentPapers
 
 Writtin in <a href="https://ziglang.org/">Zig 0.10.0</a> to change the file names of the student papers (PDF-files) in the current working directory, so that Windows sorts them correctly.

 * The binary is statically linked and the only dependencies are the Windows Kernel Dll's (kernel32 and ntdll).

 ## Usage

 Compile and run using Zig from a directory with the student papers from the Digital Exam (DE):

 * zig build run
