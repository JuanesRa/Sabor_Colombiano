<%-- 
    Document   : Archivo de peticiones
    Created on : dd/mm/yyyy, hh:mm: AM/PM
    Author     : nombre autor
--%>


<%@page import="logica.Reserva"%>
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
            int id_menu = Integer.parseInt(request.getParameter("id_menu"));
            String dia_reserva = request.getParameter("dia_reserva");
            String hora_reserva = request.getParameter("hora_reserva");
            int cantidad_menu = Integer.parseInt(request.getParameter("cantidad_menu"));
            boolean reserva_atendida = Boolean.parseBoolean(request.getParameter("reserva_atendida"));
           
            Reserva res = new Reserva();
            res.setId_cedula(id_cedula);
            res.setId_menu(id_menu);
            res.setDia_reserva(dia_reserva);
            res.setHora_reserva(hora_reserva);
            res.setCantidad_menu(cantidad_menu);
            res.setReserva_atendida(reserva_atendida);
            
            if (res.guardarReserva()) {
                respuesta += "\"" + proceso + "\": true";
            } else {
                respuesta += "\"" + proceso + "\": false";
            }

        } else if (proceso.equals("eliminar")) {
            //Solicitud de parámetros enviados desde el frontned
            //, uso de request.getParameter("nombre parametro")
            //creación de objeto y llamado a método eliminar
            String id_cedula = request.getParameter("id_cedula");
            Reserva cli = new Reserva();
            cli.setId_cedula(id_cedula);
            if (cli.eliminarReserva()) {
                respuesta += "\"" + proceso + "\": true";
            } else {
                respuesta += "\"" + proceso + "\": false";
            }

        } else if (proceso.equals("listar")) {
            //Solicitud de parámetros enviados desde el frontned
            //, uso de request.getParameter("nombre parametro")
            //creación de objeto y llamado al metodo listar
            try {
                List<Reserva> lista = new Reserva().consultarReservas();
                respuesta += "\"" + proceso + "\": true,\"Reservas\":" + new Gson().toJson(lista);
            } catch (Exception ex) {
                respuesta += "\"" + proceso + "\": true,\"Reservas\":[]";
                Logger.getLogger(Reserva.class.getName()).log(Level.SEVERE, null, ex);
            }
        }else if (proceso.equals("consultarIndividual")) {
            //Solicitud de parámetros enviados desde el frontned
            //, uso de request.getParameter("nombre parametro")
            //creación de objeto y llamado al metodo consultarIndividual
            int id_reserva = Integer.parseInt(request.getParameter("id_reserva"));
            try {
                Reserva obj =new Reserva(id_reserva).consultarReserva();
                respuesta += "\"" + proceso + "\": true,\"ReservaIndividual\":" + new Gson().toJson(obj);
            } catch (Exception ex) {
                respuesta += "\"" + proceso + "\": true,\"ReservaIndividual\":null";
                Logger.getLogger(Reserva.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (proceso.equals("actualizar")) {
            //creación de objeto y llamado al metodo actualizar
            int id_reserva = Integer.parseInt(request.getParameter("id_reserva"));
            String id_cedula = request.getParameter("id_cedula");
            int id_menu = Integer.parseInt(request.getParameter("id_menu"));
            String dia_reserva = request.getParameter("dia_reserva");
            String hora_reserva = request.getParameter("hora_reserva");
            int cantidad_menu = Integer.parseInt(request.getParameter("cantidad_menu"));
            boolean reserva_atendida = Boolean.parseBoolean(request.getParameter("reserva_atendida"));
           
            Reserva res = new Reserva();
            res.setId_reserva(id_reserva);
            res.setId_cedula(id_cedula);
            res.setId_menu(id_menu);
            res.setDia_reserva(dia_reserva);
            res.setHora_reserva(hora_reserva);
            res.setCantidad_menu(cantidad_menu);
            res.setReserva_atendida(reserva_atendida);
            if (res.actualizarReserva()) {
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
