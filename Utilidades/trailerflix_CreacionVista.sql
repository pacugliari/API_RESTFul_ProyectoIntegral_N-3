USE trailerflix;

CREATE VIEW catalogo AS
SELECT
	pel.idPelicula AS id,
	pel.poster AS poster,
	pel.titulo AS titulo,
	cat.descripcion AS categoria,
	GROUP_CONCAT(DISTINCT gen.descripcion ORDER BY gen.descripcion ASC SEPARATOR ',') AS genero,
	pel.resumen AS resumen,
	pel.cantidadTemporadas AS temporadas,
    GROUP_CONCAT(DISTINCT act.nombre ORDER BY act.nombre ASC SEPARATOR ',') AS reparto,
    GROUP_CONCAT(DISTINCT IFNULL(pelt.trailer,'N/A')) AS trailer 
FROM peliculas AS pel
LEFT JOIN categorias AS cat ON cat.idCategoria = pel.idCategoria
LEFT JOIN peliculasgeneros AS pelg ON pelg.idPelicula = pel.idPelicula
LEFT JOIN generos AS gen ON gen.idGenero = pelg.idGenero
LEFT JOIN peliculasrepartos AS pelr ON pelr.idPelicula = pel.idPelicula
LEFT JOIN actores AS act ON act.idActor = pelr.idActor
LEFT JOIN peliculastrailers AS pelt ON pelt.idPelicula = pel.idPelicula
GROUP BY pel.idPelicula;