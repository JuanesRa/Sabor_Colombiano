package logica;

import java.sql.*;
import java.util.*;
import persistencia.ConexionBD;

public class Cliente {

    private String id_cedula;
    private String nom_cliente;
    private String apel_cliente;
    private String dir_cliente;
    private String cel_cliente;
    private String correo;
    private String contrasena;
    private String contrasena2;

    public Cliente() {
    }

    public Cliente(String id_cedula) {
        this.id_cedula = id_cedula;
    }

    public Cliente(String id_cedula, String nom_cliente, String apel_cliente, String dir_cliente, String cel_cliente, String correo, String contrasena, String contrasena2) {
        this.id_cedula = id_cedula;
        this.nom_cliente = nom_cliente;
        this.apel_cliente = apel_cliente;
        this.dir_cliente = dir_cliente;
        this.cel_cliente = cel_cliente;
        this.correo = correo;
        this.contrasena = contrasena;
        this.contrasena2 = contrasena2;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    public String getContrasena2() {
        return contrasena2;
    }

    public void setContrasena2(String contrasena2) {
        this.contrasena2 = contrasena2;
    }

    public String getId_cedula() {
        return id_cedula;
    }

    public void setId_cedula(String id_cedula) {
        this.id_cedula = id_cedula;
    }

    public String getNom_cliente() {
        return nom_cliente;
    }

    public void setNom_cliente(String nom_cliente) {
        this.nom_cliente = nom_cliente;
    }

    public String getApel_cliente() {
        return apel_cliente;
    }

    public void setApel_cliente(String apel_cliente) {
        this.apel_cliente = apel_cliente;
    }

    public String getDir_cliente() {
        return dir_cliente;
    }

    public void setDir_cliente(String dir_cliente) {
        this.dir_cliente = dir_cliente;
    }

    public String getCel_cliente() {
        return cel_cliente;
    }

    public void setCel_cliente(String cel_cliente) {
        this.cel_cliente = cel_cliente;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    @Override
    public String toString() {
        return "Cliente{" + "id_cedula=" + id_cedula + ", nom_cliente=" + nom_cliente + ", apel_cliente=" + apel_cliente + ", dir_cliente=" + dir_cliente + ", cel_cliente=" + cel_cliente + ", correo=" + correo + ", contrasena=" + contrasena + ", contrasena2=" + contrasena2 + '}';
    }

    public List<Cliente> consultarClientes() {
        List<Cliente> listaClientes = new ArrayList<>();
        ConexionBD conexion = new ConexionBD();
        String sql = "SELECT * FROM clientes;";
        ResultSet rs = conexion.consultarBD(sql);

        try {
            Cliente cli;
            while (rs.next()) {
                cli = new Cliente();
                cli.setId_cedula(rs.getString("id_cedula"));
                cli.setNom_cliente(rs.getString("nom_cliente"));
                cli.setApel_cliente(rs.getString("apel_cliente"));
                cli.setDir_cliente(rs.getString("dir_cliente"));
                cli.setCel_cliente(rs.getString("cel_cliente"));
                cli.setCorreo(rs.getString("correo"));
                listaClientes.add(cli);

            }
        } catch (SQLException ex) {
            System.out.println("Error: " + ex.getMessage());
        } finally {
            conexion.cerrarConexion();
        }
        return listaClientes;
    }

    public Cliente consultarCliente() {
        ConexionBD conexion = new ConexionBD();
        String sql = "SELECT * FROM clientes WHERE id_cedula='" + this.id_cedula + "';";
        ResultSet rs = conexion.consultarBD(sql);
        try {
            if (rs.next()) {
                this.nom_cliente = rs.getString("nom_cliente");
                this.apel_cliente = rs.getString("apel_cliente");
                this.dir_cliente = rs.getString("dir_cliente");
                this.cel_cliente = rs.getString("cel_cliente");
                this.correo = rs.getString("correo");

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

    public boolean guardarCliente() {
        ConexionBD conexion = new ConexionBD();
        String sql = "INSERT INTO clientes\n"
                + "(id_cedula, nom_cliente, apel_cliente, dir_cliente, cel_cliente, correo, contrasena, contrasena2)\n"
                + "VALUES('" + this.id_cedula + "', '" + this.nom_cliente + "', '" + this.apel_cliente + "', '" + this.dir_cliente
                + "', '" + this.cel_cliente + "', '" + this.correo + "', '" + this.contrasena + "', '" + this.contrasena2 + "');";

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

    public boolean actualizarCliente() {
        ConexionBD conexion = new ConexionBD();
        String sql = "UPDATE clientes\n"
                + "SET nom_cliente='"+this.nom_cliente+"', apel_cliente='"+this.apel_cliente+"', dir_cliente='"+this.dir_cliente
                +"', cel_cliente='"+this.cel_cliente+"', correo='"+this.correo+"', contrasena='"+this.contrasena+"', contrasena2='"
                +this.contrasena2+"'\n"
                + "WHERE id_cedula='"+this.id_cedula+"';";

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

    public boolean eliminarCliente() {
        ConexionBD conexion = new ConexionBD();
        String sql = "DELETE FROM clientes\n"
                + "WHERE id_cedula='" + this.id_cedula + "';";
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
