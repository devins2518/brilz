const std = @import("std");
const BrilJson = @import("BrilJson.zig");

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const allocator = gpa.allocator();
    defer std.debug.assert(!gpa.deinit());
    var args = std.process.args();
    _ = args.skip();

    const file = args.next().?;
    const contents = try std.fs.cwd().readFileAlloc(allocator, file, 0xFFFFFFFF);
    defer allocator.free(contents);
    var tokens = std.json.TokenStream.init(contents);
    const bril = try std.json.parse(BrilJson, &tokens, .{ .allocator = allocator });
    defer std.json.parseFree(BrilJson, bril, .{ .allocator = allocator });
    var basic_blocks = bril.toBril(allocator);
    defer basic_blocks.deinit();
}

test "static analysis" {
    std.testing.refAllDeclsRecursive(@This());
}
