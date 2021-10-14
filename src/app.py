from flask import Flask
from src.routes.routes import *

app = Flask(__name__)

app.config.from_mapping(SECRET_KEY='EVs21*')


app.add_url_rule(routes["index_route"], view_func=routes["index_controller"])
app.add_url_rule(routes["servicios_route"], view_func=routes["servicios_controller"])
app.add_url_rule(routes["actividades_route"], view_func=routes["actividades_controller"])
app.add_url_rule(routes["clientes_route"], view_func=routes["clientes_controller"])
app.add_url_rule(routes["clientes_update_route"], view_func=routes["clientes_update_controller"])
app.add_url_rule(routes["clientes_delete_route"], view_func=routes["clientes_delete_controller"])
app.add_url_rule(routes["departamentos_route"], view_func=routes["departamentos_controller"])
app.add_url_rule(routes["grupotrabajo_route"], view_func=routes["grupotrabajo_controller"])
app.add_url_rule(routes["pagos_route"], view_func=routes["pagos_controller"])


#Ruta del 404
app.register_error_handler(routes["not_found_route"], routes["not_found_controller"])
