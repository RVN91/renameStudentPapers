const std = @import("std");

pub fn build(b: *std.build.Builder) void {
    
    // Standard target options allows the person running `zig build` to choose
    // what target to build for. Here we do not override the defaults, which
    // means any target is allowed, and the default is native. Other options
    // for restricting supported target set are available.
    const target = b.standardTargetOptions(.{});

    // Standard release options allow the person running `zig build` to select
    // between Debug, ReleaseSafe, ReleaseFast, and ReleaseSmall.
    const optimize = b.standardOptimizeOption(.{});

    const exe = b.addExecutable(.{
        .name = "renameStudentPapers",
        .root_source_file = .{ .path = "src/main.zig"},
        .target = target,
        .optimize = optimize,
    });
        
    
    b.installArtifact(exe);

    const run_exe = b.addRunArtifact(exe);
    
    const run_step = b.step("run", "Run the application");

    run_step.dependOn(&run_exe.step);

}
