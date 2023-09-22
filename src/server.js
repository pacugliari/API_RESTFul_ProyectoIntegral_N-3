const dotenv = require('dotenv');
dotenv.config();
const express = require('express');
const { Op } = require("sequelize")
const sequelize = require("./conexion/connection")
const Categorias = require("./modelos/categorias")
const Catalogo = require("./modelos/catalogo")
const server = express();

// Middlewares
server.use(express.json());

///categorias (servirá información de todas las categorías existentes)
server.get("/categorias", async (req, res) =>  {
    try {
        const categorias = await Categorias.findAll()
        res.status(200).send(JSON.stringify({payload: categorias}));
    } catch (error) {
        res.status(500).send(JSON.stringify({message: 'Se ha generado un error en el servidor'}));
    } 
});

///catalogo (servirá el catálogo completo ‘la vista SQL’)
server.get("/catalogo", async (req, res) =>  {
    try {
        const catalogo = await Catalogo.findAll()
        res.status(200).send(JSON.stringify({payload: catalogo}));
    } catch (error) {
        res.status(500).send(JSON.stringify({message: 'Se ha generado un error en el servidor'}));
    } 
});

//AGREGADO POR MI : Trae todas las peliculas que tiene trailers
server.get("/catalogo/trailers", async (req, res) =>  {
    try {
        const peliculas = await Catalogo.findAll({
            attributes: ["id","titulo", "trailer"],
            where: { trailer : {[Op.ne]: 'N/A'}},
        })
        res.status(200).send(JSON.stringify({payload: peliculas}));
    } catch (error) {
        res.status(500).send(JSON.stringify({message: 'Se ha generado un error en el servidor'}));
    } 
});

// /catalogo/:id (filtrar por código de la película/serie)
server.get("/catalogo/:id", async (req, res) =>  {
    const { id } = req.params;
    try {
        const pelicula = await Catalogo.findByPk(Number(id))
        if (!pelicula) return res.status(400).send(JSON.stringify({message: 'El código no corresponde a una pelicula/serie registrada'}));
        res.status(200).send(JSON.stringify({payload: pelicula}));
    } catch (error) {
        res.status(500).send(JSON.stringify({message: 'Se ha generado un error en el servidor'}));
    }  
});

// /catalogo/nombre/:nombre (filtrar por nombre o parte del nombre)
server.get("/catalogo/nombre/:nombre", async (req, res) =>  {
    const { nombre } = req.params;
    try {
        const peliculas = await Catalogo.findAll({
            where: { titulo : {[Op.like]: nombre+'%'}},
        })
        if (peliculas.length === 0) return res.status(400).send(JSON.stringify({message: 'No hay peliculas/series con ese nombre'}));
        res.status(200).send(JSON.stringify({payload: peliculas}));
    } catch (error) {
        res.status(500).send(JSON.stringify({message: 'Se ha generado un error en el servidor'}));
    } 
});

// /catalogo/genero/:genero (filtrar por género del contenido)
server.get("/catalogo/genero/:genero", async (req, res) =>  {
    const { genero } = req.params;
    //TRAER LOS GENEROS Y VALIDAR
    try {
        const peliculas = await Catalogo.findAll({
            where: { genero : {[Op.like]: '%'+genero+'%'}},
        })
        if (peliculas.length === 0) return res.status(400).send(JSON.stringify({message: 'No hay peliculas/series con ese genero'}));
        res.status(200).send(JSON.stringify({payload: peliculas}));
    } catch (error) {
        res.status(500).send(JSON.stringify({message: 'Se ha generado un error en el servidor'}));
    } 
});

// /catalogo/categoria/:categoria (filtrar por serie - película o cualquier otra categoría que pueda existir)
server.get("/catalogo/categoria/:categoria", async (req, res) =>  {
    const { categoria } = req.params;
    //TRAER LAS CATEGORIAS Y VALIDAR
    try {
        const peliculas = await Catalogo.findAll({
            where: { categoria : {[Op.like]: '%'+categoria+'%'}},
        })
        if (peliculas.length === 0) return res.status(400).send(JSON.stringify({message: 'No hay peliculas/series con esa categoria'}));
        res.status(200).send(JSON.stringify({payload: peliculas}));
    } catch (error) {
        res.status(500).send(JSON.stringify({message: 'Se ha generado un error en el servidor'}));
    } 
});




/*server.get("/products", async (req, res) =>  {
    // const products = await sequelize.query("select * from Products")

    // const products = await Products.findAll()

    // const pricegte = Number(req.query.pricegte)
    // const products = await Products.findAll({attributes: ["ProductName", "UnitPrice"]})

    const pricegte = Number(req.query.pricegte)
    const priceorder = req.query.priceorder
    const products = await Products.findAll({
        attributes: ["ProductName", "UnitPrice"],
        where: { UnitPrice: { [Op.gte]: pricegte} },
        order: [ ['UnitPrice', priceorder] ] })
   
    res.status(200).send(products);
})*/

/**/

/*server.post("/products", async (req, res) =>  {
    const newProduct = await Products.create(req.body)
    res.status(201).send(newProduct);
})*/

/*server.put("/products/:productid", async (req, res) =>  {
    await Products.update(req.body, { where: { ProductId : req.params.productid } })
    const product = await Products.findByPk(req.params.productid)
    console.log(product)
    res.status(200).send(product);
})*/

/*server.delete("/products/:productid", async (req, res) =>  {
    await Products.destroy({where: { ProductId : req.params.productid }})
    res.status(200).send({message: `El producto de id: ${req.params.productid} fue eliminado con éxito.`});
})*/

// Control de rutas inexistentes
server.use('*', (req, res) => {
    res.status(404).send(`<h1>Error 404</h1><h3>La URL indicada no existe en este servidor</h3>`);
});

// Método oyente de solicitudes
sequelize.authenticate().then(()=>{
    sequelize.sync({ force: false }).then(()=>{
        server.listen(process.env.PORT, process.env.HOST, () => {
            console.log(`El servidor está escuchando en: http://${process.env.HOST}:${process.env.PORT}`);
        });
    }).catch(()=>{
        console.log("Hubo un problema con la sincronización de los modelos.")
    });
}).catch(()=>{
    console.log("Hubo un problema con la conección a la base de datos.")
});

