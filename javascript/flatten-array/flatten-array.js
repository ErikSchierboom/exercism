export default class Flattener {
  flatten(input) {
    return input
      .filter(element => element !== null && element !== undefined)
      .reduce(
        (acc, element) =>
          acc.concat(
            Array.isArray(element) ? this.flatten(element) : [element]
          ),
        []
      );
  }
}
