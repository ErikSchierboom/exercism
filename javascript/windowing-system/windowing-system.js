// @ts-check

export class Size {
  constructor(width = 80, height = 60) {
    this._width = width;
    this._height = height;
  }

  get width() {
    return this._width;
  }

  get height() {
    return this._height;
  }

  resize(width, height) {
    this._width = width;
    this._height = height;
  }
}

export class Position {
  constructor(x = 0, y = 0) {
    this._x = x;
    this._y = y;
  }

  get x() {
    return this._x;
  }

  get y() {
    return this._y;
  }

  move(x, y) {
    this._x = x;
    this._y = y;
  }
}

export class ProgramWindow {
  constructor() {
    this._screenSize = new Size(800, 600);
    this._size = new Size(80, 60);
    this._position = new Position();
  }

  get screenSize() {
    return this._screenSize;
  }

  get size() {
    return this._size;
  }

  get position() {
    return this._position;
  }

  resize(size) {
    const newWidth = Math.min(
      this._screenSize.width - this._position.x,
      Math.max(1, size.width)
    );
    const newHeight = Math.min(
      this._screenSize.height - this._position.y,
      Math.max(1, size.height)
    );
    this._size = new Size(newWidth, newHeight);
  }

  move(position) {
    const newX = Math.min(
      this._screenSize.width - this._size.width,
      Math.max(0, position.x)
    );
    const newY = Math.min(
      this._screenSize.height - this._size.height,
      Math.max(0, position.y)
    );
    this._position = new Position(newX, newY);
  }
}

export function changeWindow(programWindow) {
  programWindow.resize(new Size(400, 300));
  programWindow.move(new Position(100, 150));
  return programWindow;
}
