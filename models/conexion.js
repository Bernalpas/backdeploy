

const mongoose = require('mongoose');
require('dotenv').config();
const URL = process.env.URL;
const URL_LOCAL = process.env.URL_LOCAL;

//mongodb+srv://silciampe:${DB_PASSWORD}@cluster0.ls4myza.mongodb.net/${DB_NAME}

console.log(URL_LOCAL);
console.log(URL);

    
    const conexion = mongoose.connect(URL);
    
    conexion.then(() => {
        console.log('Base de datos conectada');
    }).catch((err) => {
        console.log(err);
    }); 

    
    module.exports = conexion;


