const std = @import("std");
/// Zig version. When writing code that supports multiple versions of Zig, prefer
/// feature detection (i.e. with `@hasDecl` or `@hasField`) over version checks.
pub const zig_version = std.SemanticVersion.parse("0.9.1") catch unreachable;
/// Temporary until self-hosted is feature complete.
pub const zig_is_stage2 = false;
/// Temporary until self-hosted supports the `cpu.arch` value.
pub const stage2_arch: std.Target.Cpu.Arch = .x86_64;
/// Temporary until self-hosted can call `std.Target.x86.featureSetHas` at comptime.
pub const stage2_x86_cx16 = true;

pub const output_mode = std.builtin.OutputMode.Exe;
pub const link_mode = std.builtin.LinkMode.Static;
pub const is_test = false;
pub const single_threaded = false;
pub const abi = std.Target.Abi.gnu;
pub const cpu: std.Target.Cpu = .{
    .arch = .x86_64,
    .model = &std.Target.x86.cpu.haswell,
    .features = std.Target.x86.featureSet(&[_]std.Target.x86.Feature{
        .@"64bit",
        .aes,
        .avx,
        .avx2,
        .bmi,
        .bmi2,
        .cmov,
        .cx16,
        .cx8,
        .ermsb,
        .f16c,
        .false_deps_lzcnt_tzcnt,
        .false_deps_popcnt,
        .fast_15bytenop,
        .fast_scalar_fsqrt,
        .fast_shld_rotate,
        .fast_variable_crosslane_shuffle,
        .fast_variable_perlane_shuffle,
        .fma,
        .fsgsbase,
        .fxsr,
        .idivq_to_divl,
        .invpcid,
        .lzcnt,
        .macrofusion,
        .mmx,
        .movbe,
        .nopl,
        .pclmul,
        .popcnt,
        .rdrnd,
        .sahf,
        .slow_3ops_lea,
        .sse,
        .sse2,
        .sse3,
        .sse4_1,
        .sse4_2,
        .ssse3,
        .vzeroupper,
        .x87,
        .xsave,
        .xsaveopt,
    }),
};
pub const os = std.Target.Os{
    .tag = .windows,
    .version_range = .{ .windows = .{
        .min = .win10_fe,
        .max = .win10_fe,
    }},
};
pub const target = std.Target{
    .cpu = cpu,
    .os = os,
    .abi = abi,
};
pub const object_format = std.Target.ObjectFormat.coff;
pub const mode = std.builtin.Mode.Debug;
pub const link_libc = false;
pub const link_libcpp = false;
pub const have_error_return_tracing = true;
pub const valgrind_support = true;
pub const position_independent_code = true;
pub const position_independent_executable = false;
pub const strip_debug_info = false;
pub const code_model = std.builtin.CodeModel.default;
