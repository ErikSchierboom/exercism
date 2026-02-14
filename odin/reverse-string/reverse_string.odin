package reverse_string

import "core:strings"
import "core:slice"
import "core:unicode/utf8"
import "core:fmt"

reverse :: proc(str: string) -> string {
	graphemes, grapheme_count, _, _ := utf8.decode_grapheme_clusters(str, allocator = context.temp_allocator)

	sb := strings.builder_make()
	#reverse for grapheme, i in graphemes {
		if i == grapheme_count - 1 {
			strings.write_string(&sb, str[grapheme.byte_index:])
		} else {
			strings.write_string(&sb, str[grapheme.byte_index:graphemes[i + 1].byte_index])
		}
	}

	return strings.to_string(sb)
}
