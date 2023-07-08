namespace targets
{
    class Alien
    {
    public:
        Alien(int x, int y)
        {
            x_coordinate = x;
            y_coordinate = y;
        }

        int x_coordinate;
        int y_coordinate;

        int get_health() { return health; }

        bool hit()
        {
            --health;
            return true;
        }

        bool is_alive() { return health > 0; }

        bool teleport(int x, int y)
        {
            x_coordinate = x;
            y_coordinate = y;
            return true;
        }

        bool collision_detection(Alien alien)
        {
            return x_coordinate == alien.x_coordinate &&
                   y_coordinate == alien.y_coordinate;
        }

    private:
        int health{3};
    };
} // namespace targets