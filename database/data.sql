/* Insertar datos */

Insert Into servicios (`idServicio`, `nombre`) Values (500, 'Desarrollo');
Insert Into servicios (`idServicio`, `nombre`) Values (501, 'Ventas');
Insert Into servicios (`idServicio`, `nombre`) Values (502, 'Soporte');

Insert Into departamento (`idDepartamento`, `nombre`, `cargo`, `Servicios_idServicio`) Values (111, 'Dep. Desarrollo', 'Desarrollador', 500);
Insert Into departamento (`idDepartamento`, `nombre`, `cargo`, `Servicios_idServicio`) Values (112, 'Dep. Ventas', 'Vendedor', 501);
Insert Into departamento (`idDepartamento`, `nombre`, `cargo`, `Servicios_idServicio`) Values (113, 'Dep. Soporte', 'Soporte Técnico', 502);
Insert Into departamento (`idDepartamento`, `nombre`, `cargo`, `Servicios_idServicio`) Values (114, 'Dep. Marketing', 'Marketing', 502);

Insert Into clientes(docIdentidad, nombre, telefono, datos, departamento_idDepartamento) values (1122335599, 'La Mayorista', 55522233, 9990, 111);
Insert Into clientes(docIdentidad, nombre, telefono, datos, departamento_idDepartamento) values (78441243, 'MakeItUSA', 1814571647, 1024, 112);
Insert Into clientes(docIdentidad, nombre, telefono, datos, departamento_idDepartamento) values (954124778, 'AltaVelocidad', 34567847, 9547, 113);


Insert Into grupotrabajo (`docIdentidad`, `nombre`, `apellido`, `Departamento_idDepartamento`) Values (850011144, 'Juan Esteban', 'Fernandez', 111);
Insert Into grupotrabajo (`docIdentidad`, `nombre`, `apellido`, `Departamento_idDepartamento`) Values (78441243, 'Nick', 'Cook', 112);
Insert Into grupotrabajo (`docIdentidad`, `nombre`, `apellido`, `Departamento_idDepartamento`) Values (954124778, 'Erick', 'Ruiz', 113);


Insert Into actividades (`idActividades`, `nombreActividad`, `fecha`, `tipoActividad`, `idDepartamento`) Values (201, 'Desarrollo a la medida', '2021-10-20', 'Desarrollo', 111);
Insert Into actividades (`idActividades`, `nombreActividad`, `fecha`, `tipoActividad`, `idDepartamento`) Values (202, 'Venta de APP', '2021-05-10', 'Ventas', 112);
Insert Into actividades (`idActividades`, `nombreActividad`, `fecha`, `tipoActividad`, `idDepartamento`) Values (203, 'Soporte', '2021-01-07', 'Soporte Técnico', 113);


Insert Into pagos (`idPagos`, `concepto`, `monto`, `Servicios_idServicio`, `Clientes_docIdentidad`) Values (9000001, '50% Anticipo Desarrollo APP', 15450000, 500, 1122335599);
Insert Into pagos (`idPagos`, `concepto`, `monto`, `Servicios_idServicio`, `Clientes_docIdentidad`) Values (9000002, 'Compra de APP', 20150000, 501, 78441243);
Insert Into pagos (`idPagos`, `concepto`, `monto`, `Servicios_idServicio`, `Clientes_docIdentidad`) Values (9000003, '100% Pago de soporte', 120000, 502, 954124778);


Insert Into clientes_correos (`idCorreo`, `correo`, `docIdentidad`) Values (301, 'jruiz@lamayorista.com.co', 1122335599);
Insert Into clientes_correos (`idCorreo`, `correo`, `docIdentidad`) Values (302, 'info@makeitusa.com', 78441243);
Insert Into clientes_correos (`idCorreo`, `correo`, `docIdentidad`) Values (303, 'sistemas@altavelocidad.com', 954124778);