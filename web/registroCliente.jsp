<%-- 
    Document   : cliente
    Created on : 8/11/2021, 10:44:19 AM
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
        <title>Resgistrarse</title>
    </head>
    <body>
        <jsp:include page="barraPrincipal.jsp"/>
        <h1>Registro</h1>
        <h4>Bienvenido! por favor registre sus datos.</h4>
        <div class="container-fluid" ng-app="cliente" ng-controller="clienteController as cc">
            <div class="row">
                <%--Seccion1--%>
                <div class="col-6">
                    <div class="row">
                        <div class="col-7">  
                            <label>Documento</label>
                            <input class="form-control" type="text" placeholder="documento" ng-model="cc.id_cedula">
                        </div>
                        <br/>
                        <div class="col-6">
                            <label>Nombres</label>
                            <input class="form-control" type="text" placeholder="nombre" ng-model="cc.nom_cliente">
                        </div>
                        <div class="col-6">
                            <label>Apellidos</label>
                            <input class="form-control" type="text" placeholder="apellidos" ng-model="cc.apel_cliente">
                        </div>
                        <div class="col-8">
                            <label>Dirección</label>
                            <input class="form-control" type="text" placeholder="dirección" ng-model="cc.dir_cliente">
                        </div>
                        <div class="col-4">
                            <label>Teléfono</label>
                            <input class="form-control" type="text" placeholder="teléfono" ng-model="cc.cel_cliente">
                        </div>
                        <div class="col-7">
                            <label>Correo</label>
                            <input class="form-control" type="text" placeholder="correo" ng-model="cc.correo">
                        </div>
                        <div class="col-6">
                            <label>Contraseña</label>
                            <input class="form-control" type="password" placeholder="contraseña" ng-model="cc.contrasena">
                        </div>
                        <div class="col-6">
                            <label>Confirme su contraseña</label>
                            <input class="form-control" type="password" placeholder="confirme su contraseña" ng-model="cc.contrasena2">
                        </div>
                    </div>
                </div>
                <%--Seccion 2--%>
                <div class="col-6">
                    <div class="row">
                        <div class="col-7">  
                            <label>Documento</label>
                            <input class="form-control" type="text" placeholder="documento" disabled="" value="{{cc.id_cedula}}">
                        </div>
                        <br/>
                        <div class="col-6">
                            <label>Nombres</label>
                            <input class="form-control" type="text" placeholder="nombre" disabled="" value="{{cc.nom_cliente}}">
                        </div>
                        <div class="col-6">
                            <label>Apellidos</label>
                            <input class="form-control" type="text" placeholder="apellidos" disabled="" value="{{cc.apel_cliente}}">
                        </div>
                        <div class="col-8">
                            <label>Dirección</label>
                            <input class="form-control" type="text" placeholder="dirección" disabled="" value="{{cc.dir_cliente}}">
                        </div>
                        <div class="col-4">
                            <label>Teléfono</label>
                            <input class="form-control" type="text" placeholder="teléfono" disabled="" value="{{cc.cel_cliente}}">
                        </div>
                        <div class="col-7">
                            <label>Correo</label>
                            <input class="form-control" type="text" placeholder="correo" disabled="" value="{{cc.correo}}">
                        </div>
                        <div class="col-6">
                            <label>Contraseña</label>
                            <input class="form-control" type="password" placeholder="contraseña" disabled="" value="{{cc.contrasena}}">
                        </div>
                        <div class="col-6">
                            <label>Confirme su contraseña</label>
                            <input class="form-control" type="password" placeholder="confirme su contraseña" disabled="" value="{{cc.contrasena2}}">
                        </div>
                    </div>
                </div>
            </div>
            <br/>
            <div class="row">
                <div class="col-3">
                    <button type="button" class="btn-success" ng-click="cc.guardar()">Registrarme</button>
                </div>
            </div>

        </div>
        <script>
            var app = angular.module('cliente', []);
            app.controller('clienteController', ['$http', controladorCliente]);
            function controladorCliente($http) {
                var cc = this;
                cc.guardar = function () {
                    var parametros = {
                        proceso: 'guardar',
                        id_cedula: cc.id_cedula,
                        nom_cliente: cc.nom_cliente,
                        apel_cliente: cc.apel_cliente,
                        dir_cliente: cc.dir_cliente,
                        cel_cliente: cc.cel_cliente,
                        correo: cc.correo,
                        contrasena: cc.contrasena,
                        contrasena2: cc.contrasena2
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesCliente.jsp',
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
               
            }

        </script>

    </body>
</html>
