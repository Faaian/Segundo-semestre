package cl.duoc.scannertest;

import cl.duoc.scannertest.models.Persona;
import java.util.Scanner;


public class ScannerTest {

    public static void main(String[] params) {
        Persona jorge = new Persona();
        Scanner sc = new Scanner(System.in);
        //juan.setId();
        
        jorge.setNombre("Jorge");
        jorge.setApellido("Nitales");
        jorge.setNacimientoFecha(15, 8, 1987);
        System.out.println("Personas");
        System.out.println("------------------------");
        System.out.println("ID: "+ jorge.getId());
        System.out.println("Nombre: "+jorge.getNombre());
        System.out.println("Apellido: "+jorge.getApellido());
        System.out.println("Nacimiento: "+ jorge.getNacimiento());
        System.out.println("------------------------");
        Persona francisco = new Persona();
        
        System.out.println("ID: "+ francisco.getId());
        System.out.println("Nombre: "+francisco.getNombre());
        System.out.println("Apellido: "+francisco.getApellido());
        System.out.println("Nacimiento: "+ francisco.getNacimiento());
        
        Persona alguien = new Persona();
        alguien.setNombre(sc.nextLine());
        System.out.println("Nombre variable: "+ alguien.getNombre());
               
    }
}
