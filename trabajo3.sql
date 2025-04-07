show databases;

use tiendaElectronica;
db.productos.insertOne({producto: "Smart TV 50 pulgadas", precio: 10500, stock:20, marca: "Samsung"});
db.productos.insertMany([
    {
    producto:"laptop Gamer",
    precio: 2500,
    stock: 10,
    marca: "Razer"
    },
    {
    producto:"notebook Profesional",
    precio: 3000,
    stock: 50,
    marca: "HP"
    },
    {
    producto: "Mouse Inalambrico",
    precio: 120,
    stock: 10,
    marca: "Logitech"
    },
    {
    producto: "Teclado RGB",
    precio: 100,
    stock: 200,
    marca:"Logitech"
    }
])

db.productos.insertMany([{
    producto: "Laptop Ultraliviana",
    precio: 5000,
    stock: 80,
    marca: "HP"
},
 {
    producto: "Tablet 10'' Android",
    precio: 75,
    stock: 120,
    marca: "Samsung"
  },
   {
    producto: "Teclado Bluetooth",
    precio: 500,
    stock: 90,
    marca: "Logitech"
  },
   {
    producto: "Monitor LED 24",
    precio: 8000,
    stock: 150,
    marca: "LG"
  },
   {
    producto: "Auriculares Inalambricos",
    precio: 2200,
    stock: 110,
    marca: "Logitech"
  },
   {
    producto: "Webcam Full HD",
    precio: 6000,
    stock: 10,
    marca: "Logitech"
  },
])

//Obtener todos los productos ordenados por precio de mayor a menor.
db.productos.find().sort({precio: -1})

//Buscar productos que tengan un stock entre 50 y 150 unidades.
db.productos.find({stock:{$gte:50, $lte:150}})

// Mostrar solo el nombre y la marca de los productos cuyo precio sea mayor a 100.
db.productos.find({precio:{$gt:100}},{producto: 1, marca:1, _id:0})

// Encontrar productos de la marca "HP" o "Logitech".
db.productos.find({$or:[{marca:"HP"},{marca:"Logitech"}]})

//Buscar productos cuyo nombre contenga la palabra "Laptop".
db.productos.find({producto: /Laptop/i})

//Obtener productos que no tengan stock menor a 100.
db.productos.find({ stock:{$gte:100}})

//Mostrar productos que tengan marca "Razer" y precio mayor a $50.
db.productos.find({marca:"Razer", precio:{$gt:50}})

//Buscar productos cuyo precio no sea ni $25 ni $100.
db.productos.find({ precio:{$nin:[25,100]}})

//Encontrar productos con un tipo de dato "int" en el campo "precio".
db.productos.find({precio:{$type:"int"}})

//Aumentar el precio de los productos en un 10%.
db.productos.updateMany({},{$mul: {precio:1.1}})

//Disminuir el stock en 5 unidades de todos los productos.
db.productos.updateMany({},{$inc:{stock: -5}})

//Agregar un campo "enOferta: true" a los productos que cuesten más de $100.
db.productos.updateMany({precio:{$gt:100}},{$set:{enOferta: true}})

//Eliminar el campo "marca" de todos los productos.
db.productos.updateMany({},{$unset:{marca: ""}})

//Duplicar el stock de los productos cuyo nombre empiece con "T".
db.productos.updateMany({PRODUCTO:{$regex: /^T/i}},{$mul:{stock:2}})

//Eliminar productos que cuesten más de $1000.
 db.productos.deleteMany({precio:{$gt:1000}})
 
//Borrar productos que tengan stock igual a 0.
db.productos.deleteMany({stock:0})
 
 // Eliminar todos los productos excepto los de la marca "Razer".
 db.productos.deleteMany({marca:{$ne:"Razer"}})
 
 
 