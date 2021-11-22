<%-- 
    Document   : Archivo de peticiones
    Created on : dd/mm/yyyy, hh:mm: AM/PM
    Author     : nombre autor
--%>

<%@page import="logica.Menu"%>
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
            String nombre_menu = request.getParameter("nombre_menu");
            String fecha_menu = request.getParameter("fecha_menu");
            String descripcion_menu = request.getParameter("descripcion_menu");
            double valor_menu = Double.parseDouble(request.getParameter("valor_menu"));
            Menu men = new Menu();
            men.setNombre_menu(nombre_menu);
            men.setFecha_menu(fecha_menu);
            men.setDescripcion_menu(descripcion_menu);
            men.setValor_menu(valor_menu);
            if (men.guardarMenu()) {
                respuesta += "\"" + proceso + "\": true";
            } else {
                respuesta += "\"" + proceso + "\": false";
            }

        } else if (proceso.equals("eliminar")) {
            //Solicitud de parámetros enviados desde el frontned
            //, uso de request.getParameter("nombre parametro")
            //creación de objeto y llamado a método eliminar
            int id = Integer.parseInt(request.getParameter("id"));
            Menu men = new Menu();
            men.setId(id);
            if (men.eliminarMenu()) {
                respuesta += "\"" + proceso + "\": true";
            } else {
                respuesta += "\"" + proceso + "\": false";
            }

        } else if (proceso.equals("listar")) {
            //Solicitud de parámetros enviados desde el frontned
            //, uso de request.getParameter("nombre parametro")
            //creación de objeto y llamado al metodo listar
            try {
                List<Menu> lista = new Menu().consultarMenu();
                respuesta += "\"" + proceso + "\": true,\"Menu\":" + new Gson().toJson(lista);
            } catch (Exception ex) {
                respuesta += "\"" + proceso + "\": true,\"Menu\":[]";
                Logger.getLogger(Menu.class.getName()).log(Level.SEVERE, null, ex);
            }
        }else if (proceso.equals("consultarIndividual")) {
            //Solicitud de parámetros enviados desde el frontned
            //, uso de request.getParameter("nombre parametro")
            //creación de objeto y llamado al metodo consultarIndividual
            int id = Integer.parseInt(request.getParameter("id"));
            try {
                Menu obj =new Menu(id).consultarMenuInd();
                respuesta += "\"" + proceso + "\": true,\"MenuIndividual\":" + new Gson().toJson(obj);
            } catch (Exception ex) {
                respuesta += "\"" + proceso + "\": true,\"MenuIndividual\":null";
                Logger.getLogger(Menu.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (proceso.equals("actualizar")) {
            //creación de objeto y llamado al metodo actualizar
            int id = Integer.parseInt(request.getParameter("id"));
            String nombre_menu = request.getParameter("nombre_menu");
            String fecha_menu = request.getParameter("fecha_menu");
            String descripcion_menu = request.getParameter("descripcion_menu");
            double valor_menu = Double.parseDouble(request.getParameter("valor_menu"));
            Menu men = new Menu();
            men.setId(id);
            men.setNombre_menu(nombre_menu);
            men.setFecha_menu(fecha_menu);
            men.setDescripcion_menu(descripcion_menu);
            men.setValor_menu(valor_menu);
            if (men.actualizarMenu()) {
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


