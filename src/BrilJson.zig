const std = @import("std");
const BasicBlock = @import("BasicBlock.zig");
const Bril = @import("Bril.zig");

// Data type to map bril directly from its JSON representation.
const FunctionJson = struct {
    const InstructionJson = struct {
        op: ?Bril.Op = null,
        dest: ?[]const u8 = null,
        type: ?Bril.Type = null,
        args: ?[]const []const u8 = null,
        funcs: ?[]const []const u8 = null,
        labels: ?[]const []const u8 = null,
        value: ?union(Bril.Type) {
            int: i64,
            boolean: bool,
        } = null,
    };
    name: []const u8,
    args: ?[]struct {
        name: []const u8,
        type: Bril.Type,
    } = null,
    type: ?Bril.Type = null,
    instrs: []InstructionJson,
};
functions: []FunctionJson,

pub fn toBril(self: *const @This(), allocator: std.mem.Allocator) std.ArrayList(BasicBlock) {
    var blocks = std.ArrayList(BasicBlock).init(allocator);
    for (self.functions) |f| {
        _ = f;
    }
    return blocks;
}
