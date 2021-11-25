/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package logica;

import com.mysql.cj.protocol.Resultset;
import com.mysql.cj.xdevapi.Result;
import java.sql.ResultSet;
import java.sql.SQLException;
import persistencia.ConexionBD;

/**
 *
 * @author fido
 */
public class Usuario {

    private String nombreDeUsuario;
    private String contrasenna;

    public Usuario(String nombreDeUsuario, String contrasenna) {
        this.nombreDeUsuario = nombreDeUsuario;
        this.contrasenna = contrasenna;
    }

    public String getNombreDeUsuario() {
        return nombreDeUsuario;
    }

    public void setNombreDeUsuario(String nombreDeUsuario) {
        this.nombreDeUsuario = nombreDeUsuario;
    }

    public String getContrasenna() {
        return contrasenna;
    }

    public void setContrasenna(String contrasenna) {
        this.contrasenna = contrasenna;
    }

    @Override
    public String toString() {
        return "Usuario{" + "nombreDeUsuario=" + nombreDeUsuario + ", contrasenna=" + contrasenna + '}';
    }

    public Usuario validarUsuario() {
        ConexionBD conexion = new ConexionBD();
        String sql = "SELECT nombreDeUsuario FROM usuarios WHERE nombreDeUsuario='" + this.nombreDeUsuario
                + "' AND contrasenna='" + this.contrasenna + "';";
        ResultSet rs = conexion.consultarBD(sql);
        try {
            if (rs.next()) {
                contrasenna = "";
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
