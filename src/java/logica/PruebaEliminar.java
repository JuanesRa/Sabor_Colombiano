
package logica;

public class PruebaEliminar {
    public static void main(String[] args) {
        
        /*Cliente cli = new Cliente();
        cli.setId_cedula("1022351132");
        if (cli.eliminarCliente()) {
            System.out.println("Ejecutada");
        } else {
            System.out.println("No Ejecutada");
        }*/
        
        Menu men = new Menu();
        men.setId(5);
        if (men.eliminarMenu()) {
            System.out.println("Ejecutada");
        } else {
            System.out.println("No Ejecutada");
        }
        
        /*Reserva res = new Reserva();
        res.setId_reserva(7);
        if (res.eliminarReserva()) {
            System.out.println("Ejecutada");
        } else {
            System.out.println("No Ejecutada");
        }*/
        
        
        
        
    }
    
}
