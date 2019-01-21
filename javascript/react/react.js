const cells = new Map();

export class Cell {
  constructor() {
    this.id = Cell.lastCellId++;
    this.consumers = new Map();

    cells.set(this.id, this);
  }

  get transitiveConsumerIds() {
    const consumersIds = new Set();

    for (const consumer of this.consumers.values()) {
      consumersIds.add(consumer.id);

      for (const transientConsumer of consumer.consumers.values()) {
        consumersIds.add(transientConsumer.id);
      }
    }

    return consumersIds;
  }
}

Cell.lastCellId = 1;

export class InputCell extends Cell {
  constructor(value) {
    super();
    this.value = value;
  }

  setValue(newValue) {
    if (newValue == this.value) {
      return;
    }

    this.value = newValue;

    for (let id = this.id + 1; id <= Cell.lastCellId; id++) {
      if (!this.transitiveConsumerIds.has(id)) {
        continue;
      }

      const consumer = cells.get(id);
      consumer.update();
    }
  }
}

export class ComputeCell extends Cell {
  constructor(producers, process) {
    super();
    this.producers = producers;
    this.process = process;
    this.callbacks = new Map();

    for (const producer of producers) {
      producer.consumers.set(this.id, this);
    }

    this.update();
  }

  update() {
    const newValue = this.process(this.producers);
    if (newValue !== this.value) {
      this.value = newValue;

      for (const callback of this.callbacks.values()) {
        callback.update(this);
      }
    }
  }

  addCallback(callback) {
    this.callbacks.set(callback.id, callback);
  }

  removeCallback(callback) {
    this.callbacks.delete(callback.id);
  }
}

export class CallbackCell extends Cell {
  constructor(mapping) {
    super();
    this.mapping = mapping;
    this.values = [];
  }

  update(cell) {
    this.values.push(this.mapping(cell));
  }
}
