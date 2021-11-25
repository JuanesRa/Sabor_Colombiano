<%-- 
    Document   : index
    Created on : 2/11/2021, 08:24:31 AM
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
        <title>Home</title>
    </head>
    <body>
        <jsp:include page="barraPrincipal.jsp"/>
        <div class="container-fluid" ng-app="login" ng-controller="loginController as lc">
            <div class="row">
                <div class="col-4"></div>
                <div class="col-4">
                    <div class="row">
                        <div class="col-12">
                            <label>Nombre usuario</label>
                            <input type="text" class="form-control" ng-model="lc.nombreUsuario">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <label>Contraseña</label>
                            <input type="password" class="form-control" ng-model="lc.contrasena">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <button type="button" class="btn btn-primary mt-2" ng-click="lc.iniciarSesion()">Iniciar sesion</button>
                        </div>
                    </div>
                </div>
                <div class="col-4"></div>
            </div>
        </div>
        <script>
            var app = angular.module('login', []);
            app.controller('loginController', ['$http', controladorLogin]);
            function controladorLogin($http) {
                var lc = this;
                lc.iniciarSesion = function () {
                    var parametros = {
                        proceso: 'iniciarSesion',
                        nombreUsuario: lc.nombreUsuario,
                        contrasena: lc.contrasena
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesLogin.jsp',
                        params: parametros
                    }).then(function (res) {
                        if (res.data.ok === true) {
                            if (res.data.iniciarSesion === true) {
                                alert('Puede iniciar sesion');
                                
                            } else {
                                alert('No puede iniciar sesion');
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