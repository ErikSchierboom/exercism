package two_fer

import "core:fmt"

two_fer :: proc(name: string = "you") -> string {
	return fmt.tprintf("One for %s, one for me.", name)
}
