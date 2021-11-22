<%-- 
    Document   : autores
    Created on : 4/11/2021, 08:15:04 AM
    Author     : fido
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
        <title>Crear Menu</title>
    </head>
    <body>
        <jsp:include page="barraPrincipal.jsp"/>
        <h3>Crear Menu</h3>
        <div class="container-fluid" ng-app="menu" ng-controller="menuController as ac">
            <div class="row">
                <div class="col-6">
                    Seccion 1
                    <div class="row">
                        <div class="col-6"> 
                            <label>id</label>
                            <input type="number" class="form-control" placeholder="id" ng-model="ac.id">
                        </div>
                        <div class="col-6"> 
                            <label>Nombre Plato</label>
                            <input type="text" class="form-control" placeholder="Nombre plato" ng-model="ac.nombre_menu">
                        </div>
                        <div class="col-6"> 
                            <label>Fecha Menu</label>
                            <input type="date" class="form-control" placeholder="fecha menu " ng-model="ac.fecha_menu">
                        </div>
                        <div class="col-6"> 
                            <label>Descripción</label>
                            <textarea type="text" class="form-control" placeholder="descripcion" ng-model="ac.descripcion_menu">
                            </textarea>
                           
                        </div>
                        <div class="col-6"> 
                            <label>Valor Menu</label>
                            <input type="text" class="form-control" placeholder="valor menu" ng-model="ac.valor_menu">
                        </div>
                    </div>
                    <br/>
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
                <div class="col-6">
                    Seccion 2
                    <div class="row">
                        <div class="col-6">
                            <label>id</label>
                            <input type="number" class="form-control" placeholder="id" disabled="" value="{{ac.id}}">
                        </div>
                        <div class="col-6">
                            <label>Nombre Plato</label>
                            <input type="text" class="form-control" placeholder="Nombre Plato" disabled="" value="{{ac.nombre_menu}}">
                        </div>
                        <div class="col-6"> 
                            <label>Fecha Menu</label>
                            <input type="text" class="form-control" placeholder="fecha menu" disabled="" value="{{ac.fecha_menu}}">
                        </div>
                        <div class="col-6"> 
                            <label>Descripcion</label>
                            <textarea class="form-control" disabled="">{{ac.descripcion_menu}}</textarea>
                        </div>
                        <div class="col-6"> 
                            <label>Valor Menu</label>
                            <input type="text" class="form-control" placeholder="valor menu" disabled="" value="{{ac.valor_menu}}">
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
                                <th scope="col">id</th>
                                <th scope="col">Nombre</th>
                                <th scope="col">Fecha</th>
                                <th scope="col">Descripción</th>
                                <th scope="col">Valor</th>
                                <th scope="col">Accciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr ng-repeat="a in ac.menus">
                                <td>{{a.id}}</td>
                                <td>{{a.nombre_menu}}</td>
                                <td>{{a.fecha_menu}}</td>
                                <td>{{a.descripcion_menu}}</td>
                                <td>{{a.valor_menu}}</td>
                                <td>
                                    <button type="button" class="btn btn-info" ng-click="ac.editar(a.id)">Editar</button>
                                </td>
                            </tr>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <script>
            var app = angular.module('menu', []);
            app.controller('menuController', ['$http', controladorMenu]);
            function controladorMenu($http) {
                var ac = this;
                ac.listar = function () {
                    var parametros = {
                        proceso: 'listar'
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesMenu.jsp',
                        params: parametros
                    }).then(function (res) {
                        ac.menus = res.data.Menu;
                    });
                };
                ac.guardar = function () {
                    var parametros = {
                        proceso: 'guardar',
                        nombre_menu: ac.nombre_menu,
                        fecha_menu: ac.fecha_menu,
                        descripcion_menu: ac.descripcion_menu,
                        valor_menu: ac.valor_menu
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesMenu.jsp',
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
                ac.actualizar = function () {
                    var parametros = {
                        proceso: 'actualizar',
                        id: ac.id,
                        nombre_menu: ac.nombre_menu,
                        fecha_menu: ac.fecha_menu,
                        descripcion_menu: ac.descripcion_menu,
                        valor_menu: ac.valor_menu
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesMenu.jsp',
                        params: parametros
                    }).then(function (res) {
                        if (res.data.ok === true) {
                            if (res.data.actualizar === true) {
                                alert('Ejecutado');
                            } else {
                                alert('No ejecutado');
                            }
                        } else {
                            alert(res.data.errorMsg);
                        }
                    });
                };
                ac.eliminar = function () {
                    var parametros = {
                        proceso: 'eliminar',
                        id: ac.id
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesMenu.jsp',
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
                ac.editar = function (cod) {
                    var parametros = {
                        proceso: 'consultarIndividual',
                        id: cod
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesMenu.jsp',
                        params: parametros
                    }).then(function (res) {
                        ac.id =res.data.MenuIndividual.id;
                        ac.nombre_menu=res.data.MenuIndividual.nombre_menu;
                        ac.fecha_menu=res.data.MenuIndividual.fecha_menu;
                        ac.descripcion_menu=res.data.MenuIndividual.descripcion_menu;
                        ac.valor_menu=res.data.MenuIndividual.valor_menu;                                
                    });
                };
            }
        </script>
    </body>
</html>
