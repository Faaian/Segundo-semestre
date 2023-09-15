package com.mycompany.veterinario;

import com.mycompany.veterinario.models.Mascota;
import java.util.Scanner;

public class Veterinario {

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int opcion;
        Mascota[]arrMascota = new Mascota[15];
        int contador = 0;
        
        do{
            
            System.out.println("MENU");
            System.out.println("1)Ingresar mascota");
            System.out.println("2)Eliminar mascota");
            System.out.println("3)Ver mascotas");
            System.out.println("0)Salir");
            sc.nextInt(opcion);
            
            switch(opcion){
                case 1 -> {
                    Mascota mascota1 = new Mascota();
                    System.out.println("Ingrese el nombre de la mascota");
                    mascota1.setNombre(sc.nextLine());
                    System.out.println("Ingrese la fecha de nacimiento de la mascota");
                    mascota1.setFechaNac(sc.nextLine());
                    System.out.println("Ingrese el numero del chip");
                    mascota1.setChip(sc.nextInt());
                    System.out.println("Ingrese el nombre del dueño");
                    mascota1.setDueño(sc.nextLine());
                    arrMascota[contador] = mascota1;
                    
                    ++contador;
                }
                case 2 ->{
                    
                }
                case 3 ->{
                    
                }
            }
        }while(opcion != 0);
    }
}
