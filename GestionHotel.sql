-- Creación de la base de datos
CREATE DATABASE GestionHotel;
USE GestionHotel;

-- Tabla de Clientes
CREATE TABLE Clientes (
    ClienteID INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(100) NOT NULL,
    Apellido NVARCHAR(100) NOT NULL,
    Telefono NVARCHAR(15),
    DNI NVARCHAR(20) -- Corregido de DATE a NVARCHAR
);

-- Tabla de Habitaciones
CREATE TABLE Habitaciones (
    HabitacionID INT PRIMARY KEY IDENTITY(1,1),
    NumeroHabitacion NVARCHAR(10) NOT NULL,
    Tipo NVARCHAR(50) NOT NULL,
    PrecioPorNoche DECIMAL(10, 2) NOT NULL,
    Estado NVARCHAR(20) NOT NULL -- Disponible, Ocupada, Mantenimiento
);

-- Tabla de Reservas
CREATE TABLE Reservas (
    ReservaID INT PRIMARY KEY IDENTITY(1,1),
    ClienteID INT FOREIGN KEY REFERENCES Clientes(ClienteID),
    HabitacionID INT FOREIGN KEY REFERENCES Habitaciones(HabitacionID),
    FechaEntrada DATE NOT NULL,
    FechaSalida DATE NOT NULL,
    NumeroPersonas INT NOT NULL,
    Estado NVARCHAR(20) NOT NULL -- Confirmada, Cancelada, Finalizada
);

-- Tabla de Empleados
CREATE TABLE Empleados (
    EmpleadoID INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(100) NOT NULL,
    Apellido NVARCHAR(100) NOT NULL,
    Cargo NVARCHAR(100) NOT NULL,
    Salario DECIMAL(10, 2) NOT NULL
);

-- Tabla de Facturas
CREATE TABLE Facturas (
    FacturaID INT PRIMARY KEY IDENTITY(1,1),
    ReservaID INT FOREIGN KEY REFERENCES Reservas(ReservaID),
    FechaEmision DATE NOT NULL,
    MontoTotal DECIMAL(10, 2) NOT NULL,
    EstadoPago NVARCHAR(20) NOT NULL -- Pagada, Pendiente, Cancelada
);

INSERT INTO Clientes (Nombre, Apellido, Telefono, DNI)
VALUES
('Juan', 'Pérez', '123456789', '12345678A'),
('María', 'García', '987654321', '87654321B'),
('Carlos', 'López', '555666777', '23456789C');

INSERT INTO Habitaciones (NumeroHabitacion, Tipo, PrecioPorNoche, Estado)
VALUES
('101', 'Simple', 50.00, 'Disponible'),
('102', 'Doble', 75.00, 'Disponible'),
('201', 'Suite', 150.00, 'Disponible'),
('202', 'Doble', 80.00, 'Mantenimiento');

INSERT INTO Reservas (ClienteID, HabitacionID, FechaEntrada, FechaSalida, NumeroPersonas, Estado)
VALUES
(1, 1, '2024-08-21', '2024-08-23', 1, 'Confirmada'),
(2, 2, '2024-08-22', '2024-08-25', 2, 'Confirmada'),
(3, 3, '2024-08-20', '2024-08-22', 2, 'Finalizada');

INSERT INTO Empleados (Nombre, Apellido, Cargo, Salario)
VALUES
('Ana', 'Martínez', 'Recepcionista', 2000.00),
('Luis', 'Fernández', 'Mantenimiento', 1800.00),
('Laura', 'Rodríguez', 'Gerente', 3000.00);

INSERT INTO Facturas (ReservaID, FechaEmision, MontoTotal, EstadoPago)
VALUES
(1, '2024-08-23', 100.00, 'Pagada'),
(2, '2024-08-25', 225.00, 'Pendiente'),
(3, '2024-08-22', 300.00, 'Pagada');

select * from Habitaciones
