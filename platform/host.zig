const std = @import("std");
const RocList = @import("src/list.zig").RocList;
const builtin = @import("builtin");

comptime {
    if (builtin.target.cpu.arch != .wasm32) {
        @compileError("This platform is for WebAssembly only. You need to pass `--target wasm32` to the Roc compiler.");
    }
}

const Align = extern struct { a: usize, b: usize };
extern fn malloc(size: usize) callconv(.C) ?*align(@alignOf(Align)) anyopaque;
extern fn realloc(c_ptr: [*]align(@alignOf(Align)) u8, size: usize) callconv(.C) ?*anyopaque;
extern fn free(c_ptr: [*]align(@alignOf(Align)) u8) callconv(.C) void;
extern fn memcpy(dest: *anyopaque, src: *anyopaque, count: usize) *anyopaque;

export fn roc_alloc(size: usize, alignment: u32) callconv(.C) ?*anyopaque {
    _ = alignment;

    return malloc(size);
}

export fn roc_realloc(c_ptr: *anyopaque, new_size: usize, old_size: usize, alignment: u32) callconv(.C) ?*anyopaque {
    _ = old_size;
    _ = alignment;

    return realloc(@alignCast(@alignOf(Align), @ptrCast([*]u8, c_ptr)), new_size);
}

export fn roc_dealloc(c_ptr: *anyopaque, alignment: u32) callconv(.C) void {
    _ = alignment;

    free(@alignCast(@alignOf(Align), @ptrCast([*]u8, c_ptr)));
}

export fn roc_memcpy(dest: *anyopaque, src: *anyopaque, count: usize) callconv(.C) void {
    _ = memcpy(dest, src, count);
}

pub extern fn roc__mainForHost_1_exposed_generic(arg: *RocList, ret: *RocList) void;

pub fn main() !void {

    const stdout = std.io.getStdOut().writer(); 

    const helloStr = "hello, world!";
    var arg = RocList.fromSlice(u8, helloStr[0..]);
    var ret = RocList.empty();

    roc__mainForHost_1_exposed_generic(&arg, &ret);

    const maybeBytes = ret.elements(u8);
    const bytes = maybeBytes orelse {
        std.debug.print("Error getting elements\n", .{});
        std.process.exit(1);
    };

    const array_len: usize = ret.len();
    const byteSlice = bytes[0..array_len];

    try stdout.writeAll(byteSlice); // Write the slice to stdout

}