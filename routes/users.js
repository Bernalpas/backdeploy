const express = require('express');
const router = express.Router();
const Persona = require('../models/persona');

/* GET users listing. Todos los usuarios */
router.get('/', async (req, res) => {

  //const personas = await Persona.find().lean();
  const personas = await Persona.find();
  res.json({
    personas: personas
  });

});

//Get por nombre/buscar por nombre de la persona
router.get('/buscar', async (req, res) => {

  const { nombre } = req.query;
  //const { dni } = req.query;

  console.log(`El cliente busca a ${nombre}`);
  //console.log(`El cliente busca a ${dni}`);

  const personas = await Persona.find({ nombre: nombre });
  //const personas = await Persona.find({ dni: dni });

  console.log(`La database rescponde con ${personas}`);

  res.json({ 
    personas: personas 
  });

});


//CRUD
//Create: Inseert listo
//READ: lectura de datos: listo
router.post('/crear', async (req, res) => {

  const { nombre, apellido, dni } = req.body;

  const persona = new Persona({
    nombre: nombre,
    apellido: apellido,
    dni: dni
  });

  await Persona.create(persona);

  console.log(`Soy el back y recibí estos datos ${nombre}, ${apellido}, ${dni}`)

  res.json({ 
    mensaje: 'Creamos un usuario'
  });
});

router.delete('/:id', (req, res) => {
  res.send('Eliminamos un usuario');
});

router.put('/:id', (req, res) => {
  res.send('Actualizamos un usuario');
});


module.exports = router;
