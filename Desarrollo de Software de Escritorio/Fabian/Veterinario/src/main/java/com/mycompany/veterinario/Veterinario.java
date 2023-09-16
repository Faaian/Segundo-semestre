package com.mycompany.veterinario;

import com.mycompany.veterinario.models.Mascota;
import java.util.Scanner;

public class Veterinario {

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int opcion;
        Mascota[]arrMascota = new Mascota[15];
        String nombre, fecha, dueño;
        int elim;
        int chip;
        int contador = 1;
        
        do{
            System.out.println("**Bienvenido**");
            System.out.println("MENU");
            System.out.println("1)Ingresar mascota");
            System.out.println("2)Eliminar mascota");
            System.out.println("3)Ver mascotas");
            System.out.println("0)Salir");
            opcion = sc.nextInt();
            
            switch(opcion){
                case 1 -> {
                    Mascota mascota1 = new Mascota();
                    
                    System.out.println("Ingrese el nombre de la mascota: ");
                    nombre = sc.next();
                    System.out.println("Ingrese la fecha de nacimiento de la mascota: ");
                    fecha = sc.next();
                    System.out.println("Ingrese el numero del chip: ");
                    chip = sc.nextInt();
                    System.out.println("Ingrese el nombre del dueño: ");
                    dueño = sc.next();
                    
                    mascota1.setNombre(nombre);
                    mascota1.setFechaNac(fecha);
                    mascota1.setChip(chip);
                    mascota1.setDueño(dueño);
                    
                    arrMascota[contador] = mascota1;
                    
                    contador++;
                    
                    System.out.println("Ingresada con exito!");
                }
                case 2 ->{
                    System.out.println("**ELIMINAR MASCOTA**");
                    System.out.println("Que mascota desea eliminar: ");
                    elim = sc.nextInt();
                    arrMascota[elim] = null; 
                }
                case 3 ->{
                    System.out.println("**MASCOTAS**");
                    for (Mascota mascota : arrMascota) {
                        if(mascota != null){
                          System.out.println("Mascota #" + mascota.getId());
                          System.out.println("Nombre: " + mascota.getNombre());
                          System.out.println("Fecha de Nacimiento: " + mascota.getFechaNac());
                          System.out.println("Número de Chip: " + mascota.getChip());
                          System.out.println("Dueño: " + mascota.getDueño());
                          System.out.println("-----------------------");
                        }
                    }
                }
            }
        }while(opcion != 0);
    }
}
