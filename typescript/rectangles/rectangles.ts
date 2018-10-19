function range(begin: number, count: number): number[] {
    return Array.from({ length: count }, (_, k) => k + begin)
}

enum CellType {
    Empty,
    Corner,
    HorizontalLine,
    VerticalLine
}

type Point = { x: number; y: number }

export default class Rectangles  {
    public static count(rows: string[]): number {
        const grid = this.parseGrid(rows)
        const corners = this.findCorners(grid)
        return corners.map((corner) => this.rectangleForCorner(corner, corners, grid)).reduce((acc, current) => acc + current, 0)
    }

    private static parseGrid(rows: string[]): CellType[][] {
        return rows.map((row) => this.parseRow(row))
    }

    private static parseRow(row: string): CellType[] {
        return Array.from(row, this.parseCell)
    }

    private static parseCell(cell: string): CellType {
        switch (cell) {
            case '+':
                return CellType.Corner
            case '-':
                return CellType.HorizontalLine
            case '|':
                return CellType.VerticalLine
            case ' ':
                return CellType.Empty
            default:
                throw new Error()
        }
    }

    private static rows(grid: CellType[][]): number {
        return grid.length
    }

    private static cols(grid: CellType[][]): number {
        return grid[0].length
    }

    private static cell(point: Point, grid: CellType[][]): CellType {
        return grid[point.y][point.x]
    }

    private static findCorners(grid: CellType[][]): Point[] {
        return this.points(grid).filter((point) => this.cell(point, grid) === CellType.Corner)
    }

    private static points(grid: CellType[][]): Point[] {
        const points: Point[] = []

        range(0, this.rows(grid)).forEach((y) =>
            points.push(...range(0, this.cols(grid)).map((x) => ({ x, y }))))

        return points
    }

    private static connectsVertically(point: Point, grid: CellType[][]): boolean {
        return this.cell(point, grid) === CellType.VerticalLine || this.cell(point, grid) === CellType.Corner
    }

    private static connectedVertically(top: Point, bottom: Point, grid: CellType[][]): boolean {
        return range(top.y + 1, bottom.y - top.y - 1).every((y) => this.connectsVertically({ x: top.x, y }, grid))
    }

    private static connectsHorizontally(point: Point, grid: CellType[][]): boolean {
        return this.cell(point, grid) === CellType.HorizontalLine || this.cell(point, grid) === CellType.Corner
    }

    private static connectedHorizontally(left: Point, right: Point, grid: CellType[][]): boolean {
        return range(left.x + 1, right.x - left.x - 1).every((x) => this.connectsHorizontally({ x, y: left.y}, grid))
    }

    private static isTopLineOfRectangle(topLeft: Point, topRight: Point, grid: CellType[][]): boolean {
        return (topRight.x > topLeft.x) && (topRight.y === topLeft.y) && this.connectedHorizontally(topLeft, topRight, grid)
    }

    private static isRightLineOfRectangle(topRight: Point, bottomRight: Point, grid: CellType[][]): boolean {
        return (bottomRight.x === topRight.x) && (bottomRight.y > topRight.y) &&
        this.connectedVertically(topRight, bottomRight, grid)
    }

    private static isBottomLineOfRectangle(bottomLeft: Point, bottomRight: Point, grid: CellType[][]): boolean {
        return (bottomRight.x > bottomLeft.x) && (bottomRight.y === bottomLeft.y) &&
        this.connectedHorizontally(bottomLeft, bottomRight, grid)
    }

    private static isLeftLineOfRectangle(topLeft: Point, bottomLeft: Point, grid: CellType[][]): boolean {
        return (bottomLeft.x === topLeft.x) && (bottomLeft.y > topLeft.y) && this.connectedVertically(topLeft, bottomLeft, grid)
    }

    private static rectangleForCorner(topLeft: Point, corners: Point[], grid: CellType[][]): number {
        const topRight = corners.filter((corner) => this.isTopLineOfRectangle(topLeft, corner, grid))
        const bottomLeft = corners.filter((corner) => this.isLeftLineOfRectangle(topLeft, corner, grid))

        return corners.filter((corner) =>
                    topRight.some((topRightCorner) => this.isRightLineOfRectangle(topRightCorner, corner, grid)) &&
                    bottomLeft.some((bottomLeftCorner) => this.isBottomLineOfRectangle(bottomLeftCorner, corner, grid))).length
    }
}