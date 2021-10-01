
CREATE DATABASE CORUNA2021;

Año 2021, La Coruña se encuentra en horas bajas... en cuanto a delincuencia se refiere, ya que por otro lado, el Deportivo ha sido 
de nuevo campeón de Liga, pero bueno vamos a lo que nos interersa....
Existen un gran número de de delincuentes,poco a poco estamos tratando mde identificarlos.
Un reducido grupo de policìas ayudado por unos jueces, trataran de detenerlos y
juzgarlos, para mandarlos a donde realmente se merecen...chirona (carceles).
Necesitamos a alguíen que pueda ayudarnos a gestionar esto,¿podrías echarnos una mano?. Contamos contigo no nos falles....

A continuación, vamos a reflejar un modelo de tabla, para tener controlados a estos malhechores, que Dios los proteja...

CREATE TABLE delincuentes(
id_delincuentes INT(3) PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(20) NOT NULL,
mote VARCHAR(25),
edad INT(2) NOT NULL,
especialidad ENUM("hurto","atraco","traficante"),
carcel BOOLEAN
); 

Comenzamos a añadir a nuestra tabla "delincuentes" a toda esta gentuza....

INSERT INTO delincuentes(nombre, mote, edad, especialidad, carcel )
VALUES("Francisco", "gatillofacil", 45, "atraco", true),
("Soledad", "chicharras", 48, "hurto", false),
("Mauricio", "cacolas", 58, "traficante", true),
("Trinidad", "supermercados", 47, "traficante", false),
("Jose", "gafe", 36, "hurto", true),
("Marcial", "lenguasellada", 19, "atraco", true),
("Benjamin", "niño", 18, "traficante", false);

Parece, que se nos ha quedado alguien, que se nos había olvidado y debemos introducirlo en nuestra tabla "delincuentes"..

INSERT INTO delincuentes(nombre, mote, edad, carcel)
VALUES("Radchenko", "chevalier", 51, true);

También vamos a crear en nuestro distrito policial, una tabla llamada "policias", donde registraremos, las características
de las personas encargadas de limpiar, nuestra peligrosa ciudad y que vuelva a resplandecer como años atrás.

CREATE TABLE policias(
id_policias INT(3) PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(25) NOT NULL,
apellido VARCHAR(25) NOT NULL,
edad INT(2) NOT NULL,
arma ENUM("recortada", "subfusil", "pistola") NOT NULL,
corrupto BOOLEAN
);

Maldita sea, el técnico que está creando las tablas, se le ha olvidado introducir un campo en la tabla(policias), "mote", que deseamos 
ponerlo después de apellido. Este técnico no se entera de nada, menos mal que cobra poco...

ALTER TABLE policias
ADD COLUMN mote VARCHAR(25) NOT NULL  AFTER apellido;

INSERT INTO policias(nombre, apellido, mote, edad, arma, corrupto)
VALUES("Francisco", "Gutierrez", " harrys", 64, "recortada", true),
("Jesús", "Gil", "presi", 68, "subfusil", true),
("Alex", "Murphy", "robocop", 99, "pistola", false),
("Augusto", "Lendoiro", "pinguino", 67, "pistola", false),
("Norredine", "Naybet", "cortelimpio", 45,"subfusil", false),
("Hulk", "Hogan", "pocabroma", 49, "recortada", false ),
("Francisco", "Gonzalez", "capi", 47, "pistola", false);

También nos gustaría llevar un control de las "carceles" a las que mandamos a los delincuentes

CREATE TABLE carceles(
    id_carceles INT(3) PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(25) NOT NULL,
    juzgado ENUM("penal1", "penal2", "penal3")
);

Una vez creada la tabla en nuestra BBDD, procedemos a introducir los datos en sus respectivos campos

INSERT INTO carceles(nombre, juzgado)
VALUES("Teixeiro", "penal1"),
("LaModelo", "penal2"),
("Carabanchel", "penal3");

Por último y no menos importantes nos quedan los "jueces", les haremos también una tabla para llevar un control interno,
ya que hay veces que pueden estar corrompidos por grandes mafias....

CREATE TABLE jueces(
id_jueces INT(3) PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(25) NOT NULL,
corrompido BOOLEAN
);

Como no... el maldito técnico que hemos contratado para hacer la BBDD CORUNA2021, se ha vuelto a confundir, nos ha colocado 
el campo juzgado en la tabla carceles en vez de localidad, creo que tiene los días contados en esta comisaría, vamos 
a intentar arreglarlo, que desastre de tipo...

 ALTER TABLE carceles
 DROP COLUMN juzgado;

 ALTER TABLE carceles
 ADD COLUMN localidad VARCHAR(25) NOT NULL AFTER nombre;

 ALTER TABLE jueces
 ADD COLUMN juzgado ENUM("penal1", "penal2", "penal3");
 
 Ahora resuelta la estructura añadiremos, los datos correctos en la tabla carceles

UPDATE carceles
SET  localidad = "Coruna"
WHERE id = 1;

UPDATE carceles 
SET localidad = "Madrid"
WHERE id = 2;

UPDATE carceles
SET localidad = "Madrid"
WHERE id = 3;

Este maldito becario, nos está haciendo perder el tiempo y hay mucha escoria por limpiar en las calles, 
estamos deseando salir a cazar y tenemos las armas cargadas.....
Vamos a añadir los datos a la tabla jueces, que es la última que nos queda para tener las 4 ordenadas y saber
con quien estamos tratando, crucemos los dedos para que el maldito becario no la líe...

INSERT INTO jueces(nombre, corrompido, juzgado)
VALUES("Sierra", true, "penal1"),
("Ignatius", false, "penal2"),
("Pedrerol", true, "penal3");


Al fin salimos a las calles, la comisaría se encuentra revoluccionada ....

Nos encontramos en Los Mallos, han atracado a una señora, demonios!! hemos llegado tarde, pero un chivato de la zona,
el cual nos da información, nos comenta lo siguiente: Es una persona de entre 40-50 años, 
le ha parecido que su mote termina en "s". El chivato no nos dice mas, pero gracias a nuestra base de datos  
y la situación sabemos que es un hurto. Vamos a darle trabajo al becario..

SELECT edad, mote, especialidad
FROM delincuentes
WHERE edad IN(40,50) AND mote LIKE "%s" AND especialidad = "hurto";

Gracias a los filtros de nuestra base de datos, hemos logrado dar con una vieja conocida
"Soledad" la mítica "supermercados". Gracias a la "presión" a la que la hemos sometido,
hemos comseguido recuperar las pertenencias de la pobre señora y conseguir que sea juzgada.

Por un control de delincuentes , nos gustaría saber: la edad media, la edad mayor y la edad 
mínima de todas las "joyas" que tenemos fichadas. Becariooooo tienes chollo...

SELECT AVG(edad)
FROM delincuentes;

SELECT MAX(edad)
FROM delincuentes;

SELECT MIN(edad)
FROM delincuentes;

Al ser un becario, le estamos mandando tareas fáciles, pero ahora ya nos interesa saber:
Cuantos delincuentes su nombre comienza por "M".
Policías que  usan subfusil o su nombre empieza por "A".
Jueces que tienen un nombre mayor a seis caracteres.

SELECT COUNT(nombre)
FROM delincuentes
WHERE nombre LIKE "M%";

SELECT *
FROM policias
WHERE arma = "subfusil" OR nombre LIKE "A%";

SELECT nombre
FROM jueces
WHERE LENGTH(nombre)>6;

URGENTE!!! Algunos delincuentes que han salido de la carcel recientemente, han atracado
una sucursal, las cámaras han captado que son menores de 60 años por su agilidad.

SELECT especialidad, nombre, edad 
FROM delincuentes
GROUP BY especialidad, nombre;

Malas noticias, una bala perdida ha acabado con la vida de unos de nuestros mejores policias
se trata de "Hulk" "pocabroma"...La comisaría esta con ganas de atrapar al desgraciado que 
nos ha arrebatado a "pocabroma"..DEP.
Un día duro para el becario, deberá eliminarlo de la tabla policias1...

DELETE
FROM policias
WHERE id = 6;

Días jodidos, tras la muerte de "pocabroma", su legado y sus nervios de acero perdurarán...

Retomamos el atraco bancario, al haber agrupado a los delincuentes por su nombre y "especialiadad"
tenemos a Francisco y Marcial como sospechosos...
Vamos a interrogarlos...
Parece que uno de nuestros hombres, por la presión que esta sometido, se le ha ido la mano
y ha matado a Marcial. Deberemos eliminarlo de nuestra BBDD.

DELETE
FROM delincuentes
WHERE nombre = "Marcial";

Hemos detenido a su compinche "Francisco" con mote "gatillofacil". Estamos pensando que sería bueno 
llevar un control de las detenciones por lo que nos interesa mandarle al becario que cree una nueva
tabla compuesta. Si logra hacerlo exitosamente, le daremos una placa, sueldo, arma, mote... y entrará 
en nuesta tabla policias... Ánimo leal becario..

CREATE TABLE policiasDelincuentes(
id_policias INT(3),
id_delincuentes INT(3),
fecha_detencion DATETIME,
distrito VARCHAR(30)
);


INSERT INTO policiasDelincuentes VALUES(1, 2, "2020-12-02", "Elviña");


ALTER TABLE policiasDelincuentes
ADD PRIMARY KEY(id_policias, id_delincuentes),
ADD FOREIGN KEY (id_policias) REFERENCES policias(id),
ADD FOREIGN KEY (id_delincuentes) REFERENCES delincuentes(id);


INSERT INTO policias(nombre, apellido, mote, edad, arma, corrupto)
VALUES("Jose", "Almajano", "becarier", 39, "subfusil", true);

Parece ser, que el cabroncete del becario se ha convertido en uno mas de nosotros.
Deberá estar preparado para actuar en todo tipo de casos, pero se ve que tiene agallas y ganas de vengar a "pocabroma".

Ahora cada vez que detengamos a alguien, podremos insertarlo en nuestra tabla compuesta
"policiasDelincuentes" y así llevar un mayor control. Por cierto "becarier", seguirá trabajando
en las BBDD CORUNA2021, pero cuando haya "fiesta" saldrá a bailar con nosotros.

Se han identificado 2 nuevos delincuentes y pasaremos a ficharlos:

INSERT INTO delincuentes(nombre, mote, edad, especialidad, carcel )
VALUES("Miguel", "narizdebrujo", 45, "atraco", true),
("Sinai", "motocicletas", 48, "traficante", true);

Debido al alto índice de criminalidad, nos mandan de otra comisaría a un nuevo compañero, con mucha experiencia en dirigir
a grupos de policías. Lo primero que nos dice es que nuestra BBDD , la tabla policías, no cuenta con un campo que muestre 
el rango de cada uno de nosotros. Debido a ello vamos a crearla...

ALTER TABLE policias
ADD COLUMN rango VARCHAR(25);

Una vez hecho este sencillo proceso para "becarier", insertaremos los datos de ese misterioso nuevo compañero. Tras ello como 
nos han aconsejado, insertamos los rangos(al aceptar NULL, solo de aquellos que sepamos por ahora).

INSERT INTO policias(nombre, apellido, mote, edad, arma, corrupto, rango)
VALUES("Manuel", "Richman", "profe", 37, "recortada", false, "jefe");

Una vez dada la bienvenida que se merece este nuevo compañero, y que nos guiará a la victoria y estabilidad coruñesa, cúal
Arsenio Iglesias, procedemos a insertar unos ranguitos....

UPDATE policias
SET rango = "capitan"
WHERE id = 9;

UPDATE policias
SET rango = "cabo"
WHERE id BETWEEN 12 AND 15;

UPDATE policias
SET rango = "oficial"
WHERE id IN(11,17);



El "profe" "Richman", sale con "becarier" a patrullar las calles, "Richman" sabe todas las triquiñuelas y por donde
se desenvuelve la delincuencia....
No tardan en detener a dos delincuentes, en el distrito de Los Mallos, por lo que "becarier" aparte de hacer su primera
detención, al llegar a comisaría tendrá que pasar a su tabla policiasDelincuentes a sus dos nuevos fichajes de invierno,
por fin vé, que tanto puede usar su arma como su ordenador para trabajar. Un buen dia para "becarier" que demonios....
Ambos compañeros salen a tomar un Bitter Kas para celebrarlo.

INSERT INTO policiasDelincuentes VALUES(16, 12, "2021-01-12", "Mallos"),(17, 13, "2021-01-12", "Mallos");

Con "Richman" al frente, le comenta a "becarier" que es necesario saber en que carcel se encuentra cada delincuente,
en caso de que estén encarcelados en ese momento .Por lo que vamos a alterar nuestra tabla delincuentes, 
añadiendo el id de la carcel donde se encuentra cada delincuente. ("becarier" tiene una duda de si será posible añadir
a la tabla delincuentes id null ya que habrá delincuentes que no se encuentren entre rejas(carcel) ).
Bajo la tutela de "Richman", procedemos a alterar la tabla delincuentes. Como la columna id de la tabla carceles acepta null, 
no tendremos que modificarla previamente. Allá vamos....

ALTER TABLE delincuentes
ADD COLUMN id_carceles INT(3),
ADD FOREIGN KEY(id_carceles) REFERENCES carceles(id);

Como la ciudad no nos da tregua, nos llega a comisaría una llamada que nos dice lo siguiente:
-Buenas tardes, llamo para quejarme de un trapicheo de drogas. He visto por la ventana a una persona de entre 40-60 años 
vendiendo droga a unos individuos. Me ha parecido oir que su nombre empezaba por "m". Es lo único que les puedo decir....
-Muchas gracias, persona anónima, sus pistas nos hacen ponernos en búsqueda del delincuente.
Becarieeeeeeeer tienes curro.....

SELECT *
FROM delincuentes
WHERE edad BETWEEN 40 AND 60 AND nombre LIKE "M%";

El mítico "cacolas" vaya desgraciado, no aprende, como no lo hemos visto insitu, lo único que podemos hacer es un
seguimiento para cogerlo con las manos en la masa. Pero gracias a nuestra tabla delincuentes, hemos sacado por la 
descripción de quien se podía tratar. Además su "especialidad" de traficante, nos cuadra con las artes denunciadas.
"Cacolas" vamos a por ti campeón...

Por la normativa actual, nos obligan al compañero "Jesús" "Gil", a darle un cargo ya que se encuentra en prácticas y 
a retirarle su subfusil, le queda muy grande en sus manos inexpertas y le daremos una pistola, que bien le llega.

UPDATE policias
SET arma="pistola"
WHERE id=10; 

Desde la central, nos obligan a contratar a una vidente, para que pueda ayudarnos con sus "visiones" a resolver algún 
caso. Dicha medium se llama "Martirium" ( 90666655 **-2€/min línea móvil, 1.65€/min red móvil.) y aunque venga recomendada, 
va a pasar una prueba .....
Si nos gusta lo q ve la meteremos en nómina(tabla policías).

Lo 1º que haremos será qu nos averigue un "id", dándole un "mote",por lo que será un número lo que deberá adivinar.
Nosotros gracias a nuestras tablas, lo tenemos fácil.
El "mote" que le daremos es: "gatillofacil".

SELECT id
FROM delincuentes
WHERE mote="gatillofacil";   Nosotros sabemos que esta consulta nos dará id= 11;

Al preguntarle, sorprendentemente acierta con el id, parece ser que o tiene mucha suerte o algun poder tiene....
Por lo que queremos que nos de más datos de "gatillofacil", le pedimos que sabiendo el id que había averiguado,
nos diga la fecha de detención, en caso de que lo estuviese en algún momento.

SELECT *
FROM policiasDelincuentes
WHERE id_delincuentes=(SELECT id
                        FROM delincuentes
                        WHERE mote="gatillofacil");        "Becarier" gracias a una subconsulta ha conseguido
                                                            la siguiente información:
                                                                             2021-01-05 16:23:29 | Elviña

"Martirium" nos deja anonadados con su respuesta. Coincide tal y como "becarier" había conseguido por su subconsulta.
No nos quedan mas narices que contratarla y meterla en nuestra tabla policías.

INSERT INTO policias(nombre,apellido, mote, edad,corrupto,rango)
VALUES("Martirium","Averia","brujerias",120, true,"visionaria");

Estando fuera de servicio, el compañero "pocabroma", se encuentra en un local de "Monte Alto", con "cacolas", sabe que pesa una 
orden de detención sobre el...
"Pocabroma" no duda ni un momento y lo inmoviliza contra el cristal de un coche, lo ha detenido al fin...
Antes de insertar el arresto, como no nos acordamos de los id de "pocabroma" y "cacolas", vamos a buscarlos, sabemos que uno es compañero
(policía) y el otro un delincuente.

SELECT id
FROM policias
WHERE mote="pocabroma";    ----Nos da el id = 14-----

SELECT id
FROM delincuentes
WHERE mote="cacolas";     ----Nos sale id = 13-------



INSERT INTO policiasDelincuentes VALUES(14,13,"2021-01-19", "Monte Alto");

Nos comunican que "Mauricio" alias el "cacolas" ha sido condenado a prisión e ingresará en el Centro Penitenciario de Teixeiro.
Como con anterioridad hemos usado su id que es 13, pero lo que no sabemos es el id de la carcel de Teixeiro, por lo que será 
la primera misión de "becarier".

SELECT id
FROM carceles
WHERE nombre="Teixeiro";  ---Nos dá como resultado el id =1-----

UPDATE delincuentes
SET id_carceles=1
WHERE id=13;

Ahora nos apetece tener en una única lista, los nombres de los policìas y de los delincuentes, para hacer trabajar a "becarier" y de paso 
coger ideas para ponerle nombre a un loro que hemos encontrado...

SELECT nombre AS Becarier_No_Para
FROM policias
UNION ALL
SELECT nombre
FROM delincuentes;
 

MISIÓN 2.
(Se recomienda escuchar mientras se lee esta BBDD --Killed By Death, Motorhead--)

CAPITULO 1: Persiguiendo a la muerte.

Año 2022, una pandemia ha acabado con un gran número de población. En nuestra ciudad se ha cebado, matando a casi toda
nuestra plantilla , a todos los jueces, delincuentes...
Las carceles han sido quemadas y la ciudad está a merced de malhechores...
De los "nuestros", solo han sibrevivido "Becarier" y "Richman". Eso si, han sufrido mutaciones que los convierten en "superpolicias",
no todos los supervivientes las han tenido.
Toda la base de datos anterior, no nos sirve para nada y pasaremos a borrarla...

DROP DATABASE  CORUNA2021;

Como queremos volver a tener una BBDD para controlar a toda la mala gente, procederemos a crear una.

CREATE DATABASE Resurreccion;

CREATE TABLE Policias(

    idPolicia INT(3) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(45) NOT NULL,
    apodo VARCHAR(45),
    mutacion BOOLEAN,
    arma ENUM("ak47", "katana","lanzallamas")
);

CREATE TABLE Vehiculos(
    idVehiculo INT(3) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    kmSinRepostar INT(3) NOT NULL,
    modelo ENUM("helicoptero", "acorazado", "motoBiplaza")
);

CREATE TABLE policiasVehiculos(
    idPolicia INT(3),
    idVehiculo INT(3),
    PRIMARY KEY (idPolicia,idVehiculo),
    FOREIGN KEY (idPolicia) REFERENCES Policias(idPolicia),
    FOREIGN KEY (idVehiculo) REFERENCES Vehiculos(idVehiculo)
);

CREATE TABLE Delincuentes(
    idDelincuente INT(3) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(45) NOT NULL,
    apodo VARCHAR(45),
    peligroso BOOLEAN,
    mutante BOOLEAN
);

CREATE TABLE Detenciones(
    idPolicia INT(3),
    idDelincuente INT(3),
    tortura ENUM("paliza", "corteDedo","venganzaMortal"),
    PRIMARY KEY (idPolicia, idDelincuente),
    FOREIGN KEY (idPolicia) REFERENCES Policias (idPolicia),
    FOREIGN KEY (idDelincuente) REFERENCES Delincuentes(idDelincuente)
);
*********************************
Nos hemos dado cuenta, que por la situación de caos que vivimos, muchos delincuentes disponen de vehículos 
que tenemos contemplados en nuestra tabla vehículos, por lo que "alteraremos" nuestra tabla delincuentes para 
así poder asignarle a cada uno de ellos, en caso de tenerlo.

ALTER TABLE Delincuentes
ADD COLUMN idVehiculo INT(3)
ADD FOREIGN KEY(idVehiculo) REFERENCES Vehiculos(idVehiculo);

INSERT INTO Policias(nombre,apodo,mutacion,arma)
    VALUES("Manuel", "Richman",true,"lanzallamas"),
        ("Jose", "Becarier", true,"ak47"),
        ("Fernando", "Tito", false, "lanzallamas"),
        ("Marta", "Capi", false, "katana"),
        ("Stanis","ViejoZorro", true,"ak47");

INSERT INTO Delincuentes(nombre,apodo,peligroso,mutante,idVehiculo)
    VALUES("Yosune","Chamorro", false, true,1),
        ("Sinai", "ElRobaBragas", true,true,2),
        ("Norrudine", "Nazareno", true, false,1),
        ("MiguelBose","Negaciones", false, true,3),
        ("DavidBisbal", "retrasos",false, false,1);

Ahora asignaremos a cada Policia un Vehiculo...
Atentos que no quiero luego preguntas tales como: ¿Y yo a donde iba?. Hay mucho delincuente que ajusticiar....

INSERT INTO policiasVehiculos(idPolicia,idVehiculo)
    VALUES(1,3),
        (2,3),
        (3,1),
        (4,1),
        (5,2);