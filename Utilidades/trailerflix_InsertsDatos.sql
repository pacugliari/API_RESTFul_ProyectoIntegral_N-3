INSERT INTO categorias (idCategoria,descripcion) 
VALUES 
(1,"Serie"),
(2,"Película");

INSERT INTO generos (descripcion) 
VALUES
("Ciencia Ficción"),
("Fantasía"),
("Drama"),
("Ficción"),
("Sucesos"),
("Misterio"),
("Hechos verídicos"),
("Crimen"),
("Suspenso"),
("Aventura"),
("Sci-Fi"),
("Acción"),
("Comedia"),
("Familia"),
("Western"),
("Tecnología"),
("Terror"),
("Historia"),
("Intriga");
    
INSERT INTO actores (nombre) 
VALUES 
("Pedro Pascal"),
("Carl Weathers"),
("Misty Rosas"),
("Chris Bartlett"),
("Rio Hackford"),
("Giancarlo Esposito"),
("Tom Hopper"),
("David Castañeda"),
("Emmy Raver-Lampman"),
("Robert Sheehan"),
("Aidan Gallagher"),
("Elliot Page"),
("Anya Taylor-Joy"),
("Thomas Brodie-Sangster"),
("Harry Melling"),
("Moses Ingram"),
("Chloe Pirrie"),
("Janina Elkin"),
("Lili Reinhart"),
("Casey Cott"),
("Camila Mendes"),
("Marisol Nichols"),
("Madelaine Petsch"),
("Mädchen Amick"),
("Claire Fox"),
("Olivia Colman"),
("Matt Smith"),
("Tobias Menzies"),
("Vanesa Kirby"),
("Helena Bonham Carter"),
("Millie Bobby Brown"),
("Henry Cavill"),
("Sam Claflin"),
#("Helena Bonham Carter"),
("Louis Partridge"),
("Adeel Akhtar"),
("Joaquin Phoenix"),
("Robert De Niro"),
("Zazie Beetz"),
("Frances Conroy"),
("Brett Cullen"),
("Shea Whigham"),
("Robert Downey Jr."),
("Chris Evans"),
("Mark Ruffalo"),
("Chris Hemsworth"),
("Scarlett Johansson"),
("Jeremy Renner"),
("Emilia Clarke"),
("Lena Headey"),
("Sophie Turner"),
("Kit Harington"),
("Peter Dinklage"),
("Nikolaj Coster-Waldau"),
("Grant Gustin"),
("Carlos Valdes"),
("Danielle Panabaker"),
("Candice Patton"),
("Jesse L. Martin"),
("Tom Cavanagh"),
("Jennifer Aniston"),
("Courteney Cox"),
("Lisa Kudrow"),
("David Schwimmer"),
("Matthew Perry"),
("Matt LeBlanc"),
("Amybeth McNulty"),
("Geraldine James"),
("R. H. Thomson"),
("Corrine Koslo"),
("Dalila Bela"),
("Lucas Jade Zumann"),
("Gillian Anderson"),
("David Duchovny"),
("Mitch Pileggi"),
("Robert Patrick"),
("Tom Braidwood"),
("Bruce Harwood"),
("Jared Harris"),
("Stellan Skarsgård"),
("Emily Watson"),
("Paul Ritter"),
("Jessie Buckley"),
("Adam Nagaitis"),
("Evan Rachel Wood"),
("Thandie Newton"),
("Jeffrey Wright"),
("Tessa Thompson"),
("Ed Harris"),
("Luke Hemsworth"),
("Lee Pace"),
("Scoot McNairy"),
("Mackenzie Davis"),
("Kerry Bishé"),
("Toby Huss"),
("Alana Cavanaugh"),
#("Jessica Chastain"),
("John Malkovich"),
("Colin Farrell"),
("Common"),
("Geena Davis"),
("Ioan Gruffudd"),
("Margot Robbie"),
("Ewan McGregor"),
("Mary Elizabeth Winstead"),
("Jurnee Smollett"),
("Rosie Perez"),
("Chris Messina"),
("Stacy Martin"),
("Rhona Mitra"),
("Theo James"),
("Peter Ferdinando"),
("Lia Williams"),
("Toby Jones"),
("Dwayne Johnson"),
("Kevin Hart"),
("Jack Black"),
("Karen Gillan"),
("Awkwafina"),
("Nick Jonas"),
("Miranda Cosgrove"),
("Kate Walsh"),
("Omar Epps"),
("Angus Macfadyen"),
("Jorja Fox"),
("Enver Gjokaj"),
("Bill Skarsgård"),
#("Jessica Chastain"),
("Bill Hader"),
("James McAvoy"),
("Isaiah Mustafa"),
("Jay Ryan"),
("Chadwick Boseman"),
("Michael B. Jordan"),
("Lupita Nyong'o"),
("Danai Gurira"),
("Martin Freeman"),
("Daniel Kaluuya"),
("Christian Bale"),
("Matt Damon"),
("Caitriona Balfe"),
("Josh Lucas"),
("Noah Jupe"),
("Jon Bernthal"),
("Génesis Rodríguez"),
("Vincent Piazza"),
("Benjamin Sokolow"),
("Emily Bayiokos"),
("Amy Manson"),
("Luke Allen-Gale"),
("Nina Bergman"),
("Dominic Mafham"),
("James Weber Brown"),
("Lorina Kamburova"),
("Marion Cotillard"),
#("Matt Damon"),
("Laurence Fishburne"),
("Jude Law"),
("Kate Winslet"),
("Jennifer Ehle"),
("Gwyneth Paltrow"),
#("Scarlett Johansson"),
("Florence Pugh"),
("David Harbour"),
("O.T. Fagbenle"),
("Rachel Weisz"),
("William Hurt"),
("Ray Winstone"),
#("Matt Damon"),
("Jessica Chastain"),
("Kristen Wiig"),
("Jeff Daniels"),
("Michael Peña"),
("Sean Bean"),
("Kate Mara"),
("Alicia Vikander"),
("Domhnall Gleeson"),
("Oscar Isaac"),
("Sonoya Mizuno"),
("Corey Johnson"),
("Claire Selby"),
("Gana Bayarsaikhan"),
("Bryce Dallas Howard"),
("Chris Pratt"),
("Irrfan Khan"),
("Vincent D'Onofrio"),
("Omar Sy"),
("Nick Robinson"),
("Judy Greer"),
("Will Smith"),
("Alice Braga"),
("Charlie Tahan"),
("Dash Mihok"),
("Salli Richardson-Whitfield"),
("Willow Smith"),
("Emma Thompson"),
("Ryan Gosling"),
("Claire Foy"),
("Jason Clarke"),
("Kyle Chandler"),
("Corey Stoll"),
("Patrick Fugit"),
("John Boyega"),
("Scott Eastwood"),
("Cailee Spaeny"),
("Jing Tian"),
("Rinko Kikuchi"),
("Burn Gorman"),
('Jim Parsons'),
('Johnny Galecki'),
('Kaley Cuoco'),
('Simon Helberg'),
('Kunal Nayyar'),
('Melissa Rauch'),
('Mayim Bialik');



INSERT INTO peliculas (idPelicula,poster,titulo,idCategoria,cantidadTemporadas,resumen)
VALUES 
(3,"/posters/3.jpg","The Mandalorian",1,2,"Ambientada tras la caída del Imperio y antes de la aparición de la Primera Orden, la serie sigue los pasos de un pistolero solitario en las aventuras que protagoniza en los confines de la galaxia, donde no alcanza la autoridad de la Nueva República."),
(4,"/posters/4.jpg","The Umbrella Academy",1,1,"La muerte de su padre reúne a unos hermanos distanciados y con extraordinarios poderes que descubren impactantes secretos y una amenaza que se cierne sobre la humanidad."),
(5,"/posters/5.jpg","Gambito de Dama",1,1,"En los cincuenta, una joven de un orfanato descubre que tiene un increíble don para el ajedrez y recorre el arduo camino a la fama mientras lucha contra las adicciones."),
(2,"/posters/2.jpg","Riverdale",1,5,"El paso a la edad adulta incluye sexo, romance, escuela y familia. Para Archie y sus amigos, también hay misterios oscuros."),
(1,"/posters/1.jpg","The Crown",1,4,"Este drama narra las rivalidades políticas y el romance de la reina Isabel II, así como los sucesos que moldearon la segunda mitad del siglo XX."),
(6,"/posters/6.jpg","Enola Holmes",2,"N/A","La hermana menor de Sherlock, descubre que su madre ha desaparecido y se dispone a encontrarla. En su búsqueda, saca a relucir el sabueso que corre por sus venas y se encuentra con una conspiración que gira en torno a un misterioso lord, demostrando que su ilustre hermano no es el único talento en la familia."),
(7,"/posters/7.jpg","Guasón",2,"N/A","Arthur Fleck (Phoenix) es un hombre ignorado por la sociedad, cuya motivación en la vida es hacer reír. Pero una serie de trágicos acontecimientos le llevarán a ver el mundo de otra forma. Película basada en el popular personaje de DC Comics Joker, conocido como archivillano de Batman, pero que en este film tomará un cariz más realista y oscuro."),
(8,"/posters/8.jpg","Avengers: End Game",2,"N/A","Después de los devastadores eventos de los Vengadores: Infinity War (2018), el universo está en ruinas. Con la ayuda de los aliados restantes, los Vengadores se reúnen una vez más para revertir las acciones de Thanos y restaurar el equilibrio del universo."),
(9,"/posters/9.jpg","Juego de tronos",1,8,"En un mundo fantástico y en un contexto medieval varias familias, relativas a la nobleza, se disputan el poder para dominar el territorio ficticio de Poniente (Westeros) y tomar el control de los Siete Reinos desde el Trono de Hierro, lugar donde el rey ejerce el poder."),
(10,"/posters/10.jpg","The Flash",1,6,"Sigue las veloces aventuras de Barry Allen, un joven común y corriente con el deseo latente de ayudar a los demás. Cuando una inesperada partícula aceleradora golpea por accidente a Barry, de pronto se encuentra cargado de un increíble poder para moverse a increíbles velocidades. Mientras Barry siempre ha tenido el alma de un héroe, sus nuevos poderes le han dado la capacidad de actuar como tal."),
(11,"/posters/11.jpg","The Big Bang Theory",1,12,"Leonard y Sheldon son dos físicos que comparten trabajo y apartamento. La serie comienza con la mudanza de Penny, su nueva y atractiva vecina, y hace hincapié en la dificultad de los físicos para relacionarse con personas fuera de su entorno para dar lugar a situaciones cómicas."),
(12,"/posters/12.jpg","Friends",1,10,"'Friends' narra las aventuras y desventuras de seis jóvenes de Nueva York: Rachel, Monica, Phoebe, Ross, Chandler y Joey. Ellos forman una unida pandilla de amigos que viven en Manhattan y que suelen reunirse en sus apartamentos o en su bar habitual cafetería, el Central Perk. A pesar de los numerosos cambios que se producen en sus vidas, su amistad es inquebrantable en la dura batalla por salir adelante en sus periplos profesionales y personales."),
(13,"/posters/13.jpg","Anne with an 'E'",1,2,"Anne Shirley es una niña huérfana que vive en un pequeño pueblo llamado Avonlea que pertenece a la Isla del Príncipe Eduardo, en el año 1890. Después de una infancia difícil, donde fue pasando de orfanato a hogares de acogida, es enviada por error a vivir con una solterona y su hermano. Cuando cumple 13 años, Anne va a conseguir transformar su vida y el pequeño pueblo donde vive gracias a su fuerte personalidad, intelecto e imaginación. Basada en la inolvidable novela."),
(14,"/posters/14.jpg","Expedientes Secretos 'X'",1,11,"Fox Mulder y Dana Scully son dos investigadores del FBI que investigan casos sin resolución ni explicación, ya sea por razones paranormales (espíritus, criaturas extrañas, aliens...) ya porque el gobierno se ha encargado de ocultar todo tipo de pruebas. Cuando Mulder tenía doce años, su hermana pequeña fue secuestrada por unos desconocidos, aunque él cree que, en realidad, fue abducida por extraterrestres. Tras acabar sus estudios en la universidad de Oxford, ingresó en la Academia de Quantico, donde se ganó el apodo de 'siniestro'"),
(15,"/posters/15.jpg","Chernobyl",1,1,"Sigue «la verdadera historia de una de las peores catástrofes provocadas por el hombre y habla de los valientes hombres y mujeres que se sacrificaron para salvar a Europa de un desastre inimaginable. La miniserie se centra en el desgarrador alcance del desastre de la planta nuclear que ocurrió en Ucrania en abril de 1986, revelando cómo y por qué ocurrió, además contando las sorprendentes y notables historias de los héroes que lucharon y cayeron."),
(16,"/posters/16.jpg","Westworld",1,3,"'Westworld' es una oscura odisea acerca del amanecer de la conciencia artificial y la evolución del pecado. Situada en la intersección del futuro cercano y el pasado reimaginado, explora un mundo donde cada apetito humano, sin importar cuán noble o depravado, puede ser saciado. Está ambientada en un parque temático futurista dirigido por el Dr. Robert Ford (Anthony Hopkins). Las instalaciones cuentan con androides caracterizados del western americano, y gracias a ellos los visitantes pueden introducirse en cualquier tipo de fantasía por muy oscura que sea."),
(17,"/posters/17.jpg","Halt and Catch Fire",1,4,"Situada en los inicios de la década de 1980, un visionario ficticio, un ingeniero electrónico y una prodigiosa ingeniera, se alían a una programadora de software para confrontar con las corporaciones informáticas dominantes de la época. El Personal de la firma y sus socios de negocio, comenzarán una carrera que cambiará la cultura en el Estado de Texas, cuna de las empresas de tecnología, casi de la misma forma que lo es hoy Silicon Valey. \n Esta historia ficticia emula el trabajo realizado, en su momento, por la firma Compaq, cuando clonó el BIOS de las Computadoras Personales IBM, dando vida así al económico mercado de los clones. Mostrando también, a lo largo de sus 4 temporadas, el nacimiento de la arquitectura abierta de hardware, los videojuegos online, las salas de chat y de trueque de productos físicos, los BBS, y las primeras nubes computacionales, hasta la llegada de Internet (sin dejar afuera la guerra de los web browsers)."),
(18,"/posters/18.jpg","Ava",2,"N/A","Ava es una mortífera asesina a sueldo que trabaja para una organización de operaciones encubiertas, que viaja por todo el mundo acabando con aquellos objetivos que nadie más puede derribar. Cuando uno de sus encargos sale mal, Ava tendrá que luchar por una vida."),
(19,"/posters/19.jpg","Aves de presa y la fantabulosa emancipación de una Harley Quinn",2,"N/A","Después de separarse de Joker, Harley Quinn y otras tres heroínas (Canario Negro, Cazadora y Renée Montoya) unen sus fuerzas para salvar a una niña (Cassandra Cain) del malvado rey del crimen Máscara Negra."),
(20,"/posters/20.jpg","Archivo",2,"N/A","2038: George Almore está trabajando en una verdadera IA equivalente a la humana. Su último prototipo está casi listo. Esta fase sensible también es la más arriesgada. Especialmente porque tiene un objetivo que debe ocultarse a toda costa: reunirse con su esposa muerta."),
(21,"/posters/21.jpg","Jumanji - The next level",2,"N/A","Las aventuras continúan en el fantástico mundo del video juego Jumanji, donde nada es lo que parece. En esta ocasión, los jugadores vuelven al juego, pero sus personajes se han intercambiado entre sí, lo que ofrece un curioso plantel: los mismos héroes con distinta apariencia y habilidades. Pero, ¿dónde está el resto de la gente?"),
(22,"/posters/22.jpg","3022",2,"N/A","La película está ambientada en una estación espacial en el futuro. La tripulación sufre un estrés traumático y considera abandonar su misión después de observar lo que creen que es la destrucción de la Tierra. La película se muestra como una serie de flashbacks y flash-forward."),
(23,"/posters/23.jpg","IT - Capítulo 2",2,"N/A","En este segundo capitulo Han pasado 27 años desde que el 'Club de los Perdedores', formado por Bill, Berverly, Richie, Ben, Eddie, Mike y Stanley, se enfrentaran al macabro y despiadado Pennywise (Bill Skarsgård). En cuanto tuvieron oportunidad, abandonaron el pueblo de Derry, en el estado de Maine, que tantos problemas les había ocasionado. Sin embargo, ahora, siendo adultos, parece que no pueden escapar de su pasado. Todos deberán enfrentarse de nuevo al temible payaso para descubrir si de verdad están preparados para superar sus traumas de la infancia."),
(24,"/posters/24.jpg","Pantera Negra",2,"N/A","T’Challa (Chadwick Boseman) regresa a su hogar en la apartada nación africana de Wakanda para servir como líder de su país. Tras suceder a su padre en el trono, pasa a convertirse en Pantera Negra, una sigilosa criatura de la noche, con agudos sentidos felinos y otras habilidades como súper fuerza e inteligencia, agilidad, estrategia o maestro del combate sin armas. Es bajo el liderazgo de T’Challa como Wakanda consigue convertirse en una de las naciones más ricas y tecnológicamente avanzadas del planeta."),
(25,"/posters/25.jpg","Contra lo imposible (Ford versus Ferrari)",2,"N/A","Los ganadores del Premio de la Academia® Matt Damon y Christian Bale protagonizan CONTRA LO IMPOSIBLE, basada en la historia real del visionario diseñador americano de automóviles Carroll Shelby (Damon) y el intrépido piloto británico Ken Miles (Bale). Juntos construyen un nuevo coche de carreras para Ford Motor Company y así enfrentar a Enzo Ferrari en las 24 Horas de Le Mans en Francia en 1966."),
(26,"/posters/26.jpg","Centígrados",2,"N/A","Una joven pareja estadounidense viaja a las montañas árticas de Noruega. Después de detenerse durante una tormenta de nieve, se despiertan atrapados en su SUV, enterrados bajo capas de nieve y hielo."),
(27,"/posters/27.jpg","DOOM: Aniquilación",2,"N/A","Doom: Aniquilación sigue a un grupo de marines espaciales que han respondido a una llamada de alerta de una base en la luna marciana, solo para descubrir que ha sido tomada por criaturas demoníacas que amenazan con desatar el infierno en la tierra."),
(28,"/posters/28.jpg","Contagio",2,"N/A","De repente, sin saber cuál es su origen, aunque todo hace sospechar que comienza con el viaje de una norteamericana a un casino de Hong Kong, un virus mortal comienza a propagarse por todo el mundo. En pocos días, la enfermedad empieza a diezmar a la población. El contagio se produce por mero contacto entre los seres humanos. Un thriller realista y sin efectos especiales sobre los efectos de una epidemia."),
(29,"/posters/29.jpg","Viuda Negra",2,"N/A","Primera pelicula individual de la Viuda Negra en el universo cinematografico de Marvel, contando su historia desde que se inició como doble agente rusa, su niñez, sus misiones, y su actualidad, después de Avengers."),
(30,"/posters/30.jpg","The Martian",2,"N/A","Durante una misión a Marte de la nave tripulada Ares III, una fuerte tormenta se desata dando por desaparecido y muerto al astronauta Mark Watney (Matt Damon), sus compañeros toman la decisión de irse pero él ha sobrevivido. Está solo y sin apenas recursos en el planeta. Con muy pocos medios deberá recurrir a sus conocimientos, su sentido del humor y un gran instinto de supervivencia para lograr sobrevivir y comunicar a la Tierra que todavía está vivo esperando que acudan en su rescate."),
(31,"/posters/31.jpg","Ex-Machina",2,"N/A","Un programador multimillonario selecciona a Caleb, un joven empleado de su empresa, para que pase una semana en un lugar remoto con el objetivo de que participe en un test en el que estará involucrada su última creación: un robot-mujer en el que inteligencia artificial lo es todo."),
(32,"/posters/32.jpg","Jurassic World",2,"N/A","Veintidós años después de lo ocurrido en Jurassic Park, la isla Nublar ha sido transformada en un enorme parque temático, Jurassic Wold, con versiones «domesticadas» de algunos de los dinosaurios más conocidos. Cuando todo parece ir sobre ruedas y ser el negocio del siglo, un nuevo dinosaurio de especie desconocida, pues ha sido creado manipulando genéticamente su ADN, y que resulta ser mucho más inteligente de lo que se pensaba, se escapa de su recinto y comienza a causar estragos entre los visitantes del Parque."),
(33,"/posters/33.jpg","Soy leyenda",2,"N/A","Años después de que una plaga mate a la mayoría de la humanidad y transforme al resto en monstruos, el único superviviente en la ciudad de Nueva York lucha valientemente para encontrar una cura."),
(34,"/posters/34.jpg","El primer hombre en la luna",2,"N/A","Cuenta la historia de la misión de la NASA que llevó al primer hombre a la luna, centrada en Neil Armstrong (interpretado por Ryan Gosling) y el periodo comprendido entre los años 1961 y 1969. Un relato en primera persona, basado en la novela de James R. Hansen, que explora el sacrificio y el precio que representó, tanto para Armstrong como para Estados Unidos, una de las misiones más peligrosas de la historia."),
(35,"/posters/35.jpg","Titanes del pacífico - La insurrección",2,"N/A","Han pasado 10 años tras la primera invasión que sufrió la humanidad, pero la lucha aún no ha terminado. El planeta vuelve a ser asediado por los Kaiju, una raza de alienígenas colosales, que emergen desde un portal interdimensional con el objetivo de destruir a la raza humana. Ante esta nueva amenaza, los Jaegers, robots gigantes de guerra pilotados por dos personas para sobrellevar la inmensa carga neuronal que conlleva manipularlos, ya no están a la altura de lo que se les viene encima. Será entonces cuando los supervivientes de la primera invasión, además de nuevos personajes como el hijo de Pentecost, tendrán que idear la manera de sorprender al enorme enemigo, apostando por nuevas estrategias defensivas y de ataque. Con la Tierra en ruinas e intentando reconstruirse, esta nueva batalla puede ser decisiva para el futuro.");


INSERT INTO peliculasgeneros (idPelicula,idGenero)
VALUES
(3,1),#Ciencia Ficción
(3,2),#Fantasía
(4,1),
(4,2),
(5,3),#Drama
(5,4),#Ficcion
(5,5),#Sucesos
(2,3),
(2,4),
(2,6),#Misterio
(1,3),
(1,7),#Hechos verídicos
(6,4),
(6,3),
(6,6),
(7,8),#Crimen
(7,9),#Suspenso
(7,3),
(8,10),#Aventura
(8,11),#Sci-Fi
(8,12),#Accion
(9,10),
(9,2),
(9,3),
(10,2),
(10,1),
(11,13),#Comedia
(11,2),
(11,4),
(12,13),
(12,14),#Familia
(12,3),
(13,3),
(13,14),
(13,15),#Western
(14,3),
(14,1),
(15,3),
(15,7),
(16,15),
(16,1),
(17,4),
(17,3),
(17,16),#Tecnologia
(18,12),
(18,3),
(18,9),
(19,12),
(19,4),
(19,13),
(20,12),
(20,11),
(20,9),
(21,13),
(21,4),
(21,10),
(22,1),
(22,9),
(23,17),#Terror
(23,9),
(23,2),
(24,12),
(24,10),
(24,2),
(25,3),
(25,18),#Historia
(25,10),
(26,3),
(26,9),
(26,19),#Intriga
(27,12),
(27,11),
(27,17),
(28,3),
(28,9),
(28,4),
(29,3),
(29,12),
(29,10),
(30,3),
(30,11),
(30,10),
(31,3),
(31,11),
(31,9),
(32,9),
(32,10),
(32,4),
(33,3),
(33,17),
(33,4),
(34,3),
(34,7),
(35,12),
(35,2),
(35,11);

INSERT INTO peliculastrailers (idPelicula,trailer)
VALUES
(3,"https://www.youtube.com/embed/aOC8E8z_ifw"),
(7,"https://www.youtube.com/embed/zAGVQLHvwOY"),
(11,"https://www.youtube.com/embed/WBb3fojgW0Q"),
(14,"https://www.youtube.com/embed/KKziOmsJxzE"),
(15,"https://www.youtube.com/embed/s9APLXM9Ei8"),
(16,"https://www.youtube.com/embed/qLFBcdd6Qw0"),
(17,"https://www.youtube.com/embed/pWrioRji60A"),
(20,"https://www.youtube.com/embed/VHSoCnDioAo"),
(21,"https://www.youtube.com/embed/rBxcF-r9Ibs"),
(22,"https://www.youtube.com/embed/AGQ7OkmIx4Q"),
(23,"https://www.youtube.com/embed/hZeFeYSmBcg"),
(24,"https://www.youtube.com/embed/BE6inv8Xh4A"),
(25,"https://www.youtube.com/embed/SOVb0-2g1Q0"),
(27,"https://www.youtube.com/embed/nat3u3gAVLE"),
(28,"https://www.youtube.com/embed/4sYSyuuLk5g"),
(29,"https://www.youtube.com/embed/BIn8iANwEog"),
(30,"https://www.youtube.com/embed/XvB58bCVfng"),
(31,"https://www.youtube.com/embed/XRYL5spvEcI"),
(33,"https://www.youtube.com/embed/dtKMEAXyPkg");

#CONSULTO LOS DUPLICADOS
SELECT nombre, COUNT(*) AS cantidad_repeticiones
FROM actores
GROUP BY nombre
HAVING COUNT(*) > 1;

INSERT INTO peliculasrepartos (idPelicula, idActor)
SELECT 3, idActor
FROM actores
WHERE nombre IN ('Pedro Pascal', 'Carl Weathers', 'Misty Rosas', 'Chris Bartlett', 'Rio Hackford', 'Giancarlo Esposito');

INSERT INTO peliculasrepartos (idPelicula, idActor)
SELECT 4, idActor
FROM actores
WHERE nombre IN ('Tom Hopper', 'David Castañeda', 'Emmy Raver-Lampman', 'Robert Sheehan', 'Aidan Gallagher', 'Elliot Page');

-- Inserta los actores en la tabla peliculasrepartos para la película "Gambito de Dama"
INSERT INTO peliculasrepartos (idPelicula, idActor)
SELECT 5, idActor
FROM actores
WHERE nombre IN ('Anya Taylor-Joy', 'Thomas Brodie-Sangster', 'Harry Melling', 'Moses Ingram', 'Chloe Pirrie', 'Janina Elkin');

-- Inserta los actores en la tabla peliculasrepartos para la serie "Riverdale"
INSERT INTO peliculasrepartos (idPelicula, idActor)
SELECT 2, idActor
FROM actores
WHERE nombre IN ('Lili Reinhart', 'Casey Cott', 'Camila Mendes', 'Marisol Nichols', 'Madelaine Petsch', 'Mädchen Amick');

-- Inserta los actores en la tabla peliculasrepartos para la serie "The Crown"
INSERT INTO peliculasrepartos (idPelicula, idActor)
SELECT 1, idActor
FROM actores
WHERE nombre IN ('Claire Fox', 'Olivia Colman', 'Matt Smith', 'Tobias Menzies', 'Vanesa Kirby', 'Helena Bonham Carter');


-- Inserta los actores en la tabla peliculasrepartos para la película "Enola Holmes"
INSERT INTO peliculasrepartos (idPelicula, idActor)
SELECT 6, idActor
FROM actores
WHERE nombre IN ('Millie Bobby Brown', 'Henry Cavill', 'Sam Claflin', 'Helena Bonham Carter', 'Louis Partridge', 'Adeel Akhtar');


-- Inserta los actores en la tabla peliculasrepartos para la película "Guasón"
INSERT INTO peliculasrepartos (idPelicula, idActor)
SELECT 7, idActor
FROM actores
WHERE nombre IN ('Joaquin Phoenix', 'Robert De Niro', 'Zazie Beetz', 'Frances Conroy', 'Brett Cullen', 'Shea Whigham');

-- Inserta los actores en la tabla peliculasrepartos para la película "Avengers: End Game"
INSERT INTO peliculasrepartos (idPelicula, idActor)
SELECT 8, idActor
FROM actores
WHERE nombre IN ('Robert Downey Jr.', 'Chris Evans', 'Mark Ruffalo', 'Chris Hemsworth', 'Scarlett Johansson', 'Jeremy Renner');


-- Inserta los actores en la tabla peliculasrepartos para la serie "Juego de Tronos"
INSERT INTO peliculasrepartos (idPelicula, idActor)
SELECT 9, idActor
FROM actores
WHERE nombre IN ('Emilia Clarke', 'Lena Headey', 'Sophie Turner', 'Kit Harington', 'Peter Dinklage', 'Nikolaj Coster-Waldau');


-- Inserta los actores en la tabla peliculasrepartos para la serie "The Flash"
INSERT INTO peliculasrepartos (idPelicula, idActor)
SELECT 10, idActor
FROM actores
WHERE nombre IN ('Grant Gustin', 'Carlos Valdes', 'Danielle Panabaker', 'Candice Patton', 'Jesse L. Martin', 'Tom Cavanagh');


-- Inserta los actores en la tabla peliculasrepartos para la serie "The Big Bang Theory"
INSERT INTO peliculasrepartos (idPelicula, idActor)
SELECT 11, idActor
FROM actores
WHERE nombre IN ('Jim Parsons', 'Johnny Galecki', 'Kaley Cuoco', 'Simon Helberg', 'Kunal Nayyar', 'Melissa Rauch', 'Mayim Bialik');


-- Inserta los actores en la tabla peliculasrepartos para la serie "Friends"
INSERT INTO peliculasrepartos (idPelicula, idActor)
SELECT 12, idActor
FROM actores
WHERE nombre IN ('Jennifer Aniston', 'Courteney Cox', 'Lisa Kudrow', 'David Schwimmer', 'Matthew Perry', 'Matt LeBlanc');

-- Inserta los actores en la tabla peliculasrepartos para la serie "Anne with an 'E'"
INSERT INTO peliculasrepartos (idPelicula, idActor)
SELECT 13, idActor
FROM actores
WHERE nombre IN ('Amybeth McNulty', 'Geraldine James', 'R. H. Thomson', 'Corrine Koslo', 'Dalila Bela', 'Lucas Jade Zumann');


-- Inserta los actores en la tabla peliculasrepartos para la serie "Expedientes Secretos 'X'"
INSERT INTO peliculasrepartos (idPelicula, idActor)
SELECT 14, idActor
FROM actores
WHERE nombre IN ('Gillian Anderson', 'David Duchovny', 'Mitch Pileggi', 'Robert Patrick', 'Tom Braidwood', 'Bruce Harwood');


-- Inserta los actores en la tabla peliculasrepartos para la serie "Chernobyl"
INSERT INTO peliculasrepartos (idPelicula, idActor)
SELECT 15, idActor
FROM actores
WHERE nombre IN ('Jared Harris', 'Stellan Skarsgård', 'Emily Watson', 'Paul Ritter', 'Jessie Buckley', 'Adam Nagaitis');


-- Inserta los actores en la tabla peliculasrepartos para la serie "Westworld"
INSERT INTO peliculasrepartos (idPelicula, idActor)
SELECT 16, idActor
FROM actores
WHERE nombre IN ('Evan Rachel Wood', 'Thandie Newton', 'Jeffrey Wright', 'Tessa Thompson', 'Ed Harris', 'Luke Hemsworth');


-- Inserta los actores en la tabla peliculasrepartos para la serie "Halt and Catch Fire"
INSERT INTO peliculasrepartos (idPelicula, idActor)
SELECT 17, idActor
FROM actores
WHERE nombre IN ('Lee Pace', 'Scoot McNairy', 'Mackenzie Davis', 'Kerry Bishé', 'Toby Huss', 'Alana Cavanaugh');

-- Inserta los actores en la tabla peliculasrepartos para la película "Ava"
INSERT INTO peliculasrepartos (idPelicula, idActor)
SELECT 18, idActor
FROM actores
WHERE nombre IN ('Jessica Chastain', 'John Malkovich', 'Colin Farrell', 'Common', 'Geena Davis', 'Ioan Gruffudd');


-- Inserta los actores en la tabla peliculasrepartos para la película "Aves de presa y la fantabulosa emancipación de una Harley Quinn"
INSERT INTO peliculasrepartos (idPelicula, idActor)
SELECT 19, idActor
FROM actores
WHERE nombre IN ('Margot Robbie', 'Ewan McGregor', 'Mary Elizabeth Winstead', 'Jurnee Smollett', 'Rosie Perez', 'Chris Messina');


-- Inserta los actores en la tabla peliculasrepartos para la película "Archivo"
INSERT INTO peliculasrepartos (idPelicula, idActor)
SELECT 20, idActor
FROM actores
WHERE nombre IN ('Stacy Martin', 'Rhona Mitra', 'Theo James', 'Peter Ferdinando', 'Lia Williams', 'Toby Jones');


-- Inserta los actores en la tabla peliculasrepartos para la película "Jumanji - The next level"
INSERT INTO peliculasrepartos (idPelicula, idActor)
SELECT 21, idActor
FROM actores
WHERE nombre IN ('Dwayne Johnson', 'Kevin Hart', 'Jack Black', 'Karen Gillan', 'Awkwafina', 'Nick Jonas');


-- Inserta los actores en la tabla peliculasrepartos para la película "3022"
INSERT INTO peliculasrepartos (idPelicula, idActor)
SELECT 22, idActor
FROM actores
WHERE nombre IN ('Miranda Cosgrove', 'Kate Walsh', 'Omar Epps', 'Angus Macfadyen', 'Jorja Fox', 'Enver Gjokaj');

-- Inserta los actores en la tabla peliculasrepartos para la película "IT - Capítulo 2"
INSERT INTO peliculasrepartos (idPelicula, idActor)
SELECT 23, idActor
FROM actores
WHERE nombre IN ('Bill Skarsgård', 'Jessica Chastain', 'Bill Hader', 'James McAvoy', 'Isaiah Mustafa', 'Jay Ryan');

-- Inserta los actores en la tabla peliculasrepartos para la película "Pantera Negra"
INSERT INTO peliculasrepartos (idPelicula, idActor)
SELECT 24, idActor
FROM actores
WHERE nombre IN ('Chadwick Boseman', 'Michael B. Jordan', 'Lupita Nyong\'o', 'Danai Gurira', 'Martin Freeman', 'Daniel Kaluuya');

-- Inserta los actores en la tabla peliculasrepartos para la película "Contra lo imposible (Ford versus Ferrari)"
INSERT INTO peliculasrepartos (idPelicula, idActor)
SELECT 25, idActor
FROM actores
WHERE nombre IN ('Christian Bale', 'Matt Damon', 'Caitriona Balfe', 'Josh Lucas', 'Noah Jupe', 'Jon Bernthal');

-- Inserta los actores en la tabla peliculasrepartos para la película "Centígrados"
INSERT INTO peliculasrepartos (idPelicula, idActor)
SELECT 26, idActor
FROM actores
WHERE nombre IN ('Génesis Rodríguez', 'Vincent Piazza', 'Benjamin Sokolow', 'Emily Bayiokos');

-- Inserta los actores en la tabla peliculasrepartos para la película "DOOM: Aniquilación"
INSERT INTO peliculasrepartos (idPelicula, idActor)
SELECT 27, idActor
FROM actores
WHERE nombre IN ('Amy Manson', 'Luke Allen-Gale', 'Nina Bergman', 'Dominic Mafham', 'James Weber Brown', 'Lorina Kamburova');

-- Inserta los actores en la tabla peliculasrepartos para la película "Contagio"
INSERT INTO peliculasrepartos (idPelicula, idActor)
SELECT 28, idActor
FROM actores
WHERE nombre IN ('Marion Cotillard', 'Matt Damon', 'Laurence Fishburne', 'Jude Law', 'Kate Winslet', 'Jennifer Ehle', 'Gwyneth Paltrow');

-- Inserta los actores en la tabla peliculasrepartos para la película "Viuda Negra"
INSERT INTO peliculasrepartos (idPelicula, idActor)
SELECT 29, idActor
FROM actores
WHERE nombre IN ('Scarlett Johansson', 'Florence Pugh', 'David Harbour', 'O.T. Fagbenle', 'Rachel Weisz', 'William Hurt', 'Ray Winstone');

-- Inserta los actores en la tabla peliculasrepartos para la película "The Martian"
INSERT INTO peliculasrepartos (idPelicula, idActor)
SELECT 30, idActor
FROM actores
WHERE nombre IN ('Matt Damon', 'Jessica Chastain', 'Kristen Wiig', 'Jeff Daniels', 'Michael Peña', 'Sean Bean', 'Kate Mara');

-- Inserta los actores en la tabla peliculasrepartos para la película "Ex-Machina"
INSERT INTO peliculasrepartos (idPelicula, idActor)
SELECT 31, idActor
FROM actores
WHERE nombre IN ('Alicia Vikander', 'Domhnall Gleeson', 'Oscar Isaac', 'Sonoya Mizuno', 'Corey Johnson', 'Claire Selby', 'Gana Bayarsaikhan');

-- Inserta los actores en la tabla peliculasrepartos para la película "Jurassic World"
INSERT INTO peliculasrepartos (idPelicula, idActor)
SELECT 32, idActor
FROM actores
WHERE nombre IN ('Bryce Dallas Howard', 'Chris Pratt', 'Irrfan Khan', 'Vincent D\'Onofrio', 'Omar Sy', 'Nick Robinson', 'Judy Greer');

-- Inserta los actores en la tabla peliculasrepartos para la película "Soy leyenda"
INSERT INTO peliculasrepartos (idPelicula, idActor)
SELECT 33, idActor
FROM actores
WHERE nombre IN ('Will Smith', 'Alice Braga', 'Charlie Tahan', 'Dash Mihok', 'Salli Richardson-Whitfield', 'Willow Smith', 'Emma Thompson');

-- Inserta los actores en la tabla peliculasrepartos para la película "El primer hombre en la luna"
INSERT INTO peliculasrepartos (idPelicula, idActor)
SELECT 34, idActor
FROM actores
WHERE nombre IN ('Ryan Gosling', 'Claire Foy', 'Jason Clarke', 'Kyle Chandler', 'Corey Stoll', 'Patrick Fugit');

-- Inserta los actores en la tabla peliculasrepartos para la película "Titanes del pacífico - La insurrección"
INSERT INTO peliculasrepartos (idPelicula, idActor)
SELECT 35, idActor
FROM actores
WHERE nombre IN ('John Boyega', 'Scott Eastwood', 'Cailee Spaeny', 'Jing Tian', 'Rinko Kikuchi', 'Burn Gorman');




