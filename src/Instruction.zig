const std = @import("std");
const Type = @import("type.zig").Type;

pub const Op = enum {
    @"const",
    add,
    sub,
    mul,
    div,
    eq,
    lt,
    gt,
    le,
    ge,
    not,
    @"and",
    @"or",
    jmp,
    br,
    call,
    ret,
    id,
    print,
    nop,
};

op: Op,
dest: ?[]const u8 = null,
type: ?Type = null,
args: ?[]const []const u8 = null,
funcs: ?[]const []const u8 = null,
labels: ?[]const []const u8 = null,
value: ?union(Type) {
    int: i64,
    boolean: bool,
} = null
