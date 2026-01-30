package two_fer

import "core:fmt"

two_fer :: proc(name: string = "") -> string {
	name := "you" if name == "" else name
	return fmt.aprintf("One for %s, one for me.", name)
}
