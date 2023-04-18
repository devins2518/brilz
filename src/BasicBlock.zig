const std = @import("std");
const Instruction = struct {};

name: []const u8,
instructions: std.ArrayListUnmanaged(Instruction),
