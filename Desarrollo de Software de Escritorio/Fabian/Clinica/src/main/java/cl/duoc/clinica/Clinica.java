package cl.duoc.clinica;

import cl.duoc.clinica.models.Paciente;
import java.util.Scanner;

public class Clinica {

    public static void main(String[] args) {
        /* Paciente p = new Paciente("Fabian",
        "Loyola",
        15645);
        p.setNombre("Jorge");
        p.setApellido("Nitales");
        
        Paciente p2 = new Paciente();
        
        System.out.println(p);
        System.out.println(p2); */
        
        Scanner sc = new Scanner(System.in);
        String nombre, apellido, telefono;

        System.out.println("Ingrese nombre: ");
        nombre = sc.nextLine();
        System.out.println("Ingrese apellido: ");
        apellido = sc.nextLine();      
        System.out.println("Ingrese Telefono: ");
        telefono = sc.nextLine();
        
        Paciente p = new Paciente();
        p.setNombre(nombre);
        p.setApellido(apellido);
        p.setNumeroTelefono(Integer.parseInt(telefono));
        
        System.out.println("Nombre: "+ nombre);
        System.out.println("Apellido: " + apellido);
        System.out.println("Telefono: "+ telefono);
    }   
}
