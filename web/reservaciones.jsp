<%-- 
    Document   : reservaciones
    Created on : 10/11/2021, 04:39:59 PM
    Author     : WIN10
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
        <style>
            /*div{ border: dotted;}*/
        </style>
        <title>Reservaciones</title>
    </head>
    <body>
        <jsp:include page="barraPrincipal.jsp"></jsp:include>
        <h1>Reservación</h1>
        <div class="container-fluid" ng-app="reservaciones" ng-controller="reservacionesController as rc" >
            <div class="row">
                <div class="col-6">
                    Seccion 1
                    <div class="row">
                        <div class="col-6"> 
                            <label>Id Reserva</label>
                            <input type="number" class="form-control" placeholder="id reserva" ng-model="rc.id_reserva">
                        </div>
                        <div class="col-6"> 
                            <label>Id Cedula</label>
                            <input type="text" class="form-control" placeholder="id cedula" ng-model="rc.id_cedula">
                        </div>
                        <div class="col-6"> 
                            <label>Id Menu</label>
                            <select class="form-control" ng-model="rc.id_menu">
                                <option ng-repeat="m in rc.Menus" value="{{m.id}}">{{m.nombre_menu}}</option>
                            </select>                            
                        </div>
                        <div class="col-6"> 
                            <label>Dia Reserva</label>
                            <input type="date" class="form-control" placeholder="dia reserva" ng-model="rc.dia_reserva">
                        </div>
                        <div class="col-6"> 
                            <label>Hora Reserva</label>
                            <input type="time" class="form-control" placeholder="hora reserva" ng-model="rc.hora_reserva">
                        </div>
                        <div class="col-6"> 
                            <label>Cantidad Menu</label>
                            <input type="number" class="form-control" placeholder="cantidad menu" ng-model="rc.cantidad_menu">
                        </div>
                        <div class="col-6"> 
                            <label>Reserva Atendida</label>
                            <input type="text" class="form-control" placeholder="reserva atendida" ng-model="rc.reserva_atendida">
                        </div>
                    </div>
                    <br/>
                    <br/>
                    <div class="row">
                        <div class="col-3"> 
                            <button type="button" class="btn btn-success" ng-click="rc.guardar()">Guardar</button>
                        </div>
                        <div class="col-3"> 
                            <button type="button" class="btn btn-primary" ng-click="rc.listar()">Listar</button> 
                        </div>
                        <div class="col-3"> 
                            <button type="button" class="btn btn-warning" ng-click="rc.actualizar()">Actualizar</button>
                        </div>
                        <div class="col-3"> 
                            <button type="button" class="btn btn-danger" ng-click="rc.eliminar()">Eliminar</button>
                        </div>
                    </div>
                </div>
                <div class="col-6">
                    Seccion 2
                    <div class="row">
                        <div class="col-6">
                            <label>Id Reserva</label>
                            <input type="text" class="form-control" disabled="" value="{{rc.id_reserva}}">
                        </div>
                        <div class="col-6">
                            <label>Id Cedula</label>
                            <input type="text" class="form-control" disabled="" value="{{rc.id_cedula}}">
                        </div>
                        <div class="col-6"> 
                            <label>Id Menu</label>
                            <input type="text" class="form-control" disabled="" value="{{rc.id_menu}}">
                        </div>                        
                        <div class="col-6"> 
                            <label>Dia Reserva</label>
                            <input type="text" class="form-control" disabled="" value="{{rc.dia_reserva}}">
                        </div>
                        <div class="col-6"> 
                            <label>Hora Reserva</label>
                            <input type="text" class="form-control" disabled="" value="{{rc.hora_reserva}}">
                        </div>
                        <div class="col-6"> 
                            <label>Cantidad Menu</label>
                            <input type="text" class="form-control" disabled="" value="{{rc.cantidad_menu}}">
                        </div>
                        <div class="col-6"> 
                            <label>Reserva Atendida</label>
                            <input type="text" class="form-control" disabled="" value="{{rc.reserva_atendida}}">
                        </div>
                    </div>

                </div>
            </div>
            <br>
            <div class="row">
                <div class="col-12">
                    Seccion 3
                    <table class="table">
                        <thead class="thead-dark">
                            <tr>
                                <th scope="col">Id Reserva</th>
                                <th scope="col">Cliente</th>
                                <th scope="col">Id Menu</th>
                                <th scope="col">Dia Reserva</th>
                                <th scope="col">Hora Reserva</th>
                                <th scope="col">Cantidad Menu</th>
                                <th scope="col">Reserva Atendida</th>
                                <th scope="col">Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr ng-repeat="r in rc.reservas">
                                <td>{{r.id_reserva}}</td>
                                <td>{{r.cliente.nom_cliente}}</td>
                                <td>{{r.menu.nombre_menu}}</td>
                                <td>{{r.dia_reserva}}</td>
                                <td>{{r.hora_reserva}}</td>
                                <td>{{r.cantidad_menu}}</td>
                                <td>{{r.reserva_atendida}}</td>              
                                <td>
                                    <button type="button" class="btn btn-info" ng-click="rc.editar(r.id_reserva)">Editar</button>
                                </td>
                            </tr>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <script>
            var app = angular.module('reservaciones', []);
            app.controller('reservacionesController', ['$http', controlReservaciones]);
            function controlReservaciones($http) {
                var rc = this;
                
                consultarMenus = function(){
                    var parametros={
                        proceso: 'listar'
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesMenu.jsp',
                        params:parametros
                    }).then(function(res){
                        rc.Menus=res.data.Menu;
                    });
                };
                consultarMenus();
                rc.listar = function () {
                    var parametros = {
                        proceso: 'listar'
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesReserva.jsp',
                        params: parametros
                    }).then(function (res) {
                        rc.reservas = res.data.Reservas;
                    });
                };
                rc.guardar = function () {
                    var parametros = {
                        proceso: 'guardar',
                        id_cedula: rc.id_cedula,
                        id_menu: rc.id_menu,
                        dia_reserva: rc.dia_reserva,
                        hora_reserva: rc.hora_reserva,
                        cantidad_menu: rc.cantidad_menu,
                        reserva_atendida: rc.reserva_atendida
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesReserva.jsp',
                        params: parametros
                    }).then(function (res) {
                        if (res.data.ok === true) {//verificar si el proceso existe
                            if (res.data.guardar === true) {//verifica el resultado de la transaccion
                                alert('Guardó');
                            } else {
                                alert('No guardó');
                            }
                        } else {
                            alert(res.data.errorMsg);
                        }
                    });
                };
                rc.actualizar = function () {
                    var parametros = {
                        proceso: 'actualizar',
                        id_reserva: rc.id_reserva,
                        id_cedula: rc.id_cedula,
                        id_menu: rc.id_menu,
                        dia_reserva: rc.dia_reserva,
                        hora_reserva: rc.hora_reserva,
                        cantidad_menu: rc.cantidad_menu,
                        reserva_atendida: rc.reserva_atendida
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesReserva.jsp',
                        params: parametros
                    }).then(function (res) {
                        if (res.data.ok === true) {//verificar si el proceso existe
                            if (res.data.actualizar === true) {//verifica el resultado de la transaccion
                                alert('Actualizó');
                            } else {
                                alert('No actualizó');
                            }
                        } else {
                            alert(res.data.errorMsg);
                        }
                    });
                };
                rc.eliminar = function () {
                    var parametros = {
                        proceso: 'eliminar',
                        id_reserva: rc.id_reserva
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesReserva.jsp',
                        params: parametros
                    }).then(function (res) {
                        if (res.data.ok === true) {//verificar si el proceso existe
                            if (res.data.eliminar === true) {//verifica el resultado de la transaccion
                                alert('Eliminó');
                            } else {
                                alert('No Eliminó');
                            }
                        } else {
                            alert(res.data.errorMsg);
                        }
                    });
                };
                rc.editar = function (cod) {
                    var parametros = {
                        proceso: 'consultarIndividual',
                        id_reserva: cod
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesReserva.jsp',
                        params: parametros
                    }).then(function (res) {
                        rc.id_reserva = res.data.ReservaIndividual.id_reserva;
                        rc.id_cedula = res.data.ReservaIndividual.id_cedula;
                        rc.id_menu = res.data.ReservaIndividual.menu.id;//seguir con el proceso
                        rc.dia_reserva = res.data.ReservaIndividual.dia_reserva;
                        rc.hora_reserva = res.data.ReservaIndividual.hora_reserva;
                        rc.cantidad_menu = res.data.ReservaIndividual.cantidad_menu;
                        rc.reserva_atendida= res.data.ReservaIndividual.reserva_atendida;
                    });
                };

            }
        </script>
    </body>
</html>
