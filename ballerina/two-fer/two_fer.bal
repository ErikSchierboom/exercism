public function speak(string? name) returns string {
    return string `One for ${name ?: "you"}, one for me.`;
}
