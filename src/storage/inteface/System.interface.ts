import System from "../../models/mongo/System.model";


export default interface SystemCatalogInterface {
    create(system: System): Promise<any>;
    read(id: string): Promise<any>;
    update(id: string, system: any): Promise<any>;
    delete(id: string): Promise<boolean>;
    readAll(): Promise<any[]>;
}