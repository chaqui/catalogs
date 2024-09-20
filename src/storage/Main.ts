import { MongoClient, Db, Collection } from 'mongodb';
import * as dotenv from "dotenv";
export default class Main{
    collectionName: string;
    constructor(collectionName:string){
        this.collectionName = collectionName;
    }
    protected async connectToMongoDB(): Promise<Collection> {
        dotenv.config();
        const uri: string = process.env.DB_CONN_STRING || '';
        console.log("Mongo URI: ", uri);
        const client = new MongoClient(uri);
    
        try {
            await client.connect();
            console.log('Connected to MongoDB');
            
            const dbName = process.env.DB_NAME || 'catalogs';
            console.log("Database name: ", dbName);
            const db: Db = client.db(dbName);
    
            const collectionName = process.env.SYSTEMS_COLLECTION_NAME || 'systems';
            console.log("Collection name: ", collectionName);
            return db.collection(collectionName);
    
        } catch (error) {
            console.error('Error connecting to MongoDB:', error);
            throw error;
        } 
    }

}
