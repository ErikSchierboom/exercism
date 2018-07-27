object HelloWorld {
    fun hello(name: String? = "World"): String {
        val normalizedName = if (name.isNullOrBlank()) "World" else name
        return "Hello, $normalizedName!"
    }
}