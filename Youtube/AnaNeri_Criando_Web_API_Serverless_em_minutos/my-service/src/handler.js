'use strict';
const MongoClient = require('mongodb').MongoClient;

module.exports.putData = async(event) => {
  const client = new MongoClient('mongodb://mongodb:27017', {useUnifiedTopology: true});
  await client.connect();

  const db = client.db('mydb');
  const collection = db.collection('mycollection');

  const data = JSON.parse(event.body);
  await collection.insertOne(data);

  await client.close();

  return {
    statusCode: 200,
    body: JSON.stringify({message: 'VEIO AQUIIIIIIII'})
  };
};