CREATE TABLE Automotor (
    cod_Auto INT PRIMARY KEY,
    modelo VARCHAR(50),
    fec_compra DATE,
    cap_pasajero INT,
    estado VARCHAR(20),
    depreciacion DECIMAL(10),
    daño VARCHAR(100)
);

CREATE TABLE Automovil (
    cod_Auto INT PRIMARY KEY,
    auto_tipo VARCHAR(50),
    capacidad_pasajero INT,
    FOREIGN KEY (cod_Auto) REFERENCES Automotor(cod_Auto)
);

CREATE TABLE Bus (
    cod_Auto INT PRIMARY KEY,
    capacidad_pasajero INT,
    FOREIGN KEY (cod_Auto) REFERENCES Automotor(cod_Auto)
);

CREATE TABLE Camioneta (
    cod_Auto INT PRIMARY KEY,
    camioneta_traccion VARCHAR(20),
    FOREIGN KEY (cod_Auto) REFERENCES Automotor(cod_Auto)
);

CREATE TABLE TalentoHumano (
    ID_unico INT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    num_identificacion VARCHAR(20),
    experiencia INT
);

CREATE TABLE OperarioTecnico (
    ID_unico INT PRIMARY KEY,
    titulo VARCHAR(100),
    FOREIGN KEY (ID_unico) REFERENCES TalentoHumano(ID_unico)
);

CREATE TABLE Conductor (
    ID_unico INT PRIMARY KEY,
    licencia VARCHAR(50),
    FOREIGN KEY (ID_unico) REFERENCES TalentoHumano(ID_unico)
);

CREATE TABLE Estacion (
    id_estacion INT PRIMARY KEY,
    nombre_estacion VARCHAR(100),
    ubicacion VARCHAR(100),
    latitud DECIMAL(10, 7),
    longitud DECIMAL(10, 7),
    capacidad_pasajero INT
);

CREATE TABLE Ruta (
    id_ruta INT PRIMARY KEY,
    nombre_ruta VARCHAR(100),
    tp_recorrido VARCHAR(100)
);

CREATE TABLE Mantenimiento (
    cod_Auto INT,
    fecha DATE,
    descripcion VARCHAR(255),
    FOREIGN KEY (cod_Auto) REFERENCES Automotor(cod_Auto)
);

CREATE TABLE Cubren (
    cod_Auto INT,
    id_ruta INT,
    PRIMARY KEY (cod_Auto, id_ruta),
    FOREIGN KEY (cod_Auto) REFERENCES Automotor(cod_Auto),
    FOREIGN KEY (id_ruta) REFERENCES Ruta(id_ruta)
);

CREATE TABLE Conecta (
    id_ruta INT,
    id_estacion INT,
    PRIMARY KEY (id_ruta, id_estacion),
    FOREIGN KEY (id_ruta) REFERENCES Ruta(id_ruta),
    FOREIGN KEY (id_estacion) REFERENCES Estacion(id_estacion)
);
