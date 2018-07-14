class Triangle(x: Double, y: Double, z: Double) {
    constructor(x: Int, y: Int, z: Int) : this(x.toDouble(), y.toDouble(), z.toDouble())

    init {
        require(x > 0.0 || y > 0.0 || z > 0.0)
        require(x + y >= z && x + z >= y && y + z >= x)
    }

    val isEquilateral = x == y && y == z
    val isIsosceles = x == y || y == z || x == z
    val isScalene = !isEquilateral && !isIsosceles
}