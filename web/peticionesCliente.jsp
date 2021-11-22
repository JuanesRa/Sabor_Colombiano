<%-- 
    Document   : Archivo de peticiones
    Created on : dd/mm/yyyy, hh:mm: AM/PM
    Author     : nombre autor
--%>

<%@page import="logica.Cliente"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="application/json;charset=iso-8859-1" language="java" pageEncoding="iso-8859-1" session="true"%>

<%    // Iniciando respuesta JSON.
    String respuesta = "{";

    //Lista de procesos o tareas a realizar 
    List<String> tareas = Arrays.asList(new String[]{
        "guardar",
        "eliminar",
        "actualizar",
        "listar",
        "consultarIndividual"
    });

    String proceso = "" + request.getParameter("proceso");

    // Validación de parámetros utilizados en todos los procesos.
    if (tareas.contains(proceso)) {
        respuesta += "\"ok\": true,";
        // ------------------------------------------------------------------------------------- //
        // -----------------------------------INICIO PROCESOS----------------------------------- //
        // ------------------------------------------------------------------------------------- //
        if (proceso.equals("guardar")) {
            //Solicitud de parámetros enviados desde el frontned
            //, uso de request.getParameter("nombre parametro")
            // creación de objeto y llamado a método guardar
            String id_cedula = request.getParameter("id_cedula");
            String nom_cliente = request.getParameter("nom_cliente");
            String apel_cliente = request.getParameter("apel_cliente");
            String dir_cliente = request.getParameter("dir_cliente");
            String cel_cliente = request.getParameter("cel_cliente");
            String correo = request.getParameter("correo");
            String contrasena = request.getParameter("contrasena");
            String contrasena2 = request.getParameter("contrasena2");
            
            Cliente cli = new Cliente();
            cli.setId_cedula(id_cedula);
            cli.setNom_cliente(nom_cliente);
            cli.setApel_cliente(apel_cliente);
            cli.setDir_cliente(dir_cliente);
            cli.setCel_cliente(cel_cliente);
            cli.setCorreo(correo);
            cli.setContrasena(contrasena);
            cli.setContrasena2(contrasena2);
            
            if (cli.guardarCliente()) {
                respuesta += "\"" + proceso + "\": true";
            } else {
                respuesta += "\"" + proceso + "\": false";
            }

        } else if (proceso.equals("eliminar")) {
            //Solicitud de parámetros enviados desde el frontned
            //, uso de request.getParameter("nombre parametro")
            //creación de objeto y llamado a método eliminar
            String id_cedula = request.getParameter("id_cedula");
            Cliente cli = new Cliente();
            cli.setId_cedula(id_cedula);
            if (cli.eliminarCliente()) {
                respuesta += "\"" + proceso + "\": true";
            } else {
                respuesta += "\"" + proceso + "\": false";
            }

        } else if (proceso.equals("listar")) {
            //Solicitud de parámetros enviados desde el frontned
            //, uso de request.getParameter("nombre parametro")
            //creación de objeto y llamado al metodo listar
            try {
                List<Cliente> lista = new Cliente().consultarClientes();
                respuesta += "\"" + proceso + "\": true,\"Clientes\":" + new Gson().toJson(lista);
            } catch (Exception ex) {
                respuesta += "\"" + proceso + "\": true,\"Clientes\":[]";
                Logger.getLogger(Cliente.class.getName()).log(Level.SEVERE, null, ex);
            }
        }else if (proceso.equals("consultarIndividual")) {
            //Solicitud de parámetros enviados desde el frontned
            //, uso de request.getParameter("nombre parametro")
            //creación de objeto y llamado al metodo consultarIndividual
            String id_cedula = request.getParameter("id_cedula");
            try {
                Cliente obj =new Cliente(id_cedula).consultarCliente();
                respuesta += "\"" + proceso + "\": true,\"Cliente\":" + new Gson().toJson(obj);
            } catch (Exception ex) {
                respuesta += "\"" + proceso + "\": true,\"Cliente\":null";
                Logger.getLogger(Cliente.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (proceso.equals("actualizar")) {
            //creación de objeto y llamado al metodo actualizar
            String id_cedula = request.getParameter("id_cedula");
            String nom_cliente = request.getParameter("nom_cliente");
            String apel_cliente = request.getParameter("apel_cliente");
            String dir_cliente = request.getParameter("dir_cliente");
            String cel_cliente = request.getParameter("cel_cliente");
            String correo = request.getParameter("correo");
            String contrasena = request.getParameter("contrasena");
            String contrasena2 = request.getParameter("contrasena2");
           
            Cliente cli = new Cliente();
            cli.setId_cedula(id_cedula);
            cli.setNom_cliente(nom_cliente);
            cli.setApel_cliente(apel_cliente);
            cli.setDir_cliente(dir_cliente);
            cli.setCel_cliente(cel_cliente);
            cli.setCorreo(correo);
            cli.setContrasena(contrasena);
            cli.setContrasena2(contrasena2);
            
            if (cli.actualizarCliente()) {
                respuesta += "\"" + proceso + "\": true";
            } else {
                respuesta += "\"" + proceso + "\": false";
            }
        }

        // ------------------------------------------------------------------------------------- //
        // -----------------------------------FIN PROCESOS-------------------------------------- //
        // ------------------------------------------------------------------------------------- //
        // Proceso desconocido.
    } else {
        respuesta += "\"ok\": false,";
        respuesta += "\"error\": \"INVALID\",";
        respuesta += "\"errorMsg\": \"Lo sentimos, los datos que ha enviado,"
                + " son inválidos. Corrijalos y vuelva a intentar por favor.\"";
    }
    // Responder como objeto JSON codificación ISO 8859-1.
    respuesta += "}";
    response.setContentType("application/json;charset=iso-8859-1");
    out.print(respuesta);
%>
