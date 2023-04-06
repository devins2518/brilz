const std = @import("std");

const Type = @import("type.zig").Type;
const Instruction = @import("Instruction.zig");

name: []const u8,
args: ?struct {
    name: []const u8,
    type: Type,
} = null,
type: ?Type = null,
instrs: []Instruction,
