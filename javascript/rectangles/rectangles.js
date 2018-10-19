function range(begin, count) {
    return Array.from({ length: count }, (_, k) => k + begin);
}

const CellType = {
    Empty: 0,
    Corner: 1,
    HorizontalLine: 2,
    VerticalLine: 3
}

export default class Rectangles  {
    static count(rows) {
        const grid = this.parseGrid(rows);
        const corners = this.findCorners(grid);
        return corners.map((corner) => this.rectangleForCorner(corner, corners, grid)).reduce((acc, current) => acc + current, 0);
    }

    static parseGrid(rows) {
        return rows.map((row) => this.parseRow(row));
    }

    static parseRow(row) {
        return Array.from(row, this.parseCell);
    }

    static parseCell(cell) {
        switch (cell) {
            case '+':
                return CellType.Corner;
            case '-':
                return CellType.HorizontalLine;
            case '|':
                return CellType.VerticalLine;
            case ' ':
                return CellType.Empty;
            default:
                throw new Error();
        }
    }

    static rows(grid) {
        return grid.length;
    }

    static cols(grid) {
        return grid[0].length;
    }

    static cell(point, grid) {
        return grid[point.y][point.x];
    }

    static findCorners(grid) {
        return this.points(grid).filter((point) => this.cell(point, grid) === CellType.Corner);
    }

    static points(grid) {
        const points = [];

        range(0, this.rows(grid)).forEach((y) =>
            points.push(...range(0, this.cols(grid)).map((x) => ({ x, y }))));

        return points;
    }

    static connectsVertically(point, grid) {
        return this.cell(point, grid) === CellType.VerticalLine || this.cell(point, grid) === CellType.Corner;
    }

    static connectedVertically(top, bottom, grid) {
        return range(top.y + 1, bottom.y - top.y - 1).every((y) => this.connectsVertically({ x: top.x, y }, grid));
    }

    static connectsHorizontally(point, grid) {
        return this.cell(point, grid) === CellType.HorizontalLine || this.cell(point, grid) === CellType.Corner;
    }

    static connectedHorizontally(left, right, grid) {
        return range(left.x + 1, right.x - left.x - 1).every((x) => this.connectsHorizontally({ x, y: left.y}, grid));
    }

    static isTopLineOfRectangle(topLeft, topRight, grid) {
        return (topRight.x > topLeft.x) && (topRight.y === topLeft.y) && this.connectedHorizontally(topLeft, topRight, grid);
    }

    static isRightLineOfRectangle(topRight, bottomRight, grid) {
        return (bottomRight.x === topRight.x) && (bottomRight.y > topRight.y) && this.connectedVertically(topRight, bottomRight, grid);
    }

    static isBottomLineOfRectangle(bottomLeft, bottomRight, grid) {
        return (bottomRight.x > bottomLeft.x) && (bottomRight.y === bottomLeft.y) && this.connectedHorizontally(bottomLeft, bottomRight, grid);
    }

    static isLeftLineOfRectangle(topLeft, bottomLeft, grid) {
        return (bottomLeft.x === topLeft.x) && (bottomLeft.y > topLeft.y) && this.connectedVertically(topLeft, bottomLeft, grid);
    }

    static rectangleForCorner(topLeft, corners, grid) {
        const topRight = corners.filter((corner) => this.isTopLineOfRectangle(topLeft, corner, grid));
        const bottomLeft = corners.filter((corner) => this.isLeftLineOfRectangle(topLeft, corner, grid));

        return corners.filter((corner) =>
                    topRight.some((topRightCorner) => this.isRightLineOfRectangle(topRightCorner, corner, grid)) &&
                    bottomLeft.some((bottomLeftCorner) => this.isBottomLineOfRectangle(bottomLeftCorner, corner, grid))).length;
    }
}