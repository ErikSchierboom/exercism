pub fn LinkedList(comptime T: type) type {
    return struct {
        const Self = @This();

        pub const Node = struct {
            prev: ?*Node = null,
            next: ?*Node = null,
            data: T = undefined,

            pub fn insertAfter(self: *Node, node: *Node) void {
                node.next = self;
                self.prev = node;
            }

            pub fn insertBefore(self: *Node, node: *Node) void {
                node.prev = self;
                self.next = node;
            }
        };

        first: ?*Node = null,
        last: ?*Node = null,
        len: u32 = 0,

        pub fn push(self: *Self, node: *Node) void {
            if (self.last == null) {
                self.first = node;
            } else {
                node.insertAfter(self.last.?);
            }

            self.last = node;
            self.len += 1;
        }

        pub fn pop(self: *Self) ?*Node {
            const last = self.last orelse return null;
            self.last = last.prev;
            self.len -= 1;
            if (self.len == 0) self.first = null;
            return last;
        }

        pub fn shift(self: *Self) ?*Node {
            const first = self.first orelse return null;
            self.first = first.next;
            self.len -= 1;
            if (self.len == 0) self.last = null;
            return first;
        }

        pub fn unshift(self: *Self, node: *Node) void {
            if (self.first == null) {
                self.last = node;
            } else {
                node.insertBefore(self.first.?);
            }

            self.first = node;
            self.len += 1;
        }

        pub fn delete(self: *Self, node: *Node) void {
            var current = self.first;

            while (current) |c| : (current = c.next) {
                if (c != node) continue;

                if (node.prev) |n| n.next = c.next;
                if (node.next) |n| n.prev = c.prev;

                if (node == self.first) self.first = c;
                if (node == self.last) self.last = c;

                self.len -= 1;
                return;
            }
        }
    };
}
