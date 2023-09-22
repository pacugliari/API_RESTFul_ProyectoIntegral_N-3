# Proyecto Integral N°3

El presente documento, es el **Proyecto Integral N°3** de ***Argentina Program 4.0***. Esta es una pequeña solución informática que sirve para consultar las peliculas de un catalogo de peliculas llamado TrailerFlix.
La misma, fue diseñada y construida sobre una arquitectura API RESTful, la cual está desarrollada bajo las restricciones y recomendaciones de REST, además, implementa buenas prácticas de programación.
El proyecto se baso en la migracion de una base de datos MongoDB a MySQL

#### Especificaciones
- Servidor: http://localhost:8080
- Autor: Cugliari Pablo
- Versión: 1.0.0

#### Requerimientos
- Node.js v18.16.1
- MySQL v8.0.34
- GIT v2.40.1
- IDE - Visual Studio Code v1.78.2

#### Estructura de directorios
``` tree
    ├── node_modules
    ├── ScriptMySQL
    │   └── trailerflixBD.sql
    ├── Recursos
    │   └── trailerflix.png
    │   └── restaurarBD_MySQL.png
    ├── Utilidades
    │   └── trailerflix_CreacionTablasDB_Designer.sql
    │   └── trailerflix_CreacionVista.sql
    │   └── trailerflix_InsertsDatos.sql
    │   └── trailerflix_-_Clase_27.json
    │   └── Tercer_Proyecto_Integrador_-_Argentina_Programa.pdf
    ├── src
    │   ├── conexion
    │   │   └── connection.js
    │   ├── modelos
    │   │   ├── catalogo.js
    │   │   ├── categorias.js
    │   │   └── generos.js
    │   ├── posters
    │   └── server.js
    ├── .env
    ├── .env.dist
    ├── .eslintrc.json
    ├── .gitignore
    ├── package.json
    ├── package-lock.json 
    └── README.md
```
##### ANOTACIONES DE DIRECTORIOS
- trailerflix_CreacionTablasDB_Designer.sql : Archivo exportado de la pagina [DB Designer](https://www.dbdesigner.net/) para la creacion de tablas de trailerflix
- trailerflix_CreacionVista.sql : Contiene las consultas necesarias para crear la vista "Catalogo" de trailerflix
- trailerflix_InsertsDatos.sql : Contiene las consultas para ingresar los datos a la base trailerflix
- trailerflix.png : Diagrama exportado de la pagina [DB Designer](https://www.dbdesigner.net/) de como se relacionan las tablas
- trailerflixBD.sql : Script de creacion de schema,tablas e insercion de datos, incluyendo la vista (Base de datos completa)
- posters : Contiene las imagenes de los posters de las peliculas
- trailerflix_-_Clase_27.json : Archivo de datos brindados por la consigna para hacer la creacion y migracion de datos a MySQL
- Tercer_Proyecto_Integrador_-_Argentina_Programa.pdf : Archivo de consigna para hacer la creacion y migracion de datos a MySQL
- restaurarBD_MySQL.png : Imagen instructiva de como restaurar el archivo "trailerflixBD.sql" en MySQL
---
### DIAGRAMA DB DESIGNER

![](https://github.com/pacugliari/API_RESTFul_ProyectoIntegral_N-3/blob/main/Recursos/trailerflix.png?raw=true)

---
### CONFIGURACION DE ENTORNO
  - #### VARIABLES DE ENTORNO
    Se debe hacer una copia del archivo **.env.dist** y renombrarlo como **.env**. Con respecto a su contenido, es necesario asignar los valores a correspondientes a las variables:
    ``` js
        PORT=8080
        HOST=localhost

        DATABASE=trailerflix
        DBUSER=tu-user-de-conexion-mysql
        PASSWORD=tu-password-de-conexion-mysql
    ```

 - #### RESTAURACION DATOS MySQL
    Para poder realizar la restauracion de la base con sus datos, lo primero es loguearse en MySQL Workbench con usuario y contraseña, luego:

    ![](https://github.com/pacugliari/API_RESTFul_ProyectoIntegral_N-3/blob/main/Recursos/restaurarBD_MySQL.png?raw=true)

 - #### ERRORES & FORMATOS
    La comprobación de errores y formatos se ejecuta por medio del comando ***npm run eslint***. se hace por medio de Eslint. Para visualizar los errores en tiempo de escritura, se debe tener instalada la extensión de **Eslint** en Visual Studio Code.
    
---
### MÓDULO DE PELICULAS

Este módulo permite la consulta de muebles. Además, permite visualizar reportes filtrados por diferentes criterios de búsqueda.

#### Métodos HTTP
| Tipo | URI | Descripción |
|------|-----|-------------|
| GET | http://localhost:8080/categorias    | Servirá información de todas las categorías existentes |
| GET | http://localhost:8080/catalogo      | Servirá el catálogo completo ‘la vista SQL’ |
| GET | http://localhost:8080/catalogo/:id  | Filtrar por código de la película/serie |
| GET | http://localhost:8080/catalogo/nombre/:nombre | Filtrar por nombre o parte del nombre |
| GET | http://localhost:8080/catalogo/genero/:genero | Filtrar por género del contenido |
| GET | http://localhost:8080/catalogo/categoria/:categoria | Filtrar por serie - película o cualquier otra categoría que pueda existir |
| GET | http://localhost:8080/catalogo/trailers | Servira inforamcion de todas las peliculas/series con trailer |
| GET | http://localhost:8080/generos | Servirá información de todos los generos existentes |

#### Método GET -> http://localhost:8080/categorias:
- Response:
  - Código HTTP: **200** *payload: categorias*
  - Código HTTP: **500** *message: Se ha generado un error en el servidor*
    ``` json
        "payload": [
          {
            "idCategoria": 1,
            "descripcion": "Serie"
          },
          {
            "idCategoria": 2,
            "descripcion": "Película"
          }
        ]
    ```


#### Método GET -> http://localhost:8080/catalogo:
- Response:
  - Código HTTP: **200** *payload: catalogo*
  - Código HTTP: **500** *message: Se ha generado un error en el servidor*
    <details>
      <summary>CLICK PARA MOSTRAR</summary>

    ```json
    {
      "payload": [
        {
          "id": 1,
          "poster": "http://localhost:8080/posters/1.jpg",
          "titulo": "The Crown",
          "categoria": "Serie",
          "genero": "Drama,Hechos verídicos",
          "resumen": "Este drama narra las rivalidades políticas y el romance de la reina Isabel II, así como los sucesos que moldearon la segunda mitad del siglo XX.",
          "temporadas": "4",
          "reparto": "Claire Fox,Helena Bonham Carter,Matt Smith,Olivia Colman,Tobias Menzies,Vanesa Kirby",
          "trailer": "N/A"
        },
        {
          "id": 2,
          "poster": "http://localhost:8080/posters/2.jpg",
          "titulo": "Riverdale",
          "categoria": "Serie",
          "genero": "Drama,Ficción,Misterio",
          "resumen": "El paso a la edad adulta incluye sexo, romance, escuela y familia. Para Archie y sus amigos, también hay misterios oscuros.",
          "temporadas": "5",
          "reparto": "Camila Mendes,Casey Cott,Lili Reinhart,Mädchen Amick,Madelaine Petsch,Marisol Nichols",
          "trailer": "N/A"
        },
        {
          "id": 3,
          "poster": "http://localhost:8080/posters/3.jpg",
          "titulo": "The Mandalorian",
          "categoria": "Serie",
          "genero": "Ciencia Ficción,Fantasía",
          "resumen": "Ambientada tras la caída del Imperio y antes de la aparición de la Primera Orden, la serie sigue los pasos de un pistolero solitario en las aventuras que protagoniza en los confines de la galaxia, donde no alcanza la autoridad de la Nueva República.",
          "temporadas": "2",
          "reparto": "Carl Weathers,Chris Bartlett,Giancarlo Esposito,Misty Rosas,Pedro Pascal,Rio Hackford",
          "trailer": "https://www.youtube.com/embed/aOC8E8z_ifw"
        },
        {
          "id": 4,
          "poster": "http://localhost:8080/posters/4.jpg",
          "titulo": "The Umbrella Academy",
          "categoria": "Serie",
          "genero": "Ciencia Ficción,Fantasía",
          "resumen": "La muerte de su padre reúne a unos hermanos distanciados y con extraordinarios poderes que descubren impactantes secretos y una amenaza que se cierne sobre la humanidad.",
          "temporadas": "1",
          "reparto": "Aidan Gallagher,David Castañeda,Elliot Page,Emmy Raver-Lampman,Robert Sheehan,Tom Hopper",
          "trailer": "N/A"
        },
        {
          "id": 5,
          "poster": "http://localhost:8080/posters/5.jpg",
          "titulo": "Gambito de Dama",
          "categoria": "Serie",
          "genero": "Drama,Ficción,Sucesos",
          "resumen": "En los cincuenta, una joven de un orfanato descubre que tiene un increíble don para el ajedrez y recorre el arduo camino a la fama mientras lucha contra las adicciones.",
          "temporadas": "1",
          "reparto": "Anya Taylor-Joy,Chloe Pirrie,Harry Melling,Janina Elkin,Moses Ingram,Thomas Brodie-Sangster",
          "trailer": "N/A"
        },
        {
          "id": 6,
          "poster": "http://localhost:8080/posters/6.jpg",
          "titulo": "Enola Holmes",
          "categoria": "Película",
          "genero": "Drama,Ficción,Misterio",
          "resumen": "La hermana menor de Sherlock, descubre que su madre ha desaparecido y se dispone a encontrarla. En su búsqueda, saca a relucir el sabueso que corre por sus venas y se encuentra con una conspiración que gira en torno a un misterioso lord, demostrando que su ilustre hermano no es el único talento en la familia.",
          "temporadas": "N/A",
          "reparto": "Adeel Akhtar,Helena Bonham Carter,Henry Cavill,Louis Partridge,Millie Bobby Brown,Sam Claflin",
          "trailer": "N/A"
        },
        {
          "id": 7,
          "poster": "http://localhost:8080/posters/7.jpg",
          "titulo": "Guasón",
          "categoria": "Película",
          "genero": "Crimen,Drama,Suspenso",
          "resumen": "Arthur Fleck (Phoenix) es un hombre ignorado por la sociedad, cuya motivación en la vida es hacer reír. Pero una serie de trágicos acontecimientos le llevarán a ver el mundo de otra forma. Película basada en el popular personaje de DC Comics Joker, conocido como archivillano de Batman, pero que en este film tomará un cariz más realista y oscuro.",
          "temporadas": "N/A",
          "reparto": "Brett Cullen,Frances Conroy,Joaquin Phoenix,Robert De Niro,Shea Whigham,Zazie Beetz",
          "trailer": "https://www.youtube.com/embed/zAGVQLHvwOY"
        },
        {
          "id": 8,
          "poster": "http://localhost:8080/posters/8.jpg",
          "titulo": "Avengers: End Game",
          "categoria": "Película",
          "genero": "Acción,Aventura,Sci-Fi",
          "resumen": "Después de los devastadores eventos de los Vengadores: Infinity War (2018), el universo está en ruinas. Con la ayuda de los aliados restantes, los Vengadores se reúnen una vez más para revertir las acciones de Thanos y restaurar el equilibrio del universo.",
          "temporadas": "N/A",
          "reparto": "Chris Evans,Chris Hemsworth,Jeremy Renner,Mark Ruffalo,Robert Downey Jr.,Scarlett Johansson",
          "trailer": "N/A"
        },
        {
          "id": 9,
          "poster": "http://localhost:8080/posters/9.jpg",
          "titulo": "Juego de tronos",
          "categoria": "Serie",
          "genero": "Aventura,Drama,Fantasía",
          "resumen": "En un mundo fantástico y en un contexto medieval varias familias, relativas a la nobleza, se disputan el poder para dominar el territorio ficticio de Poniente (Westeros) y tomar el control de los Siete Reinos desde el Trono de Hierro, lugar donde el rey ejerce el poder.",
          "temporadas": "8",
          "reparto": "Emilia Clarke,Kit Harington,Lena Headey,Nikolaj Coster-Waldau,Peter Dinklage,Sophie Turner",
          "trailer": "N/A"
        },
        {
          "id": 10,
          "poster": "http://localhost:8080/posters/10.jpg",
          "titulo": "The Flash",
          "categoria": "Serie",
          "genero": "Ciencia Ficción,Fantasía",
          "resumen": "Sigue las veloces aventuras de Barry Allen, un joven común y corriente con el deseo latente de ayudar a los demás. Cuando una inesperada partícula aceleradora golpea por accidente a Barry, de pronto se encuentra cargado de un increíble poder para moverse a increíbles velocidades. Mientras Barry siempre ha tenido el alma de un héroe, sus nuevos poderes le han dado la capacidad de actuar como tal.",
          "temporadas": "6",
          "reparto": "Candice Patton,Carlos Valdes,Danielle Panabaker,Grant Gustin,Jesse L. Martin,Tom Cavanagh",
          "trailer": "N/A"
        },
        {
          "id": 11,
          "poster": "http://localhost:8080/posters/11.jpg",
          "titulo": "The Big Bang Theory",
          "categoria": "Serie",
          "genero": "Comedia,Fantasía,Ficción",
          "resumen": "Leonard y Sheldon son dos físicos que comparten trabajo y apartamento. La serie comienza con la mudanza de Penny, su nueva y atractiva vecina, y hace hincapié en la dificultad de los físicos para relacionarse con personas fuera de su entorno para dar lugar a situaciones cómicas.",
          "temporadas": "12",
          "reparto": "Jim Parsons,Johnny Galecki,Kaley Cuoco,Kunal Nayyar,Mayim Bialik,Melissa Rauch,Simon Helberg",
          "trailer": "https://www.youtube.com/embed/WBb3fojgW0Q"
        },
        {
          "id": 12,
          "poster": "http://localhost:8080/posters/12.jpg",
          "titulo": "Friends",
          "categoria": "Serie",
          "genero": "Comedia,Drama,Familia",
          "resumen": "'Friends' narra las aventuras y desventuras de seis jóvenes de Nueva York: Rachel, Monica, Phoebe, Ross, Chandler y Joey. Ellos forman una unida pandilla de amigos que viven en Manhattan y que suelen reunirse en sus apartamentos o en su bar habitual cafetería, el Central Perk. A pesar de los numerosos cambios que se producen en sus vidas, su amistad es inquebrantable en la dura batalla por salir adelante en sus periplos profesionales y personales.",
          "temporadas": "10",
          "reparto": "Courteney Cox,David Schwimmer,Jennifer Aniston,Lisa Kudrow,Matt LeBlanc,Matthew Perry",
          "trailer": "N/A"
        },
        {
          "id": 13,
          "poster": "http://localhost:8080/posters/13.jpg",
          "titulo": "Anne with an 'E'",
          "categoria": "Serie",
          "genero": "Drama,Familia,Western",
          "resumen": "Anne Shirley es una niña huérfana que vive en un pequeño pueblo llamado Avonlea que pertenece a la Isla del Príncipe Eduardo, en el año 1890. Después de una infancia difícil, donde fue pasando de orfanato a hogares de acogida, es enviada por error a vivir con una solterona y su hermano. Cuando cumple 13 años, Anne va a conseguir transformar su vida y el pequeño pueblo donde vive gracias a su fuerte personalidad, intelecto e imaginación. Basada en la inolvidable novela.",
          "temporadas": "2",
          "reparto": "Amybeth McNulty,Corrine Koslo,Dalila Bela,Geraldine James,Lucas Jade Zumann,R. H. Thomson",
          "trailer": "N/A"
        },
        {
          "id": 14,
          "poster": "http://localhost:8080/posters/14.jpg",
          "titulo": "Expedientes Secretos 'X'",
          "categoria": "Serie",
          "genero": "Ciencia Ficción,Drama",
          "resumen": "Fox Mulder y Dana Scully son dos investigadores del FBI que investigan casos sin resolución ni explicación, ya sea por razones paranormales (espíritus, criaturas extrañas, aliens...) ya porque el gobierno se ha encargado de ocultar todo tipo de pruebas. Cuando Mulder tenía doce años, su hermana pequeña fue secuestrada por unos desconocidos, aunque él cree que, en realidad, fue abducida por extraterrestres. Tras acabar sus estudios en la universidad de Oxford, ingresó en la Academia de Quantico, donde se ganó el apodo de 'siniestro'",
          "temporadas": "11",
          "reparto": "Bruce Harwood,David Duchovny,Gillian Anderson,Mitch Pileggi,Robert Patrick,Tom Braidwood",
          "trailer": "https://www.youtube.com/embed/KKziOmsJxzE"
        },
        {
          "id": 15,
          "poster": "http://localhost:8080/posters/15.jpg",
          "titulo": "Chernobyl",
          "categoria": "Serie",
          "genero": "Drama,Hechos verídicos",
          "resumen": "Sigue «la verdadera historia de una de las peores catástrofes provocadas por el hombre y habla de los valientes hombres y mujeres que se sacrificaron para salvar a Europa de un desastre inimaginable. La miniserie se centra en el desgarrador alcance del desastre de la planta nuclear que ocurrió en Ucrania en abril de 1986, revelando cómo y por qué ocurrió, además contando las sorprendentes y notables historias de los héroes que lucharon y cayeron.",
          "temporadas": "1",
          "reparto": "Adam Nagaitis,Emily Watson,Jared Harris,Jessie Buckley,Paul Ritter,Stellan Skarsgård",
          "trailer": "https://www.youtube.com/embed/s9APLXM9Ei8"
        },
        {
          "id": 16,
          "poster": "http://localhost:8080/posters/16.jpg",
          "titulo": "Westworld",
          "categoria": "Serie",
          "genero": "Ciencia Ficción,Western",
          "resumen": "'Westworld' es una oscura odisea acerca del amanecer de la conciencia artificial y la evolución del pecado. Situada en la intersección del futuro cercano y el pasado reimaginado, explora un mundo donde cada apetito humano, sin importar cuán noble o depravado, puede ser saciado. Está ambientada en un parque temático futurista dirigido por el Dr. Robert Ford (Anthony Hopkins). Las instalaciones cuentan con androides caracterizados del western americano, y gracias a ellos los visitantes pueden introducirse en cualquier tipo de fantasía por muy oscura que sea.",
          "temporadas": "3",
          "reparto": "Ed Harris,Evan Rachel Wood,Jeffrey Wright,Luke Hemsworth,Tessa Thompson,Thandie Newton",
          "trailer": "https://www.youtube.com/embed/qLFBcdd6Qw0"
        },
        {
          "id": 17,
          "poster": "http://localhost:8080/posters/17.jpg",
          "titulo": "Halt and Catch Fire",
          "categoria": "Serie",
          "genero": "Drama,Ficción,Tecnología",
          "resumen": "Situada en los inicios de la década de 1980, un visionario ficticio, un ingeniero electrónico y una prodigiosa ingeniera, se alían a una programadora de software para confrontar con las corporaciones informáticas dominantes de la época. El Personal de la firma y sus socios de negocio, comenzarán una carrera que cambiará la cultura en el Estado de Texas, cuna de las empresas de tecnología, casi de la misma forma que lo es hoy Silicon Valey. \n Esta historia ficticia emula el trabajo realizado, en su momento, por la firma Compaq, cuando clonó el BIOS de las Computadoras Personales IBM, dando vida así al económico mercado de los clones. Mostrando también, a lo largo de sus 4 temporadas, el nacimiento de la arquitectura abierta de hardware, los videojuegos online, las salas de chat y de trueque de productos físicos, los BBS, y las primeras nubes computacionales, hasta la llegada de Internet (sin dejar afuera la guerra de los web browsers).",
          "temporadas": "4",
          "reparto": "Alana Cavanaugh,Kerry Bishé,Lee Pace,Mackenzie Davis,Scoot McNairy,Toby Huss",
          "trailer": "https://www.youtube.com/embed/pWrioRji60A"
        },
        {
          "id": 18,
          "poster": "http://localhost:8080/posters/18.jpg",
          "titulo": "Ava",
          "categoria": "Película",
          "genero": "Acción,Drama,Suspenso",
          "resumen": "Ava es una mortífera asesina a sueldo que trabaja para una organización de operaciones encubiertas, que viaja por todo el mundo acabando con aquellos objetivos que nadie más puede derribar. Cuando uno de sus encargos sale mal, Ava tendrá que luchar por una vida.",
          "temporadas": "N/A",
          "reparto": "Colin Farrell,Common,Geena Davis,Ioan Gruffudd,Jessica Chastain,John Malkovich",
          "trailer": "N/A"
        },
        {
          "id": 19,
          "poster": "http://localhost:8080/posters/19.jpg",
          "titulo": "Aves de presa y la fantabulosa emancipación de una Harley Quinn",
          "categoria": "Película",
          "genero": "Acción,Comedia,Ficción",
          "resumen": "Después de separarse de Joker, Harley Quinn y otras tres heroínas (Canario Negro, Cazadora y Renée Montoya) unen sus fuerzas para salvar a una niña (Cassandra Cain) del malvado rey del crimen Máscara Negra.",
          "temporadas": "N/A",
          "reparto": "Chris Messina,Ewan McGregor,Jurnee Smollett,Margot Robbie,Mary Elizabeth Winstead,Rosie Perez",
          "trailer": "N/A"
        },
        {
          "id": 20,
          "poster": "http://localhost:8080/posters/20.jpg",
          "titulo": "Archivo",
          "categoria": "Película",
          "genero": "Acción,Sci-Fi,Suspenso",
          "resumen": "2038: George Almore está trabajando en una verdadera IA equivalente a la humana. Su último prototipo está casi listo. Esta fase sensible también es la más arriesgada. Especialmente porque tiene un objetivo que debe ocultarse a toda costa: reunirse con su esposa muerta.",
          "temporadas": "N/A",
          "reparto": "Lia Williams,Peter Ferdinando,Rhona Mitra,Stacy Martin,Theo James,Toby Jones",
          "trailer": "https://www.youtube.com/embed/VHSoCnDioAo"
        },
        {
          "id": 21,
          "poster": "http://localhost:8080/posters/21.jpg",
          "titulo": "Jumanji - The next level",
          "categoria": "Película",
          "genero": "Aventura,Comedia,Ficción",
          "resumen": "Las aventuras continúan en el fantástico mundo del video juego Jumanji, donde nada es lo que parece. En esta ocasión, los jugadores vuelven al juego, pero sus personajes se han intercambiado entre sí, lo que ofrece un curioso plantel: los mismos héroes con distinta apariencia y habilidades. Pero, ¿dónde está el resto de la gente?",
          "temporadas": "N/A",
          "reparto": "Awkwafina,Dwayne Johnson,Jack Black,Karen Gillan,Kevin Hart,Nick Jonas",
          "trailer": "https://www.youtube.com/embed/rBxcF-r9Ibs"
        },
        {
          "id": 22,
          "poster": "http://localhost:8080/posters/22.jpg",
          "titulo": "3022",
          "categoria": "Película",
          "genero": "Ciencia Ficción,Suspenso",
          "resumen": "La película está ambientada en una estación espacial en el futuro. La tripulación sufre un estrés traumático y considera abandonar su misión después de observar lo que creen que es la destrucción de la Tierra. La película se muestra como una serie de flashbacks y flash-forward.",
          "temporadas": "N/A",
          "reparto": "Angus Macfadyen,Enver Gjokaj,Jorja Fox,Kate Walsh,Miranda Cosgrove,Omar Epps",
          "trailer": "https://www.youtube.com/embed/AGQ7OkmIx4Q"
        },
        {
          "id": 23,
          "poster": "http://localhost:8080/posters/23.jpg",
          "titulo": "IT - Capítulo 2",
          "categoria": "Película",
          "genero": "Fantasía,Suspenso,Terror",
          "resumen": "En este segundo capitulo Han pasado 27 años desde que el 'Club de los Perdedores', formado por Bill, Berverly, Richie, Ben, Eddie, Mike y Stanley, se enfrentaran al macabro y despiadado Pennywise (Bill Skarsgård). En cuanto tuvieron oportunidad, abandonaron el pueblo de Derry, en el estado de Maine, que tantos problemas les había ocasionado. Sin embargo, ahora, siendo adultos, parece que no pueden escapar de su pasado. Todos deberán enfrentarse de nuevo al temible payaso para descubrir si de verdad están preparados para superar sus traumas de la infancia.",
          "temporadas": "N/A",
          "reparto": "Bill Hader,Bill Skarsgård,Isaiah Mustafa,James McAvoy,Jay Ryan,Jessica Chastain",
          "trailer": "https://www.youtube.com/embed/hZeFeYSmBcg"
        },
        {
          "id": 24,
          "poster": "http://localhost:8080/posters/24.jpg",
          "titulo": "Pantera Negra",
          "categoria": "Película",
          "genero": "Acción,Aventura,Fantasía",
          "resumen": "T’Challa (Chadwick Boseman) regresa a su hogar en la apartada nación africana de Wakanda para servir como líder de su país. Tras suceder a su padre en el trono, pasa a convertirse en Pantera Negra, una sigilosa criatura de la noche, con agudos sentidos felinos y otras habilidades como súper fuerza e inteligencia, agilidad, estrategia o maestro del combate sin armas. Es bajo el liderazgo de T’Challa como Wakanda consigue convertirse en una de las naciones más ricas y tecnológicamente avanzadas del planeta.",
          "temporadas": "N/A",
          "reparto": "Chadwick Boseman,Danai Gurira,Daniel Kaluuya,Lupita Nyong'o,Martin Freeman,Michael B. Jordan",
          "trailer": "https://www.youtube.com/embed/BE6inv8Xh4A"
        },
        {
          "id": 25,
          "poster": "http://localhost:8080/posters/25.jpg",
          "titulo": "Contra lo imposible (Ford versus Ferrari)",
          "categoria": "Película",
          "genero": "Aventura,Drama,Historia",
          "resumen": "Los ganadores del Premio de la Academia® Matt Damon y Christian Bale protagonizan CONTRA LO IMPOSIBLE, basada en la historia real del visionario diseñador americano de automóviles Carroll Shelby (Damon) y el intrépido piloto británico Ken Miles (Bale). Juntos construyen un nuevo coche de carreras para Ford Motor Company y así enfrentar a Enzo Ferrari en las 24 Horas de Le Mans en Francia en 1966.",
          "temporadas": "N/A",
          "reparto": "Caitriona Balfe,Christian Bale,Jon Bernthal,Josh Lucas,Matt Damon,Noah Jupe",
          "trailer": "https://www.youtube.com/embed/SOVb0-2g1Q0"
        },
        {
          "id": 26,
          "poster": "http://localhost:8080/posters/26.jpg",
          "titulo": "Centígrados",
          "categoria": "Película",
          "genero": "Drama,Intriga,Suspenso",
          "resumen": "Una joven pareja estadounidense viaja a las montañas árticas de Noruega. Después de detenerse durante una tormenta de nieve, se despiertan atrapados en su SUV, enterrados bajo capas de nieve y hielo.",
          "temporadas": "N/A",
          "reparto": "Benjamin Sokolow,Emily Bayiokos,Génesis Rodríguez,Vincent Piazza",
          "trailer": "N/A"
        },
        {
          "id": 27,
          "poster": "http://localhost:8080/posters/27.jpg",
          "titulo": "DOOM: Aniquilación",
          "categoria": "Película",
          "genero": "Acción,Sci-Fi,Terror",
          "resumen": "Doom: Aniquilación sigue a un grupo de marines espaciales que han respondido a una llamada de alerta de una base en la luna marciana, solo para descubrir que ha sido tomada por criaturas demoníacas que amenazan con desatar el infierno en la tierra.",
          "temporadas": "N/A",
          "reparto": "Amy Manson,Dominic Mafham,James Weber Brown,Lorina Kamburova,Luke Allen-Gale,Nina Bergman",
          "trailer": "https://www.youtube.com/embed/nat3u3gAVLE"
        },
        {
          "id": 28,
          "poster": "http://localhost:8080/posters/28.jpg",
          "titulo": "Contagio",
          "categoria": "Película",
          "genero": "Drama,Ficción,Suspenso",
          "resumen": "De repente, sin saber cuál es su origen, aunque todo hace sospechar que comienza con el viaje de una norteamericana a un casino de Hong Kong, un virus mortal comienza a propagarse por todo el mundo. En pocos días, la enfermedad empieza a diezmar a la población. El contagio se produce por mero contacto entre los seres humanos. Un thriller realista y sin efectos especiales sobre los efectos de una epidemia.",
          "temporadas": "N/A",
          "reparto": "Gwyneth Paltrow,Jennifer Ehle,Jude Law,Kate Winslet,Laurence Fishburne,Marion Cotillard,Matt Damon",
          "trailer": "https://www.youtube.com/embed/4sYSyuuLk5g"
        },
        {
          "id": 29,
          "poster": "http://localhost:8080/posters/29.jpg",
          "titulo": "Viuda Negra",
          "categoria": "Película",
          "genero": "Acción,Aventura,Drama",
          "resumen": "Primera pelicula individual de la Viuda Negra en el universo cinematografico de Marvel, contando su historia desde que se inició como doble agente rusa, su niñez, sus misiones, y su actualidad, después de Avengers.",
          "temporadas": "N/A",
          "reparto": "David Harbour,Florence Pugh,O.T. Fagbenle,Rachel Weisz,Ray Winstone,Scarlett Johansson,William Hurt",
          "trailer": "https://www.youtube.com/embed/BIn8iANwEog"
        },
        {
          "id": 30,
          "poster": "http://localhost:8080/posters/30.jpg",
          "titulo": "The Martian",
          "categoria": "Película",
          "genero": "Aventura,Drama,Sci-Fi",
          "resumen": "Durante una misión a Marte de la nave tripulada Ares III, una fuerte tormenta se desata dando por desaparecido y muerto al astronauta Mark Watney (Matt Damon), sus compañeros toman la decisión de irse pero él ha sobrevivido. Está solo y sin apenas recursos en el planeta. Con muy pocos medios deberá recurrir a sus conocimientos, su sentido del humor y un gran instinto de supervivencia para lograr sobrevivir y comunicar a la Tierra que todavía está vivo esperando que acudan en su rescate.",
          "temporadas": "N/A",
          "reparto": "Jeff Daniels,Jessica Chastain,Kate Mara,Kristen Wiig,Matt Damon,Michael Peña,Sean Bean",
          "trailer": "https://www.youtube.com/embed/XvB58bCVfng"
        },
        {
          "id": 31,
          "poster": "http://localhost:8080/posters/31.jpg",
          "titulo": "Ex-Machina",
          "categoria": "Película",
          "genero": "Drama,Sci-Fi,Suspenso",
          "resumen": "Un programador multimillonario selecciona a Caleb, un joven empleado de su empresa, para que pase una semana en un lugar remoto con el objetivo de que participe en un test en el que estará involucrada su última creación: un robot-mujer en el que inteligencia artificial lo es todo.",
          "temporadas": "N/A",
          "reparto": "Alicia Vikander,Claire Selby,Corey Johnson,Domhnall Gleeson,Gana Bayarsaikhan,Oscar Isaac,Sonoya Mizuno",
          "trailer": "https://www.youtube.com/embed/XRYL5spvEcI"
        },
        {
          "id": 32,
          "poster": "http://localhost:8080/posters/32.jpg",
          "titulo": "Jurassic World",
          "categoria": "Película",
          "genero": "Aventura,Ficción,Suspenso",
          "resumen": "Veintidós años después de lo ocurrido en Jurassic Park, la isla Nublar ha sido transformada en un enorme parque temático, Jurassic Wold, con versiones «domesticadas» de algunos de los dinosaurios más conocidos. Cuando todo parece ir sobre ruedas y ser el negocio del siglo, un nuevo dinosaurio de especie desconocida, pues ha sido creado manipulando genéticamente su ADN, y que resulta ser mucho más inteligente de lo que se pensaba, se escapa de su recinto y comienza a causar estragos entre los visitantes del Parque.",
          "temporadas": "N/A",
          "reparto": "Bryce Dallas Howard,Chris Pratt,Irrfan Khan,Judy Greer,Nick Robinson,Omar Sy,Vincent D'Onofrio",
          "trailer": "N/A"
        },
        {
          "id": 33,
          "poster": "http://localhost:8080/posters/33.jpg",
          "titulo": "Soy leyenda",
          "categoria": "Película",
          "genero": "Drama,Ficción,Terror",
          "resumen": "Años después de que una plaga mate a la mayoría de la humanidad y transforme al resto en monstruos, el único superviviente en la ciudad de Nueva York lucha valientemente para encontrar una cura.",
          "temporadas": "N/A",
          "reparto": "Alice Braga,Charlie Tahan,Dash Mihok,Emma Thompson,Salli Richardson-Whitfield,Will Smith,Willow Smith",
          "trailer": "https://www.youtube.com/embed/dtKMEAXyPkg"
        },
        {
          "id": 34,
          "poster": "http://localhost:8080/posters/34.jpg",
          "titulo": "El primer hombre en la luna",
          "categoria": "Película",
          "genero": "Drama,Hechos verídicos",
          "resumen": "Cuenta la historia de la misión de la NASA que llevó al primer hombre a la luna, centrada en Neil Armstrong (interpretado por Ryan Gosling) y el periodo comprendido entre los años 1961 y 1969. Un relato en primera persona, basado en la novela de James R. Hansen, que explora el sacrificio y el precio que representó, tanto para Armstrong como para Estados Unidos, una de las misiones más peligrosas de la historia.",
          "temporadas": "N/A",
          "reparto": "Claire Foy,Corey Stoll,Jason Clarke,Kyle Chandler,Patrick Fugit,Ryan Gosling",
          "trailer": "N/A"
        },
        {
          "id": 35,
          "poster": "http://localhost:8080/posters/35.jpg",
          "titulo": "Titanes del pacífico - La insurrección",
          "categoria": "Película",
          "genero": "Acción,Fantasía,Sci-Fi",
          "resumen": "Han pasado 10 años tras la primera invasión que sufrió la humanidad, pero la lucha aún no ha terminado. El planeta vuelve a ser asediado por los Kaiju, una raza de alienígenas colosales, que emergen desde un portal interdimensional con el objetivo de destruir a la raza humana. Ante esta nueva amenaza, los Jaegers, robots gigantes de guerra pilotados por dos personas para sobrellevar la inmensa carga neuronal que conlleva manipularlos, ya no están a la altura de lo que se les viene encima. Será entonces cuando los supervivientes de la primera invasión, además de nuevos personajes como el hijo de Pentecost, tendrán que idear la manera de sorprender al enorme enemigo, apostando por nuevas estrategias defensivas y de ataque. Con la Tierra en ruinas e intentando reconstruirse, esta nueva batalla puede ser decisiva para el futuro.",
          "temporadas": "N/A",
          "reparto": "Burn Gorman,Cailee Spaeny,Jing Tian,John Boyega,Rinko Kikuchi,Scott Eastwood",
          "trailer": "N/A"
        }
      ]
    }
    ```
    </details><br> 



#### Método GET -> http://localhost:8080/catalogo/:id:
- Request:
  - Parámetro obligatorio de tipo URL:
    - 9 (tipo: integer. Indica el ID de la pelicula que se requiere obtener)

- Response:
  - Código HTTP: **200** *message: payload: pelicula*
  - Código HTTP: **400** *message: El código no corresponde a una pelicula/serie registrada*
  - Código HTTP: **500** *message: Se ha generado un error en el servidor*
      ``` json
            "payload": {
              "id": 9,
              "poster": "http://localhost:8080/posters/9.jpg",
              "titulo": "Juego de tronos",
              "categoria": "Serie",
              "genero": "Aventura,Drama,Fantasía",
              "resumen": "En un mundo fantástico y en un contexto medieval varias familias, relativas a la nobleza, se disputan el poder para dominar el territorio ficticio de Poniente (Westeros) y tomar el control de los Siete Reinos desde el Trono de Hierro, lugar donde el rey ejerce el poder.",
              "temporadas": "8",
              "reparto": "Emilia Clarke,Kit Harington,Lena Headey,Nikolaj Coster-Waldau,Peter Dinklage,Sophie Turner",
              "trailer": "N/A"
            }
      ```


#### Método GET -> http://localhost:8080/catalogo/nombre/:nombre:
- Request:
  - Parámetro obligatorio de tipo URL:
    - Av (tipo: string. Indica el Nombre de la pelicula que se requiere obtener,puede ser una parte del nombre)

- Response:
  - Código HTTP: **200** *message: payload: peliculas*
  - Código HTTP: **400** *message: No hay peliculas/series con ese nombre*
  - Código HTTP: **500** *message: Se ha generado un error en el servidor*
      ``` json
            "payload": [
              {
                "id": 8,
                "poster": "http://localhost:8080/posters/8.jpg",
                "titulo": "Avengers: End Game",
                "categoria": "Película",
                "genero": "Acción,Aventura,Sci-Fi",
                "resumen": "Después de los devastadores eventos de los Vengadores: Infinity War (2018), el universo está en ruinas. Con la ayuda de los aliados restantes, los Vengadores se reúnen una vez más para revertir las acciones de Thanos y restaurar el equilibrio del universo.",
                "temporadas": "N/A",
                "reparto": "Chris Evans,Chris Hemsworth,Jeremy Renner,Mark Ruffalo,Robert Downey Jr.,Scarlett Johansson",
                "trailer": "N/A"
              },
              {
                "id": 18,
                "poster": "http://localhost:8080/posters/18.jpg",
                "titulo": "Ava",
                "categoria": "Película",
                "genero": "Acción,Drama,Suspenso",
                "resumen": "Ava es una mortífera asesina a sueldo que trabaja para una organización de operaciones encubiertas, que viaja por todo el mundo acabando con aquellos objetivos que nadie más puede derribar. Cuando uno de sus encargos sale mal, Ava tendrá que luchar por una vida.",
                "temporadas": "N/A",
                "reparto": "Colin Farrell,Common,Geena Davis,Ioan Gruffudd,Jessica Chastain,John Malkovich",
                "trailer": "N/A"
              },
              {
                "id": 19,
                "poster": "http://localhost:8080/posters/19.jpg",
                "titulo": "Aves de presa y la fantabulosa emancipación de una Harley Quinn",
                "categoria": "Película",
                "genero": "Acción,Comedia,Ficción",
                "resumen": "Después de separarse de Joker, Harley Quinn y otras tres heroínas (Canario Negro, Cazadora y Renée Montoya) unen sus fuerzas para salvar a una niña (Cassandra Cain) del malvado rey del crimen Máscara Negra.",
                "temporadas": "N/A",
                "reparto": "Chris Messina,Ewan McGregor,Jurnee Smollett,Margot Robbie,Mary Elizabeth Winstead,Rosie Perez",
                "trailer": "N/A"
              }
            ]
      ```


#### Método GET -> http://localhost:8080/catalogo/genero/:genero:
- Request:
  - Parámetro obligatorio de tipo URL:
    - Terror (tipo: string. Indica el Genero de la pelicula que se requiere obtener,se debe colocar el genero escrito de manera correcta,NO es case sensitive)

- Response:
  - Código HTTP: **200** *message: payload: peliculas*
  - Código HTTP: **400** *message: No hay peliculas/series con ese genero,consule la lista de generos*
  - Código HTTP: **500** *message: Se ha generado un error en el servidor*

      ``` json
            "payload": [
              {
                "id": 23,
                "poster": "http://localhost:8080/posters/23.jpg",
                "titulo": "IT - Capítulo 2",
                "categoria": "Película",
                "genero": "Fantasía,Suspenso,Terror",
                "resumen": "En este segundo capitulo Han pasado 27 años desde que el 'Club de los Perdedores', formado por Bill, Berverly, Richie, Ben, Eddie, Mike y Stanley,  se enfrentaran al macabro y despiadado Pennywise (Bill Skarsgård). En cuanto tuvieron oportunidad, abandonaron el pueblo de Derry, en el estado de Maine, que tantos problemas les había ocasionado. Sin embargo, ahora, siendo adultos, parece que no pueden escapar de su pasado. Todos deberán enfrentarse de nuevo al temible payaso para descubrir si de verdad están preparados para superar sus traumas de la infancia.",
                "temporadas": "N/A",
                "reparto": "Bill Hader,Bill Skarsgård,Isaiah Mustafa,James McAvoy,Jay Ryan,Jessica Chastain",
                "trailer": "https://www.youtube.com/embed/hZeFeYSmBcg"
              },
              {
                "id": 27,
                "poster": "http://localhost:8080/posters/27.jpg",
                "titulo": "DOOM: Aniquilación",
                "categoria": "Película",
                "genero": "Acción,Sci-Fi,Terror",
                "resumen": "Doom: Aniquilación sigue a un grupo de marines espaciales que han respondido a una llamada de alerta de una base en la luna marciana, solo para descubrir que ha sido tomada por criaturas demoníacas que amenazan con desatar el infierno en la tierra.",
                "temporadas": "N/A",
                "reparto": "Amy Manson,Dominic Mafham,James Weber Brown,Lorina Kamburova,Luke Allen-Gale,Nina Bergman",
                "trailer": "https://www.youtube.com/embed/nat3u3gAVLE"
              },
              {
                "id": 33,
                "poster": "http://localhost:8080/posters/33.jpg",
                "titulo": "Soy leyenda",
                "categoria": "Película",
                "genero": "Drama,Ficción,Terror",
                "resumen": "Años después de que una plaga mate a la mayoría de la humanidad y transforme al resto en monstruos, el único superviviente en la ciudad de Nueva York lucha valientemente para encontrar una cura.",
                "temporadas": "N/A",
                "reparto": "Alice Braga,Charlie Tahan,Dash Mihok,Emma Thompson,Salli Richardson-Whitfield,Will Smith,Willow Smith",
                "trailer": "https://www.youtube.com/embed/dtKMEAXyPkg"
              }
            ]
      ```

#### Método GET -> http://localhost:8080/catalogo/categoria/:categoria:
- Request:
  - Parámetro obligatorio de tipo URL:
    - Serie (tipo: string. Indica la Categoria de la pelicula que se requiere obtener,se debe colocar la categoria escrita de manera correcta,NO es case sensitive)

- Response:
    - Código HTTP: **200** *message: payload: peliculas*
    - Código HTTP: **400** *message: No hay peliculas/series con esa categoria,consule la lista de categorias*
    - Código HTTP: **500** *message: Se ha generado un error en el servidor*

      <details>
          <summary>CLICK PARA MOSTRAR</summary>

        ``` json
        {
          "payload": [
            {
              "id": 1,
              "poster": "http://localhost:8080/posters/1.jpg",
              "titulo": "The Crown",
              "categoria": "Serie",
              "genero": "Drama,Hechos verídicos",
              "resumen": "Este drama narra las rivalidades políticas y el romance de la reina Isabel II, así como los sucesos que moldearon la segunda mitad del siglo XX.",
              "temporadas": "4",
              "reparto": "Claire Fox,Helena Bonham Carter,Matt Smith,Olivia Colman,Tobias Menzies,Vanesa Kirby",
              "trailer": "N/A"
            },
            {
              "id": 2,
              "poster": "http://localhost:8080/posters/2.jpg",
              "titulo": "Riverdale",
              "categoria": "Serie",
              "genero": "Drama,Ficción,Misterio",
              "resumen": "El paso a la edad adulta incluye sexo, romance, escuela y familia. Para Archie y sus amigos, también hay misterios oscuros.",
              "temporadas": "5",
              "reparto": "Camila Mendes,Casey Cott,Lili Reinhart,Mädchen Amick,Madelaine Petsch,Marisol Nichols",
              "trailer": "N/A"
            },
            {
              "id": 3,
              "poster": "http://localhost:8080/posters/3.jpg",
              "titulo": "The Mandalorian",
              "categoria": "Serie",
              "genero": "Ciencia Ficción,Fantasía",
              "resumen": "Ambientada tras la caída del Imperio y antes de la aparición de la Primera Orden, la serie sigue los pasos de un pistolero solitario en las aventuras que protagoniza en los confines de la galaxia, donde no alcanza la autoridad de la Nueva República.",
              "temporadas": "2",
              "reparto": "Carl Weathers,Chris Bartlett,Giancarlo Esposito,Misty Rosas,Pedro Pascal,Rio Hackford",
              "trailer": "https://www.youtube.com/embed/aOC8E8z_ifw"
            },
            {
              "id": 4,
              "poster": "http://localhost:8080/posters/4.jpg",
              "titulo": "The Umbrella Academy",
              "categoria": "Serie",
              "genero": "Ciencia Ficción,Fantasía",
              "resumen": "La muerte de su padre reúne a unos hermanos distanciados y con extraordinarios poderes que descubren impactantes secretos y una amenaza que se cierne sobre la humanidad.",
              "temporadas": "1",
              "reparto": "Aidan Gallagher,David Castañeda,Elliot Page,Emmy Raver-Lampman,Robert Sheehan,Tom Hopper",
              "trailer": "N/A"
            },
            {
              "id": 5,
              "poster": "http://localhost:8080/posters/5.jpg",
              "titulo": "Gambito de Dama",
              "categoria": "Serie",
              "genero": "Drama,Ficción,Sucesos",
              "resumen": "En los cincuenta, una joven de un orfanato descubre que tiene un increíble don para el ajedrez y recorre el arduo camino a la fama mientras lucha contra las adicciones.",
              "temporadas": "1",
              "reparto": "Anya Taylor-Joy,Chloe Pirrie,Harry Melling,Janina Elkin,Moses Ingram,Thomas Brodie-Sangster",
              "trailer": "N/A"
            },
            {
              "id": 9,
              "poster": "http://localhost:8080/posters/9.jpg",
              "titulo": "Juego de tronos",
              "categoria": "Serie",
              "genero": "Aventura,Drama,Fantasía",
              "resumen": "En un mundo fantástico y en un contexto medieval varias familias, relativas a la nobleza, se disputan el poder para dominar el territorio ficticio de Poniente (Westeros) y tomar el control de los Siete Reinos desde el Trono de Hierro, lugar donde el rey ejerce el poder.",
              "temporadas": "8",
              "reparto": "Emilia Clarke,Kit Harington,Lena Headey,Nikolaj Coster-Waldau,Peter Dinklage,Sophie Turner",
              "trailer": "N/A"
            },
            {
              "id": 10,
              "poster": "http://localhost:8080/posters/10.jpg",
              "titulo": "The Flash",
              "categoria": "Serie",
              "genero": "Ciencia Ficción,Fantasía",
              "resumen": "Sigue las veloces aventuras de Barry Allen, un joven común y corriente con el deseo latente de ayudar a los demás. Cuando una inesperada partícula aceleradora golpea por accidente a Barry, de pronto se encuentra cargado de un increíble poder para moverse a increíbles velocidades. Mientras Barry siempre ha tenido el alma de un héroe, sus nuevos poderes le han dado la capacidad de actuar como tal.",
              "temporadas": "6",
              "reparto": "Candice Patton,Carlos Valdes,Danielle Panabaker,Grant Gustin,Jesse L. Martin,Tom Cavanagh",
              "trailer": "N/A"
            },
            {
              "id": 11,
              "poster": "http://localhost:8080/posters/11.jpg",
              "titulo": "The Big Bang Theory",
              "categoria": "Serie",
              "genero": "Comedia,Fantasía,Ficción",
              "resumen": "Leonard y Sheldon son dos físicos que comparten trabajo y apartamento. La serie comienza con la mudanza de Penny, su nueva y atractiva vecina, y hace hincapié en la dificultad de los físicos para relacionarse con personas fuera de su entorno para dar lugar a situaciones cómicas.",
              "temporadas": "12",
              "reparto": "Jim Parsons,Johnny Galecki,Kaley Cuoco,Kunal Nayyar,Mayim Bialik,Melissa Rauch,Simon Helberg",
              "trailer": "https://www.youtube.com/embed/WBb3fojgW0Q"
            },
            {
              "id": 12,
              "poster": "http://localhost:8080/posters/12.jpg",
              "titulo": "Friends",
              "categoria": "Serie",
              "genero": "Comedia,Drama,Familia",
              "resumen": "'Friends' narra las aventuras y desventuras de seis jóvenes de Nueva York: Rachel, Monica, Phoebe, Ross, Chandler y Joey. Ellos forman una unida pandilla de amigos que viven en Manhattan y que suelen reunirse en sus apartamentos o en su bar habitual cafetería, el Central Perk. A pesar de los numerosos cambios que se producen en sus vidas, su amistad es inquebrantable en la dura batalla por salir adelante en sus periplos profesionales y personales.",
              "temporadas": "10",
              "reparto": "Courteney Cox,David Schwimmer,Jennifer Aniston,Lisa Kudrow,Matt LeBlanc,Matthew Perry",
              "trailer": "N/A"
            },
            {
              "id": 13,
              "poster": "http://localhost:8080/posters/13.jpg",
              "titulo": "Anne with an 'E'",
              "categoria": "Serie",
              "genero": "Drama,Familia,Western",
              "resumen": "Anne Shirley es una niña huérfana que vive en un pequeño pueblo llamado Avonlea que pertenece a la Isla del Príncipe Eduardo, en el año 1890. Después de una infancia difícil, donde fue pasando de orfanato a hogares de acogida, es enviada por error a vivir con una solterona y su hermano. Cuando cumple 13 años, Anne va a conseguir transformar su vida y el pequeño pueblo donde vive gracias a su fuerte personalidad, intelecto e imaginación. Basada en la inolvidable novela.",
              "temporadas": "2",
              "reparto": "Amybeth McNulty,Corrine Koslo,Dalila Bela,Geraldine James,Lucas Jade Zumann,R. H. Thomson",
              "trailer": "N/A"
            },
            {
              "id": 14,
              "poster": "http://localhost:8080/posters/14.jpg",
              "titulo": "Expedientes Secretos 'X'",
              "categoria": "Serie",
              "genero": "Ciencia Ficción,Drama",
              "resumen": "Fox Mulder y Dana Scully son dos investigadores del FBI que investigan casos sin resolución ni explicación, ya sea por razones paranormales (espíritus, criaturas extrañas, aliens...) ya porque el gobierno se ha encargado de ocultar todo tipo de pruebas. Cuando Mulder tenía doce años, su hermana pequeña fue secuestrada por unos desconocidos, aunque él cree que, en realidad, fue abducida por extraterrestres. Tras acabar sus estudios en la universidad de Oxford, ingresó en la Academia de Quantico, donde se ganó el apodo de 'siniestro'",
              "temporadas": "11",
              "reparto": "Bruce Harwood,David Duchovny,Gillian Anderson,Mitch Pileggi,Robert Patrick,Tom Braidwood",
              "trailer": "https://www.youtube.com/embed/KKziOmsJxzE"
            },
            {
              "id": 15,
              "poster": "http://localhost:8080/posters/15.jpg",
              "titulo": "Chernobyl",
              "categoria": "Serie",
              "genero": "Drama,Hechos verídicos",
              "resumen": "Sigue «la verdadera historia de una de las peores catástrofes provocadas por el hombre y habla de los valientes hombres y mujeres que se sacrificaron para salvar a Europa de un desastre inimaginable. La miniserie se centra en el desgarrador alcance del desastre de la planta nuclear que ocurrió en Ucrania en abril de 1986, revelando cómo y por qué ocurrió, además contando las sorprendentes y notables historias de los héroes que lucharon y cayeron.",
              "temporadas": "1",
              "reparto": "Adam Nagaitis,Emily Watson,Jared Harris,Jessie Buckley,Paul Ritter,Stellan Skarsgård",
              "trailer": "https://www.youtube.com/embed/s9APLXM9Ei8"
            },
            {
              "id": 16,
              "poster": "http://localhost:8080/posters/16.jpg",
              "titulo": "Westworld",
              "categoria": "Serie",
              "genero": "Ciencia Ficción,Western",
              "resumen": "'Westworld' es una oscura odisea acerca del amanecer de la conciencia artificial y la evolución del pecado. Situada en la intersección del futuro cercano y el pasado reimaginado, explora un mundo donde cada apetito humano, sin importar cuán noble o depravado, puede ser saciado. Está ambientada en un parque temático futurista dirigido por el Dr. Robert Ford (Anthony Hopkins). Las instalaciones cuentan con androides caracterizados del western americano, y gracias a ellos los visitantes pueden introducirse en cualquier tipo de fantasía por muy oscura que sea.",
              "temporadas": "3",
              "reparto": "Ed Harris,Evan Rachel Wood,Jeffrey Wright,Luke Hemsworth,Tessa Thompson,Thandie Newton",
              "trailer": "https://www.youtube.com/embed/qLFBcdd6Qw0"
            },
            {
              "id": 17,
              "poster": "http://localhost:8080/posters/17.jpg",
              "titulo": "Halt and Catch Fire",
              "categoria": "Serie",
              "genero": "Drama,Ficción,Tecnología",
              "resumen": "Situada en los inicios de la década de 1980, un visionario ficticio, un ingeniero electrónico y una prodigiosa ingeniera, se alían a una programadora de software para confrontar con las corporaciones informáticas dominantes de la época. El Personal de la firma y sus socios de negocio, comenzarán una carrera que cambiará la cultura en el Estado de Texas, cuna de las empresas de tecnología, casi de la misma forma que lo es hoy Silicon Valey. \n Esta historia ficticia emula el trabajo realizado, en su momento, por la firma Compaq, cuando clonó el BIOS de las Computadoras Personales IBM, dando vida así al económico mercado de los clones. Mostrando también, a lo largo de sus 4 temporadas, el nacimiento de la arquitectura abierta de hardware, los videojuegos online, las salas de chat y de trueque de productos físicos, los BBS, y las primeras nubes computacionales, hasta la llegada de Internet (sin dejar afuera la guerra de los web browsers).",
              "temporadas": "4",
              "reparto": "Alana Cavanaugh,Kerry Bishé,Lee Pace,Mackenzie Davis,Scoot McNairy,Toby Huss",
              "trailer": "https://www.youtube.com/embed/pWrioRji60A"
            }
          ]
        }
        ```
      </details>

#### Método GET -> http://localhost:8080/catalogo/trailers:

- Response:
  - Código HTTP: **200** *message: payload: trailers*
  - Código HTTP: **500** *message: Se ha generado un error en el servidor*
    <details>
      <summary>CLICK PARA MOSTRAR RESPONSE</summary>

      ``` json
          {
            "payload": [
              {
                "id": 3,
                "titulo": "The Mandalorian",
                "trailer": "https://www.youtube.com/embed/aOC8E8z_ifw"
              },
              {
                "id": 7,
                "titulo": "Guasón",
                "trailer": "https://www.youtube.com/embed/zAGVQLHvwOY"
              },
              {
                "id": 11,
                "titulo": "The Big Bang Theory",
                "trailer": "https://www.youtube.com/embed/WBb3fojgW0Q"
              },
              {
                "id": 14,
                "titulo": "Expedientes Secretos 'X'",
                "trailer": "https://www.youtube.com/embed/KKziOmsJxzE"
              },
              {
                "id": 15,
                "titulo": "Chernobyl",
                "trailer": "https://www.youtube.com/embed/s9APLXM9Ei8"
              },
              {
                "id": 16,
                "titulo": "Westworld",
                "trailer": "https://www.youtube.com/embed/qLFBcdd6Qw0"
              },
              {
                "id": 17,
                "titulo": "Halt and Catch Fire",
                "trailer": "https://www.youtube.com/embed/pWrioRji60A"
              },
              {
                "id": 20,
                "titulo": "Archivo",
                "trailer": "https://www.youtube.com/embed/VHSoCnDioAo"
              },
              {
                "id": 21,
                "titulo": "Jumanji - The next level",
                "trailer": "https://www.youtube.com/embed/rBxcF-r9Ibs"
              },
              {
                "id": 22,
                "titulo": "3022",
                "trailer": "https://www.youtube.com/embed/AGQ7OkmIx4Q"
              },
              {
                "id": 23,
                "titulo": "IT - Capítulo 2",
                "trailer": "https://www.youtube.com/embed/hZeFeYSmBcg"
              },
              {
                "id": 24,
                "titulo": "Pantera Negra",
                "trailer": "https://www.youtube.com/embed/BE6inv8Xh4A"
              },
              {
                "id": 25,
                "titulo": "Contra lo imposible (Ford versus Ferrari)",
                "trailer": "https://www.youtube.com/embed/SOVb0-2g1Q0"
              },
              {
                "id": 27,
                "titulo": "DOOM: Aniquilación",
                "trailer": "https://www.youtube.com/embed/nat3u3gAVLE"
              },
              {
                "id": 28,
                "titulo": "Contagio",
                "trailer": "https://www.youtube.com/embed/4sYSyuuLk5g"
              },
              {
                "id": 29,
                "titulo": "Viuda Negra",
                "trailer": "https://www.youtube.com/embed/BIn8iANwEog"
              },
              {
                "id": 30,
                "titulo": "The Martian",
                "trailer": "https://www.youtube.com/embed/XvB58bCVfng"
              },
              {
                "id": 31,
                "titulo": "Ex-Machina",
                "trailer": "https://www.youtube.com/embed/XRYL5spvEcI"
              },
              {
                "id": 33,
                "titulo": "Soy leyenda",
                "trailer": "https://www.youtube.com/embed/dtKMEAXyPkg"
              }
            ]
          }          
        ```
    </details>
      



#### Método GET -> http://localhost:8080/generos:

- Response:
  - Código HTTP: **200** *message: payload: generos*
  - Código HTTP: **500** *message: Se ha generado un error en el servidor*

    <details>
      <summary>CLICK PARA MOSTRAR RESPONSE</summary>

    ```json
    {
      "payload": [
        {
          "idGenero": 1,
          "descripcion": "Ciencia Ficción"
        },
        {
          "idGenero": 2,
          "descripcion": "Fantasía"
        },
        {
          "idGenero": 3,
          "descripcion": "Drama"
        },
        {
          "idGenero": 4,
          "descripcion": "Ficción"
        },
        {
          "idGenero": 5,
          "descripcion": "Sucesos"
        },
        {
          "idGenero": 6,
          "descripcion": "Misterio"
        },
        {
          "idGenero": 7,
          "descripcion": "Hechos verídicos"
        },
        {
          "idGenero": 8,
          "descripcion": "Crimen"
        },
        {
          "idGenero": 9,
          "descripcion": "Suspenso"
        },
        {
          "idGenero": 10,
          "descripcion": "Aventura"
        },
        {
          "idGenero": 11,
          "descripcion": "Sci-Fi"
        },
        {
          "idGenero": 12,
          "descripcion": "Acción"
        },
        {
          "idGenero": 13,
          "descripcion": "Comedia"
        },
        {
          "idGenero": 14,
          "descripcion": "Familia"
        },
        {
          "idGenero": 15,
          "descripcion": "Western"
        },
        {
          "idGenero": 16,
          "descripcion": "Tecnología"
        },
        {
          "idGenero": 17,
          "descripcion": "Terror"
        },
        {
          "idGenero": 18,
          "descripcion": "Historia"
        },
        {
          "idGenero": 19,
          "descripcion": "Intriga"
        },
        {
          "idGenero": 20,
          "descripcion": "Ciencia Ficción"
        },
        {
          "idGenero": 21,
          "descripcion": "Fantasía"
        },
        {
          "idGenero": 22,
          "descripcion": "Drama"
        },
        {
          "idGenero": 23,
          "descripcion": "Ficción"
        },
        {
          "idGenero": 24,
          "descripcion": "Sucesos"
        },
        {
          "idGenero": 25,
          "descripcion": "Misterio"
        },
        {
          "idGenero": 26,
          "descripcion": "Hechos verídicos"
        },
        {
          "idGenero": 27,
          "descripcion": "Crimen"
        },
        {
          "idGenero": 28,
          "descripcion": "Suspenso"
        },
        {
          "idGenero": 29,
          "descripcion": "Aventura"
        },
        {
          "idGenero": 30,
          "descripcion": "Sci-Fi"
        },
        {
          "idGenero": 31,
          "descripcion": "Acción"
        },
        {
          "idGenero": 32,
          "descripcion": "Comedia"
        },
        {
          "idGenero": 33,
          "descripcion": "Familia"
        },
        {
          "idGenero": 34,
          "descripcion": "Western"
        },
        {
          "idGenero": 35,
          "descripcion": "Tecnología"
        },
        {
          "idGenero": 36,
          "descripcion": "Terror"
        },
        {
          "idGenero": 37,
          "descripcion": "Historia"
        },
        {
          "idGenero": 38,
          "descripcion": "Intriga"
        }
      ]
    }
    ```
    </details>
