package com.mycompany.veterinario;

import com.mycompany.veterinario.models.Mascota;
import java.util.Scanner;

public class Veterinario {

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        Mascota[]arrMascota = new Mascota[15];
        int contador = 1;
        int opcion;        
        do{
            System.out.println("**Bienvenido**");
            System.out.println("MENU");
            System.out.println("1)Ingresar mascota");
            System.out.println("2)Eliminar mascota");
            System.out.println("3)Ver mascotas");
            System.out.println("0)Salir");
            System.out.print("Seleccione una opcion: ");
            opcion = Integer.parseInt(sc.nextLine());
            
            switch(opcion){
                case 1 -> {
                    Mascota mascota1 = new Mascota();
                    
                    System.out.print("Ingrese el nombre de la mascota: ");
                    String nombre = sc.nextLine();
                    System.out.print("Ingrese la fecha de nacimiento de la mascota (dd/mm/aaaa): ");
                    String fecha = sc.nextLine();
                    System.out.print("Ingrese el numero del chip: ");
                    int chip = Integer.parseInt(sc.nextLine());
                    System.out.print("Ingrese el nombre del dueño: ");
                    String dueño = sc.nextLine();
                    
                    String[] fechaSeparada = fecha.split("/");
                    int dia = Integer.parseInt(fechaSeparada[0]);
                    int mes = Integer.parseInt(fechaSeparada[1]);
                    int año = Integer.parseInt(fechaSeparada[2]);
                    
                    mascota1.setNombre(nombre);
                    mascota1.setFecha(dia, mes, año);
                    mascota1.setChip(chip);
                    mascota1.setDueño(dueño);
                    
                    arrMascota[contador] = mascota1;
                    
                    contador++;
                    
                    System.out.println("Ingresada con exito!");
                }
                case 2 ->{
                    System.out.println("**ELIMINAR MASCOTA**");
                    System.out.print("Que mascota desea eliminar: ");
                    int elim = Integer.parseInt(sc.nextLine());
                    arrMascota[elim] = null; 
                }
                case 3 ->{
                    System.out.println("**MASCOTAS**");
                    for (Mascota mascota : arrMascota) {
                        if(mascota != null){
                          System.out.println(mascota.toString());
                          System.out.println("-----------------------");
                        }
                    }
                }
            }
        }while(opcion != 0);
    }
}
