<%-- 
    Document   : clientes
    Created on : 9/11/2021, 10:38:45 AM
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
        <title>Clientes</title>
    </head>
    <body>
        <jsp:include page="barraPrincipal.jsp"/>
        <h1>Lista de Clientes</h1>
        <div class="container-fluid" ng-app="clientes" ng-controller="clientesController as ac">
            <div class="row">
                <%--Seccion 1--%>
                <div class="col-6">
                    <div class="row">
                        <div class="col-7">  
                            <label>Documento</label>
                            <input class="form-control" type="text" placeholder="documento" ng-model="ac.id_cedula">
                        </div>
                        <br/>
                        <div class="col-6">
                            <label>Nombres</label>
                            <input class="form-control" type="text" placeholder="nombre" ng-model="ac.nom_cliente">
                        </div>
                        <div class="col-6">
                            <label>Apellidos</label>
                            <input class="form-control" type="text" placeholder="apellidos" ng-model="ac.apel_cliente">
                        </div>
                        <div class="col-8">
                            <label>Dirección</label>
                            <input class="form-control" type="text" placeholder="dirección" ng-model="ac.dir_cliente">
                        </div>
                        <div class="col-4">
                            <label>Teléfono</label>
                            <input class="form-control" type="text" placeholder="teléfono" ng-model="ac.cel_cliente">
                        </div>
                        <div class="col-7">
                            <label>Correo</label>
                            <input class="form-control" type="text" placeholder="correo" ng-model="ac.correo">
                        </div>   
                    </div>
                    <br/>
                    <div class="row">
                        <div class="col-3"> 
                            <button type="button" class="btn btn-success" ng-click="ac.guardar()">Guardar</button>
                        </div>
                        <div class="col-3"> 
                            <button type="button" class="btn btn-primary" ng-click="ac.listar()">Listar</button> 
                        </div>
                        <div class="col-3"> 
                            <button type="button" class="btn btn-warning" ng-click="ac.actualizar()">Actualizar</button>
                        </div>
                        <div class="col-3"> 
                            <button type="button" class="btn btn-danger" ng-click="ac.eliminar()">Eliminar</button>
                        </div>
                    </div>
                </div>

                <%--Seccion 2--%>
                <div class="col-6">
                    <div class="row">
                        <div class="col-7">  
                            <label>Documento</label>
                            <input class="form-control" type="text" placeholder="documento" disabled="" value="{{ac.id_cedula}}">
                        </div>                       
                        <div class="col-6">
                            <label>Nombres</label>
                            <input class="form-control" type="text" placeholder="nombre" disabled="" value="{{ac.nom_cliente}}">
                        </div>
                        <div class="col-6">
                            <label>Apellidos</label>
                            <input class="form-control" type="text" placeholder="apellidos" disabled="" value="{{ac.apel_cliente}}">
                        </div>
                        <div class="col-8">
                            <label>Dirección</label>
                            <input class="form-control" type="text" placeholder="dirección" disabled="" value="{{ac.dir_cliente}}">
                        </div>
                        <div class="col-4">
                            <label>Teléfono</label>
                            <input class="form-control" type="text" placeholder="teléfono" disabled="" value="{{ac.cel_cliente}}">
                        </div>
                        <div class="col-7">
                            <label>Correo</label>
                            <input class="form-control" type="text" placeholder="correo" disabled="" value="{{ac.correo}}">
                        </div>                      
                    </div>
                </div>                

            </div>
            <%--Seccion 3--%>
            <br/>
            <div class="row">
                <div class="col-12">                    
                    <table class="table">
                        <thead class="thead-dark">
                            <tr>
                                <th scope="col">Documento</th>
                                <th scope="col">Nombres</th>
                                <th scope="col">Apellidos</th>
                                <th scope="col">Dirección</th>
                                <th scope="col">Teléfono</th>
                                <th scope="col">Correo</th>
                                <th scope="col">Acciones</th>

                            </tr>
                        </thead>
                        <tbody>
                            <tr ng-repeat="c in ac.clientes">
                                <td>{{c.id_cedula}}</td>
                                <td>{{c.nom_cliente}}</td>
                                <td>{{c.apel_cliente}}</td>
                                <td>{{c.dir_cliente}}</td>
                                <td>{{c.cel_cliente}}</td>
                                <td>{{c.correo}}</td>
                                <td>
                                    <button type="button" class="btn btn-info" ng-click="ac.editar(c.id_cedula)">Editar</button>
                                </td>
                            </tr>

                        </tbody>
                    </table>
                </div>
            </div>

        </div>
        <script>
            var app = angular.module('clientes', []);
            app.controller('clientesController', ['$http', controladorClientes]);
            function controladorClientes($http) {
                var ac = this;
                ac.listar = function () {
                    var parametros = {
                        proceso: 'listar'
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesCliente.jsp',
                        params: parametros
                    }).then(function (res) {
                        ac.clientes = res.data.Clientes;
                    });
                };
                ac.guardar = function () {
                    var parametros = {
                        proceso: 'guardar',
                        id_cedula: ac.id_cedula,
                        nom_cliente: ac.nom_cliente,
                        apel_cliente: ac.apel_cliente,
                        dir_cliente: ac.dir_cliente,
                        cel_cliente: ac.cel_cliente,
                        correo: ac.correo
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesCliente.jsp',
                        params: parametros
                    }).then(function (res) {
                        if (res.data.ok === true) {
                            if (res.data.guardar) {
                                alert("Guardó")
                            } else {
                                alert("No guardo");
                            }
                        } else {
                            alert(res.data.ErrorMsg);
                        }
                    });
                };
                ac.actualizar = function () {
                    var parametros = {
                        proceso: 'actualizar',
                        id_cedula: ac.id_cedula,
                        nom_cliente: ac.nom_cliente,
                        apel_cliente: ac.apel_cliente,
                        dir_cliente: ac.dir_cliente,
                        cel_cliente: ac.cel_cliente,
                        correo: ac.correo
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesCliente.jsp',
                        params: parametros
                    }).then(function (res) {
                        if (res.data.ok === true) {
                            if (res.data.actualizar) {
                                alert("Guardó");
                            } else {
                                alert("No guardo");
                            }
                        } else {
                            alert(res.data.ErrorMsg);
                        }
                    });
                };
                ac.editar = function (cod) {
                    var parametros = {
                        proceso: 'consultarIndividual',
                        id_cedula: cod
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesCliente.jsp',
                        params: parametros
                    }).then(function (res) {
                        ac.id_cedula = res.data.Cliente.id_cedula;
                        ac.nom_cliente = res.data.Cliente.nom_cliente;
                        ac.apel_cliente = res.data.Cliente.apel_cliente;
                        ac.dir_cliente = res.data.Cliente.dir_cliente;
                        ac.cel_cliente = res.data.Cliente.cel_cliente;
                        ac.correo = res.data.Cliente.correo;
                    });
                };
                ac.eliminar = function () {
                    var parametros = {
                        proceso: 'eliminar',
                        id_cedula: ac.id_cedula
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesCliente.jsp',
                        params: parametros
                    }).then(function (res) {
                        if (res.data.ok === true) {
                            if (res.data.eliminar === true) {
                                alert('Ejecutado');
                            } else {
                                alert('No ejecutado');
                            }
                        } else {
                            alert(res.data.errorMsg);
                        }
                    });
                };
            }
        </script>

    </body>
</html>
