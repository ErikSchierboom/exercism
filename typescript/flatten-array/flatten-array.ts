export default class FlattenArray {
    // tslint:disable-next-line:no-any
    static flatten(input: any[]): any[] {
        return input
            .filter((element) => element !== undefined)
            .reduce((acc, element) => acc.concat(Array.isArray(element) ? this.flatten(element) : [element]), [])
    }
}