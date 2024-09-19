import { MongoClient, Db, Collection } from 'mongodb';
import * as dotenv from "dotenv";
export default class Main{
    collectionName: string;
    constructor(collectionName:string){
        this.collectionName = collectionName;
    }
    protected async  connectToMongoDB():Promise<Collection> {
        dotenv.config();
        const uri:string = process.env.DB_CONN_STRING || '';
        
        const client = new MongoClient(uri);
    
        try {
            await client.connect();
            console.log('Connected to MongoDB');
            const db: Db = client.db(process.env.DB_NAME);
            return db.collection(this.collectionName);
    
        } catch (error) {
            console.error('Error connecting to MongoDB:', error);
            throw error;
        }
    } 

}
