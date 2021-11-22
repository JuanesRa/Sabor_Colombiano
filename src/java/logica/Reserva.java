package logica;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import persistencia.ConexionBD;

public class Reserva {

    private int id_reserva;
    private String id_cedula;
    private int id_menu;
    private String dia_reserva;
    private String hora_reserva;
    private int cantidad_menu;
    private boolean reserva_atendida;

    public Reserva() {
    }

    public Reserva(int id_reserva) {
        this.id_reserva = id_reserva;
    }

    public Reserva(int id_reserva, String id_cedula, int id_menu, String dia_reserva, String hora_reserva, int cantidad_menu, boolean reserva_atendida) {
        this.id_reserva = id_reserva;
        this.id_cedula = id_cedula;
        this.id_menu = id_menu;
        this.dia_reserva = dia_reserva;
        this.hora_reserva = hora_reserva;
        this.cantidad_menu = cantidad_menu;
        this.reserva_atendida = reserva_atendida;
    }

    public int getId_reserva() {
        return id_reserva;
    }

    public void setId_reserva(int id_reserva) {
        this.id_reserva = id_reserva;
    }

    public String getId_cedula() {
        return id_cedula;
    }

    public void setId_cedula(String id_cedula) {
        this.id_cedula = id_cedula;
    }

    public int getId_menu() {
        return id_menu;
    }

    public void setId_menu(int id_menu) {
        this.id_menu = id_menu;
    }

    public String getDia_reserva() {
        return dia_reserva;
    }

    public void setDia_reserva(String dia_reserva) {
        this.dia_reserva = dia_reserva;
    }

    public String getHora_reserva() {
        return hora_reserva;
    }

    public void setHora_reserva(String hora_reserva) {
        this.hora_reserva = hora_reserva;
    }

    public int getCantidad_menu() {
        return cantidad_menu;
    }

    public void setCantidad_menu(int cantidad_menu) {
        this.cantidad_menu = cantidad_menu;
    }

    public boolean isReserva_atendida() {
        return reserva_atendida;
    }

    public void setReserva_atendida(boolean reserva_atendida) {
        this.reserva_atendida = reserva_atendida;
    }

    @Override
    public String toString() {
        return "Reserva{" + "id_reserva=" + id_reserva + ", id_cedula=" + id_cedula + ", id_menu=" + id_menu + ", dia_reserva=" + dia_reserva + ", hora_reserva=" + hora_reserva + ", cantidad_menu=" + cantidad_menu + ", reserva_atendida=" + reserva_atendida + '}';
    }

    public List<Reserva> consultarReservas() {
        List<Reserva> listaReserva = new ArrayList<>();
        ConexionBD conexion = new ConexionBD();
        String sql = "SELECT * FROM reserva;";
        ResultSet rs = conexion.consultarBD(sql);

        try {
            Reserva res;
            while (rs.next()) {
                res = new Reserva();
                res.setId_reserva(rs.getInt("id_reserva"));
                res.setId_cedula(rs.getString("id_cedula"));
                res.setId_menu(rs.getInt("id_menu"));
                res.setDia_reserva(rs.getString("dia_reserva"));
                res.setHora_reserva(rs.getString("hora_reserva"));
                res.setCantidad_menu(rs.getInt("cantidad_menu"));
                res.setReserva_atendida(rs.getBoolean("reserva_atendida"));

                listaReserva.add(res);
            }
        } catch (SQLException ex) {
            System.out.println("Error: " + ex.getMessage());
        } finally {
            conexion.cerrarConexion();
        }
        return listaReserva;
    }
    
      public Reserva consultarReserva() {
        ConexionBD conexion = new ConexionBD();
        String sql = "SELECT * FROM reserva WHERE id='" + this.id_reserva + "';";
        ResultSet rs = conexion.consultarBD(sql);
        try {
            if (rs.next()) {
                this.id_cedula = rs.getString("id_cedula");
                this.id_menu = Integer.parseInt(rs.getString("id_menu"));
                this.dia_reserva = rs.getString("descripcion_menu");
                this.hora_reserva = rs.getString("hora_reserva");
                this.cantidad_menu = Integer.parseInt(rs.getString("cantidad_menu"));
                this.reserva_atendida = Boolean.parseBoolean(rs.getString("reserva_atendida"));
            } else {
                return null;
            }
        } catch (SQLException ex) {
            System.out.println("Error: " + ex.getMessage());
        } finally {
            conexion.cerrarConexion();
        }
        return this;
    }

    public boolean guardarReserva() {
        ConexionBD conexion = new ConexionBD();
        String sql = "INSERT INTO reserva\n"
                + "(id_cedula, id_menu, dia_reserva, hora_reserva, cantidad_menu, reserva_atendida)\n"
                + "VALUES('" + this.id_cedula + "', " + this.id_menu + ", '" + this.dia_reserva + "', '"
                + this.hora_reserva + "', " + this.cantidad_menu + ", " + this.reserva_atendida + ");";

        if (conexion.setAutoCommitBD(false)) {
            if (conexion.insertarBD(sql)) {
                conexion.commitBD();
                conexion.cerrarConexion();
                return true;
            } else {
                conexion.rollbackBD();
                conexion.cerrarConexion();
                return false;
            }
        } else {
            conexion.cerrarConexion();
            return false;
        }
    }

    public boolean actualizarReserva() {
        ConexionBD conexion = new ConexionBD();
        String sql = "UPDATE reserva\n"
                + "SET id_cedula='" + this.id_cedula + "', id_menu=" + this.id_menu + ", dia_reserva='"
                + this.dia_reserva + "', hora_reserva='" + this.hora_reserva + "', cantidad_menu=" + this.cantidad_menu
                + ", reserva_atendida=" + this.reserva_atendida + "\n"
                + "WHERE id_reserva=" + this.id_reserva + ";";

        if (conexion.setAutoCommitBD(false)) {
            if (conexion.actualizarBD(sql)) {
                conexion.commitBD();
                conexion.cerrarConexion();
                return true;
            } else {
                conexion.rollbackBD();
                conexion.cerrarConexion();
                return false;
            }
        } else {
            conexion.cerrarConexion();
            return false;
        }
    }

    public boolean eliminarReserva() {
        ConexionBD conexion = new ConexionBD();
        String sql = "DELETE FROM reserva\n"
                + "WHERE id_reserva="+this.id_reserva+";";
        if (conexion.setAutoCommitBD(false)) {
            if (conexion.actualizarBD(sql)) {
                conexion.commitBD();
                conexion.cerrarConexion();
                return true;
            } else {
                conexion.rollbackBD();
                conexion.cerrarConexion();
                return false;
            }
        } else {
            conexion.cerrarConexion();
            return false;
        }
    }

}
