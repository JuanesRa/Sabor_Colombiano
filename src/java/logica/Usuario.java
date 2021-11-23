
package logica;

import java.sql.*;
import persistencia.ConexionBD;

public class Usuario {
    private String nombreUsuario;
    private String contrasena;

    public Usuario(String nombreUsuario, String contrasena) {
        this.nombreUsuario = nombreUsuario;
        this.contrasena = contrasena;
    }

    public String getNombreUsuario() {
        return nombreUsuario;
    }

    public void setNombreUsuario(String nombreUsuario) {
        this.nombreUsuario = nombreUsuario;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    @Override
    public String toString() {
        return "Usuario{" + "nombreUsuario=" + nombreUsuario + ", contrasena=" + contrasena + '}';
    }
    
    public Usuario validarUsuario() {
        ConexionBD conexion = new ConexionBD();
        String sql = "SELECT nombreUsuario FROM usuarios WHERE nombreUsuario='" + this.nombreUsuario
                + "' AND contrasena='" + this.contrasena + "';";
        ResultSet rs = conexion.consultarBD(sql);
        try {
            if (rs.next()) {
                contrasena = "";
            } else {
                return null;
            }
        } catch (SQLException ex) {
            System.out.println("error: " + ex.getMessage());
        } finally {
            conexion.cerrarConexion();
        }
        return this;
    }
    
}
