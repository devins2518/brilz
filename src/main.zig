const std = @import("std");
const Program = @import("Program.zig");

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
    const program = try std.json.parse(Program, &tokens, .{ .allocator = allocator });
    defer std.json.parseFree(Program, program, .{ .allocator = allocator });
}

test "static analysis" {
    _ = @import("Program.zig");
    std.testing.refAllDeclsRecursive(@This());
}
