///////////////////////////////////////////////////////////////////////////////
// 
// Renames and lists student exam papers alphabetically 
//
// Author: Rasmus Nielsen
//
///////////////////////////////////////////////////////////////////////////////


const std = @import("std");
const fs  = std.fs;

pub fn main() !void {
    // stdout is for the actual output of your application, for example if you
    // are implementing gzip, then only the compressed bytes should be sent to
    // stdout, not any debugging messages.
    const stdout_file = std.io.getStdOut().writer();
    var bw = std.io.bufferedWriter(stdout_file);
    const stdout = bw.writer();

    try stdout.print("Renaming student papers...\n", .{});
    try bw.flush(); // don't forget to flush!
    
    // Create iterator
    const dir = try std.fs.cwd().openIterableDir(".", .{});
    var iterator = dir.iterate();
    
    // Destination directory
    const dirDst = fs.cwd();

    // Iterate through directory of files 
    while (try iterator.next()) |path| {
        // Splt file name
        var splits = std.mem.split(u8, path.name, ".");
        
        // Iterate through the split
        while (splits.next()) | part | {
            
            // Check if file extension is .pdf
            var pdf: bool = std.mem.eql(u8, "pdf", part);
            if (pdf) {
                
                // Split file name to get student number and name
                var secSplit = std.mem.split(u8, path.name, "_");
                var secPart = secSplit.first();
                
                // Student number and name    
                var thiSplit = std.mem.split(u8, secPart, "-");
                
                var i: u8 = 0;
                while (thiSplit.next()) | thiPart | {
                    if (i == 1) { // Student name
                        // Rename file
                        const allocator = std.heap.page_allocator;
                        var fileName = std.fmt.allocPrint(allocator, 
                            "{s}.pdf", .{thiPart}) catch "format failed";
                        
                        try stdout.print("{s}\n", .{fileName});
                        
                        try fs.rename(dirDst, path.name, dirDst, fileName);
                        
                        try bw.flush(); // don't forget to flush!
                    }
                    i += 1;
                }
            }
        }
    }
}

