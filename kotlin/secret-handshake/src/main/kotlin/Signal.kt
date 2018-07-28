enum class Signal(val mask: Int) {
    WINK(0b00000001),
    DOUBLE_BLINK(0b00000010),
    CLOSE_YOUR_EYES(0b00000100),
    JUMP(0b00001000)
}
