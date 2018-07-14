export default class Garden {
    constructor(windowSills, children = ['Alice', 'Bob', 'Charlie', 'David', 'Eve', 'Fred', 'Ginny', 'Harriet', 'Ileana', 'Joseph', 'Kincaid', 'Larry']) {
        this.windowSills = windowSills.split("\n");
        this.children = children.sort();

        for (const index in this.children) {
            this.setPlantsForChild(index);
        }
    }

    setPlantsForChild(index) {
        const child = this.children[index].toLowerCase();
        this[child] = [
            this.plantCodeToPlant(this.windowSills[0][index * 2]),
            this.plantCodeToPlant(this.windowSills[0][index * 2 + 1]),
            this.plantCodeToPlant(this.windowSills[1][index * 2]),
            this.plantCodeToPlant(this.windowSills[1][index * 2 + 1])
        ];
    }

    plantCodeToPlant(code) {
        switch (code) {
            case 'V':
                return 'violets';
            case 'R':
                return 'radishes'; 
            case 'G':
                return 'grass';
            case 'C':
                return 'clover';
        }
    }
}