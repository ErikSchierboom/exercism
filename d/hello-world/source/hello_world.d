module hello_world;

string hello()
{
    return "Hello, World!";
}

unittest
{
    assert(hello() == "Hello, World!");
}
