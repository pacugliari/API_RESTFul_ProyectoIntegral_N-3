const dotenv = require('dotenv');
dotenv.config();
const express = require('express');
const { Op } = require('sequelize');
const sequelize = require('./conexion/connection');
const Categorias = require('./modelos/categorias');
const Catalogo = require('./modelos/catalogo');
const Generos = require('./modelos/generos');
const server = express();

// Configurar la carpeta 'posters' para ser servida estáticamente
server.use('/posters', express.static('src/posters'));

// Middlewares
server.use(express.json());

//  /categorias (servirá información de todas las categorías existentes)
server.get('/categorias', async (req, res) => {
    try {
        const categorias = await Categorias.findAll();
        res.status(200).send(JSON.stringify({payload: categorias}));
    } catch (error) {
        res.status(500).send(JSON.stringify({message: 'Se ha generado un error en el servidor'}));
    }
});

//  AGREGADO POR MI : muestra todos los generos disponibles
server.get('/generos', async (req, res) => {
    try {
        const generos = await Generos.findAll();
        res.status(200).send(JSON.stringify({payload: generos}));
    } catch (error) {
        res.status(500).send(JSON.stringify({message: 'Se ha generado un error en el servidor'}));
    }
});

//  AGREGA LA RUTA ABSOLUTA
function agregarRutaPosterCatalogo(catalogo) {
    let catalogoAux = catalogo;
    if (catalogoAux !== null) {
        if (typeof catalogoAux.length === 'undefined' || catalogoAux.length === null || catalogoAux.length === 0) {
            catalogoAux = [catalogoAux];
        }
        catalogoAux.forEach((element) => {
            if (typeof element.poster !== 'undefined' || element.poster !== null) {
                element.poster = `http://${process.env.HOST}:${process.env.PORT}${element.poster}`;
            }
        });
    }
}

//  /catalogo (servirá el catálogo completo ‘la vista SQL’)
server.get('/catalogo', async (req, res) => {
    try {
        const catalogo = await Catalogo.findAll();
        agregarRutaPosterCatalogo(catalogo);
        res.status(200).send(JSON.stringify({payload: catalogo}));
    } catch (error) {
        res.status(500).send(JSON.stringify({message: 'Se ha generado un error en el servidor'}));
    }
});

//  AGREGADO POR MI : Trae todas las peliculas que tiene trailers
server.get('/catalogo/trailers', async (req, res) => {
    try {
        const peliculas = await Catalogo.findAll({
            attributes: ['id', 'titulo', 'trailer'],
            where: { trailer: {[Op.ne]: 'N/A'}}
        });
        res.status(200).send(JSON.stringify({payload: peliculas}));
    } catch (error) {
        res.status(500).send(JSON.stringify({message: 'Se ha generado un error en el servidor'}));
    }
});

// /catalogo/:id (filtrar por código de la película/serie)
server.get('/catalogo/:id', async (req, res) => {
    const { id } = req.params;
    try {
        const pelicula = await Catalogo.findByPk(Number(id));
        agregarRutaPosterCatalogo(pelicula);
        if (!pelicula) return res.status(400).send(JSON.stringify({message: 'El código no corresponde a una pelicula/serie registrada'}));
        res.status(200).send(JSON.stringify({payload: pelicula}));
    } catch (error) {
        res.status(500).send(JSON.stringify({message: 'Se ha generado un error en el servidor'}));
    }
});

// /catalogo/nombre/:nombre (filtrar por nombre o parte del nombre)
server.get('/catalogo/nombre/:nombre', async (req, res) => {
    const { nombre } = req.params;
    try {
        const peliculas = await Catalogo.findAll({
            where: { titulo: {[Op.like]: `${nombre}%`}}
        });
        agregarRutaPosterCatalogo(peliculas);
        if (peliculas.length === 0) return res.status(400).send(JSON.stringify({message: 'No hay peliculas/series con ese nombre'}));
        res.status(200).send(JSON.stringify({payload: peliculas}));
    } catch (error) {
        res.status(500).send(JSON.stringify({message: 'Se ha generado un error en el servidor'}));
    }
});


function quitarTildesYMayusculas(texto) {
    // Convierte el texto a minúsculas
    let textoAux = texto.toLowerCase();

    // Reemplaza las letras acentuadas por sus equivalentes sin acento
    textoAux = textoAux.replace(/[áäàâ]/gu, 'a');
    textoAux = textoAux.replace(/[éëèê]/gu, 'e');
    textoAux = textoAux.replace(/[íïìî]/gu, 'i');
    textoAux = textoAux.replace(/[óöòô]/gu, 'o');
    textoAux = textoAux.replace(/[úüùû]/gu, 'u');

    return textoAux;
}


// VERIFICA SI EL GENERO EXISTE EN LA BASE
async function verificarGenero(genero) {
    let generoAux = quitarTildesYMayusculas(genero);
    let retorno = false;
    const generos = await Generos.findAll({attributes: ['descripcion']});

    generos.forEach((element) => {
        let generoBase = quitarTildesYMayusculas(element.descripcion);
        if (generoAux === generoBase) {
            retorno = true;
        }
    });
    return retorno;
}

// /catalogo/genero/:genero (filtrar por género del contenido)
server.get('/catalogo/genero/:genero', async (req, res) => {
    const { genero } = req.params;

    try {
        let esGeneroValido = await verificarGenero(genero);
        const peliculas = await Catalogo.findAll({
            where: { genero: {[Op.like]: `%${genero}%`}}
        });
        agregarRutaPosterCatalogo(peliculas);

        if (peliculas.length === 0 || !esGeneroValido) {
            return res.status(400).send(JSON.stringify({message: 'No hay peliculas/series con ese genero,consule la lista de generos'}));
        }

        res.status(200).send(JSON.stringify({payload: peliculas}));
    } catch (error) {
        res.status(500).send(JSON.stringify({message: 'Se ha generado un error en el servidor'}));
    }
});

// VERIFICA SI LA CATEGORIA EXISTE EN LA BASE
async function verificarCategoria(categoria) {
    let categoriaAux = quitarTildesYMayusculas(categoria);
    let retorno = false;
    const categorias = await Categorias.findAll({attributes: ['descripcion']});

    categorias.forEach((element) => {
        let categoriaBase = quitarTildesYMayusculas(element.descripcion);
        if (categoriaAux === categoriaBase) {
            retorno = true;
        }
    });
    return retorno;
}

// /catalogo/categoria/:categoria (filtrar por serie - película o cualquier otra categoría que pueda existir)
server.get('/catalogo/categoria/:categoria', async (req, res) => {
    const { categoria } = req.params;

    try {
        let esCategoriaValida = await verificarCategoria(categoria);
        const peliculas = await Catalogo.findAll({
            where: { categoria: {[Op.like]: `%${categoria}%`}}
        });
        agregarRutaPosterCatalogo(peliculas);
        if (peliculas.length === 0 || !esCategoriaValida) {
            return res.status(400).send(JSON.stringify({message: 'No hay peliculas/series con esa categoria,consule la lista de categorias'}));
        }
        res.status(200).send(JSON.stringify({payload: peliculas}));
    } catch (error) {
        res.status(500).send(JSON.stringify({message: 'Se ha generado un error en el servidor'}));
    }
});

// Control de rutas inexistentes
server.use('*', (req, res) => {
    res.status(404).send(`<h1>Error 404</h1><h3>La URL indicada no existe en este servidor</h3>`);
});

// Método oyente de solicitudes
sequelize.authenticate().then(() => {
    sequelize.sync({ force: false }).then(() => {
        server.listen(process.env.PORT, process.env.HOST, () => {
            console.log(`El servidor está escuchando en: http://${process.env.HOST}:${process.env.PORT}`);
        });
    }).catch(() => {
        console.log('Hubo un problema con la sincronización de los modelos.');
    });
}).catch(() => {
    console.log('Hubo un problema con la conección a la base de datos.');
});

