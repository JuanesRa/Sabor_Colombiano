
package logica;

public class PruebaActualizar {
    public static void main(String[] args) {
        /*Cliente cli = new Cliente();
        cli.setId_cedula("1022");
        cli.setNom_cliente("Diana");
        cli.setApel_cliente("martinez");
        cli.setDir_cliente("Calle 69 ");
        cli.setCel_cliente("324");
        cli.setCorreo("diana@mail.com");
        cli.setTipo_cliente("0");
        
        if (cli.actualizarCliente()) {
            System.out.println("Ejecutada");
        } else {
            System.out.println("No Ejecutada");
        }
        
        Menu men = new Menu();
        men.setId(3);
        men.setNombre_menu("Bandeja Paisanita");
        men.setFecha_menu("10-11-2021");
        men.setDescripcion_menu("Bandeja con carne molida, huevos, aguacate, chorizo");
        men.setValor_menu(50000);
        if (men.actualizarMenu()) {
            System.out.println("Ejecutada");
        } else {
            System.out.println("No Ejecutada");
        }*/
        
        Reserva res = new Reserva();
        res.setId_reserva(5);
        res.setId_cedula("1022");
        res.setId_menu(3);
        res.setDia_reserva("04-11-2021");
        res.setHora_reserva("2:00 pm");
        res.setCantidad_menu(4);
        res.setReserva_atendida(false);
        
        if (res.actualizarReserva()) {
            System.out.println("Ejecutada");
        } else {
            System.out.println("No Ejecutada");
        }
    }
    
}
