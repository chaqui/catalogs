export default class  Catalog {
    id: number;
    name: string;
    description: string;
    items: any[];

    constructor(id: number, name: string, description: string, items: any[]) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.items = items;
    }
}