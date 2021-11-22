
package logica;

import java.util.List;

public class PruebaConsultar {
    
    public static void main(String[] args) {
       Cliente cliente = new Cliente();
        List<Cliente> listaClientes = cliente.consultarClientes();
        for(Cliente cli:listaClientes){
            System.out.println(cli);
        }
       
       Menu men = new Menu();
       List<Menu> listaMenu=men.consultarMenu();
        for (Menu menu : listaMenu) {
            System.out.println(menu);
        }
        
        Reserva res = new Reserva();
        List<Reserva> listaReserva= res.consultarReservas();
        for (Reserva reserva : listaReserva) {
            System.out.println(reserva);
        }
    }
    
}
