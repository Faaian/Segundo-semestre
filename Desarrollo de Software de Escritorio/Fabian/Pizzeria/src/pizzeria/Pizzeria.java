/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package pizzeria;

import java.util.Scanner;

/**
 *
 * @author Cetecom
 */
public class Pizzeria {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        int opcion;
        Scanner teclado = new Scanner(System.in);
        Pizza pizza1 = new Pizza();
        Pizza pizza2 = new Pizza("Peperoni", "XL", "Normal");
        
        do {
            System.out.println("Bienvenido a Pizzeria");
            System.out.println("1) Pizza Napolitana");
            System.out.println("2) Pizza Peperoni");
            System.out.println("3) Pizza Hawaiana");
            System.out.println("4) Cancelar pedido");
            System.out.println("5) Resumen compra");
            System.out.println("0) Salir");
            System.out.println("Seleccionar opcion:");
            opcion = teclado.nextInt();
            
            switch(opcion){
                /*case 1:
                    System.out.println("Solicito Pizza napolitana");
                    break;
                */
                case 1 -> {
                    System.out.println("Solicito Pizza napolitana");
                    pizza1.setNombre("Napolitana");
                    System.out.println("Ingrese tipo de masa:");
                    pizza1.setMasa(teclado.next());
                    System.out.println("Ingrese el tamano:");
                    pizza1.setTamano(teclado.next());
                }
                case 2 -> {
                    System.out.println("Solicito Pizza peperoni");
                    pizza1.setNombre("Peperoni");
                    System.out.println("Ingrese tipo de masa:");
                    pizza1.setMasa(teclado.next());
                    System.out.println("Ingrese el tamano:");
                    pizza1.setTamano(teclado.next());
                }
                case 3 -> {
                    System.out.println("Solicito Pizza Hawaiana");
                    pizza1.setNombre("Hawaiana");
                    System.out.println("Ingrese tipo de masa:");
                    pizza1.setMasa(teclado.next());
                    System.out.println("Ingrese el tamano:");
                    pizza1.setTamano(teclado.next());
                }
                case 4 -> {
                    System.out.println("Cancelar pedido");
                    pizza1.setNombre("");
                    pizza1.setMasa("");
                    pizza1.setTamano("");
                }
                case 5 -> {
                    System.out.println("Resumen compra");
                    System.out.println(pizza1.getNombre());
                    System.out.println(pizza1.getMasa());
                    System.out.println(pizza1.getTamano());
                    pizza1.prepararPizza();
                    pizza1.calentarPizza();
                }
                case 0 -> System.out.println("Salir");
            }
            //case 1 -> System.out.println("Solicito Pizza napolitana");
                    }while(opcion != 0);    
            /*
            if (opcion == 1){
                System.out.println("Verdadero");
            }
            else if(opcion == 2){
                System.out.println("opcion 2");
            }
            else{
                System.out.println("Otra cosa");
            } */
        
        
        /* for(int i=1;i < 10; i++){
        System.out.println("CACA");
        } */
        
    }
    
    
}
