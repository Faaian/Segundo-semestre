package cl.duoc.pgy2121.verduleria;

import cl.duoc.pgy2121.verduleria.Models.Cliente;
import cl.duoc.pgy2121.verduleria.Models.Producto;
import cl.duoc.pgy2121.verduleria.Models.Solicitud;
import java.util.Scanner;

public class Verduleria {

    public static void main(String[] args) {
        int opcion;
        Scanner sc = new Scanner(System.in);
        Producto productoAux = new Producto();
        Cliente clienteAux = new Cliente();
        Solicitud solicitudAux = new Solicitud();
        
        do{
            System.out.println("**Bienvenido a Verdurderia**");
            System.out.println("1) Registrar Cliente");
            System.out.println("2) Comprar Producto");
            System.out.println("3) Finalizar Compra");
            System.out.println("0) Salir");
            System.out.println("Seleccione una opcion: ");
            opcion = sc.nextInt();
            
            switch(opcion){
                case 1:
                    System.out.println("Registro de Cliente");
                    System.out.println("Ingrese Nombre:");
                    clienteAux.setNombre(sc.next());
                    System.out.println("Ingrese Rut(Sin digito verificador):");
                    clienteAux.setRut(sc.next());
                    System.out.println("Ingrese DV:");
                    clienteAux.setDv(sc.next());
                    System.out.println("Ingrese Mail");
                    clienteAux.setMail(sc.next());
                    System.out.println("Ingrese Direccion:");
                    clienteAux.setDireccion(sc.next());
                    System.out.println("Ingrese Telefono:");
                    clienteAux.setTelefono(sc.next());
                    break;
                case 2:
                    System.out.println("**Compra Producto**");
                    System.out.println("Ingrese Codigo:");
                    productoAux.setCodigo(sc.nextInt());
                    System.out.println("Ingrese Sub-categoria:");
                    productoAux.setSubcategoria(sc.next());
                    System.out.println("Ingrese Descripcion:");
                    productoAux.setDescripcion(sc.next());
                    System.out.println("Ingrese Precio:");
                    productoAux.setPrecio(sc.nextDouble());
                    System.out.println("Ingrese Cantidad:");
                    productoAux.setCantidad(sc.nextInt());
                    System.out.println("Ingrese Medida:");
                    productoAux.setMedida(sc.next());
                    
                    solicitudAux.agregarProducto(productoAux);
                    break;
                case 3:
                    System.out.println("Solicitud de Compra");
                    break;
                case 0:
                    System.out.println("Adios");
                    break;
                default:
                    System.out.println("Ingrese una opcion valida");
                    break;
            }
        }while(opcion != 0);
    }
}
