package logica;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import persistencia.ConexionBD;

public class Menu {

    private int id;
    private String nombre_menu;
    private String fecha_menu;
    private String descripcion_menu;
    private double valor_menu;

    public Menu() {
    }

    public Menu(int id) {
        this.id = id;
    }

    public Menu(int id, String nombre_menu, String fecha_menu, String descripcion_menu, double valor_menu) {
        this.id = id;
        this.nombre_menu = nombre_menu;
        this.fecha_menu = fecha_menu;
        this.descripcion_menu = descripcion_menu;
        this.valor_menu = valor_menu;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre_menu() {
        return nombre_menu;
    }

    public void setNombre_menu(String nombre_menu) {
        this.nombre_menu = nombre_menu;
    }

    public String getFecha_menu() {
        return fecha_menu;
    }

    public void setFecha_menu(String fecha_menu) {
        this.fecha_menu = fecha_menu;
    }

    public String getDescripcion_menu() {
        return descripcion_menu;
    }

    public void setDescripcion_menu(String descripcion_menu) {
        this.descripcion_menu = descripcion_menu;
    }

    public double getValor_menu() {
        return valor_menu;
    }

    public void setValor_menu(double valor_menu) {
        this.valor_menu = valor_menu;
    }

    @Override
    public String toString() {
        return "Menu{" + "id=" + id + ", nombre_menu=" + nombre_menu + ", fecha_menu=" + fecha_menu + ", descripcion_menu=" + descripcion_menu + ", valor_menu=" + valor_menu + '}';
    }

    public List<Menu> consultarMenu() {
        List<Menu> listaMenu = new ArrayList<>();
        ConexionBD conexion = new ConexionBD();
        String sql = "SELECT * FROM menu;";
        ResultSet rs = conexion.consultarBD(sql);

        try {
            Menu men;
            while (rs.next()) {
                men = new Menu();
                men.setId(rs.getInt("id"));
                men.setNombre_menu(rs.getString("nombre_menu"));
                men.setFecha_menu(rs.getString("fecha_menu"));
                men.setDescripcion_menu(rs.getString("descripcion_menu"));
                men.setValor_menu(rs.getDouble("valor_menu"));
                listaMenu.add(men);
            }
        } catch (SQLException ex) {
            System.out.println("Error: " + ex.getMessage());
        } finally {
            conexion.cerrarConexion();
        }
        return listaMenu;
    }
    
    public Menu consultarMenuInd() {
        ConexionBD conexion = new ConexionBD();
        String sql = "SELECT * FROM menu WHERE id='" + this.id + "';";
        ResultSet rs = conexion.consultarBD(sql);
        try {
            if (rs.next()) {
                this.nombre_menu = rs.getString("nombre_menu");
                this.fecha_menu = rs.getString("fecha_menu");
                this.descripcion_menu = rs.getString("descripcion_menu");
                this.valor_menu = Double.parseDouble(rs.getString("valor_menu"));
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

    public boolean guardarMenu() {
        ConexionBD conexion = new ConexionBD();
        String sql = "INSERT INTO menu\n"
                + "(nombre_menu, fecha_menu, descripcion_menu, valor_menu)\n"
                + "VALUES('" + this.nombre_menu + "', '" + this.fecha_menu + "', '" + this.descripcion_menu
                + "', " + this.valor_menu + ");";

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

    public boolean actualizarMenu() {
        ConexionBD conexion = new ConexionBD();
        String sql = "UPDATE menu\n"
                + "SET nombre_menu='" + this.nombre_menu + "', fecha_menu='" + this.fecha_menu + "', "
                + "descripcion_menu='" + this.descripcion_menu + "', valor_menu=" + this.valor_menu + "\n"
                + "WHERE id=" + this.id + ";";

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

    public boolean eliminarMenu() {
        ConexionBD conexion = new ConexionBD();
        String sql = "DELETE FROM menu\n"
                + "WHERE id="+this.id+";";
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
