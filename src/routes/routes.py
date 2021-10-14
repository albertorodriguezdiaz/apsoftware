from src.controllers.controller import *
from src.controllers.errors import NotFoundController

routes = {
    "index_route": "/", "index_controller": IndexController.as_view("index"),

    "servicios_route": "/servicios", "servicios_controller": IndexServicios.as_view("servicios"),
    "actividades_route": "/actividades", "actividades_controller": IndexActividades.as_view("actividades"),

    "clientes_route": "/clientes", "clientes_controller": IndexClientes.as_view("clientes"),
    "clientes_update_route": "/update/clientes/<int:docIdentidad>", "clientes_update_controller": UpdateClientes.as_view("clientesUpdate"),
    "clientes_delete_route": "/delete/clientes/<int:docIdentidad>", "clientes_delete_controller": DeleteClientes.as_view("clientesDelete"),

    "departamentos_route": "/departamentos", "departamentos_controller": IndexDepartamentos.as_view("departamentos"),
    "grupotrabajo_route": "/grupotrabajo", "grupotrabajo_controller": IndexGrupoTrabajo.as_view("grupotrabajo"),
    "pagos_route": "/pagos", "pagos_controller": IndexPagos.as_view("pagos"),

    "not_found_route": 404, "not_found_controller": NotFoundController.as_view("not_found")
}