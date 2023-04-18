const std = @import("std");
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

pub const Type = enum { int, boolean };

pub const Argument = struct {
    name: []const u8,
    type: Type,
};

pub const Instruction = union(Op) {
    const OneArg = struct { arg1: Argument };
    const TwoArg = struct {
        arg1: Argument,
        arg2: Argument,
    };
    const ThreeArg = struct {
        arg1: Argument,
        arg2: Argument,
        arg3: Argument,
    };
    @"const": OneArg,
    add: TwoArg,
    sub: TwoArg,
    mul: TwoArg,
    div: TwoArg,
    eq: TwoArg,
    lt: TwoArg,
    gt: TwoArg,
    le: TwoArg,
    ge: TwoArg,
    not: TwoArg,
    @"and": TwoArg,
    @"or": TwoArg,
    jmp: ThreeArg,
    br: ThreeArg,
    call: OneArg,
    ret,
    id: OneArg,
    // TODO: var args
    print,
    nop,
};

pub const Function = struct {
    name: []const u8,
    args: []const Argument,
    return_type: Type,
    instructions: std.ArrayList(Instruction),
};

functions: std.ArrayList(Function),
