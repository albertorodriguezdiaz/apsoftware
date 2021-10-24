from flask import request, render_template, redirect, flash
from flask.views import MethodView
from src.db import mysql


class IndexController(MethodView):
    def get(self):
        with mysql.cursor() as cur:
            cur.execute("SELECT * FROM departamento")
            departamentos = cur.fetchall()
            return render_template('public/index.html', departamentos=departamentos)



class IndexServicios(MethodView):
    def get(self):
        return render_template('public/servicios.html')

    def post(self):
        idServicio = request.form['idServicio']
        nombre = request.form['nombre']

        with mysql.cursor() as cur:
            try:
                cur.execute("INSERT INTO servicios VALUES(%s, %s)", (idServicio, nombre))
                cur.connection.commit()
                flash("El servicio fue agregado correctamente", "success")
            except:
                flash("Un error ha ocurrido", "error")

            return redirect('/servicios')
         



  



  
class IndexActividades(MethodView):
    def get(self):
        with mysql.cursor() as cur:
            cur.execute("SELECT * FROM departamento")
            departamentos = cur.fetchall()
            return render_template('public/actividades.html', departamentos=departamentos)

    def post(self):
        idActividades = request.form['idActividades']
        nombreActividad = request.form['nombreActividad']
        fecha = request.form['fecha']
        tipoActividad = request.form['tipoActividad']
        idDepartamento = request.form['idDepartamento']

        with mysql.cursor() as cur:
            try:
                cur.execute("INSERT INTO actividades VALUES(%s, %s, %s, %s, %s)", (idActividades, nombreActividad, fecha, tipoActividad, idDepartamento))
                cur.connection.commit()
                flash("La actividad fue agregada correctamente", "success")
            except:
                flash("Un error ha ocurrido", "error")

            return redirect('/actividades')





  

class IndexClientes(MethodView):
    def get(self):
        with mysql.cursor() as cur:
            cur.execute("SELECT * FROM departamento")
            departamentos = cur.fetchall()
            cur.execute("SELECT * FROM clientes")
            clientes = cur.fetchall()
            return render_template('public/clientes.html', departamentos=departamentos, clientes=clientes)
    

    def post(self):
        docIdentidad = request.form['docIdentidad']
        nombre = request.form['nombre']
        telefono = request.form['telefono']
        datos = request.form['datos']
        departamento_idDepartamento = request.form['departamento_idDepartamento']

        with mysql.cursor() as cur:
            try:
                cur.execute("INSERT INTO clientes VALUES(%s, %s, %s, %s, %s)", (docIdentidad, nombre, telefono, datos, departamento_idDepartamento))
                cur.connection.commit()
                flash("El cliente fue agregado correctamente", "success")
            except:
                flash("Un error ha ocurrido", "error")

            return redirect('/clientes')



class UpdateClientes(MethodView):
    def get(self, docIdentidad):
        with mysql.cursor() as cur:
            cur.execute("SELECT * FROM clientes WHERE docIdentidad = %s", (docIdentidad, ))
            clientes = cur.fetchone()
            print(clientes)

            # return f"Editing product {docIdentidad}"
            return render_template('public/update-clientes.html', clientes=clientes)

    def post(self, docIdentidad):
        docIdentidad = request.form['docIdentidad']
        nombre = request.form['nombre']
        telefono = request.form['telefono']
        datos = request.form['datos']
        # print(productCode, name, stock, value)

        with mysql.cursor() as cur:
            try:
                cur.execute("UPDATE clientes SET docIdentidad = %s, nombre = %s, telefono = %s, datos = %s WHERE docIdentidad = %s", (docIdentidad, nombre, telefono, datos, docIdentidad))
                cur.connection.commit()
                flash("El cliente se actualizo correctamente", "success")
            except:
                flash("Error al actualizar el cliente", "error")

            # return f"Editing product {code} works!"
            return redirect('/clientes')



class DeleteClientes(MethodView):
    def post(self, docIdentidad):
        with mysql.cursor() as cur:
            try:
                cur.execute("DELETE FROM clientes WHERE docIdentidad = %s", (docIdentidad, ))
                cur.connection.commit()
                flash("Cliente Eliminado Correctamente", "success")
            except:
                flash("Un error a ocurrido al borrar el producto", "error")

            return redirect('/clientes')




  
class IndexGrupoTrabajo(MethodView):
    def get(self):
        with mysql.cursor() as cur:
            cur.execute("SELECT * FROM departamento")
            departamentos = cur.fetchall()
            return render_template('public/grupotrabajo.html', departamentos=departamentos)

    def post(self):
        docIdentidad = request.form['docIdentidad']
        nombre = request.form['nombre']
        apellido = request.form['apellido']
        Departamento_idDepartamento = request.form['Departamento_idDepartamento']

        with mysql.cursor() as cur:
            try:
                cur.execute("INSERT INTO grupotrabajo VALUES(%s, %s, %s, %s)", (docIdentidad, nombre, apellido, Departamento_idDepartamento))
                cur.connection.commit()
                flash("El nuevo trabajador fue agregado correctamente", "success")
            except:
                flash("Un error ha ocurrido", "error")

            return redirect('/grupotrabajo')






class IndexDepartamentos(MethodView):
    def get(self):
        with mysql.cursor() as cur:
            cur.execute("SELECT * FROM servicios")
            serviciosev = cur.fetchall()
            return render_template('public/departamentos.html', servicios=serviciosev)

    def post(self):
        idDepartamento = request.form['idDepartamento']
        nombre = request.form['nombre']
        cargo = request.form['cargo']
        servicios_idServicio = request.form['servicios_idServicio']

        with mysql.cursor() as cur:
            try:
                cur.execute("INSERT INTO departamento VALUES(%s, %s, %s, %s)", (idDepartamento, nombre, cargo, servicios_idServicio))
                cur.connection.commit()
                flash("El departamento fue agregado correctamente", "success")
            except:
                flash("Un error ha ocurrido", "error")

            return redirect('/departamentos')
         



  


 
  
class IndexPagos(MethodView):
    def get(self):
        with mysql.cursor() as cur:
            cur.execute("SELECT * FROM servicios")
            serviciosev = cur.fetchall()
            cur.execute("SELECT * FROM clientes")
            clientes = cur.fetchall()
            cur.execute("Select clientes.nombre, pagos.monto from clientes Inner Join pagos On clientes.docIdentidad = pagos.Clientes_docIdentidad")
            pagos = cur.fetchall()
            return render_template('public/pagos.html', servicios=serviciosev, clientes=clientes, pagos=pagos)

    def post(self):
        idPagos = request.form['idPagos']
        concepto = request.form['concepto']
        monto = request.form['monto']
        Servicios_idServicio = request.form['Servicios_idServicio']
        Clientes_docIdentidad = request.form['Clientes_docIdentidad']

        with mysql.cursor() as cur:
            try:
                cur.execute("INSERT INTO pagos VALUES(%s, %s, %s, %s, %s)", (idPagos, concepto, monto, Servicios_idServicio, Clientes_docIdentidad))
                cur.connection.commit()
                flash("El pago fue agregado correctamente", "success")
            except:
                flash("Un error ha ocurrido", "error")

            return redirect('/pagos')
