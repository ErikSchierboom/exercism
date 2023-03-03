pub const SearchError = error{ ValueAbsent, EmptyBuffer };

pub fn binarySearch(comptime T: type, target: T, buffer: []const T) SearchError!usize {
    if (buffer.len == 0) return SearchError.EmptyBuffer;

    var left: usize = 0;
    var right = buffer.len;

    while (left < right) {
        const middle = (left + right) / 2;

        if (buffer[middle] == target)
            return middle;

        if (buffer[middle] < target) {
            left = middle + 1;
        } else {
            right = middle;
        }
    }

    return SearchError.ValueAbsent;
}
