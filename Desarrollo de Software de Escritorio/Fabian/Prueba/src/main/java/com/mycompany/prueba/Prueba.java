package com.mycompany.prueba;

import java.util.Scanner;

public class Prueba {

    public static void main(String[] args) {
        
        try{
            Scanner sc = new Scanner(System.in);
            int numero = sc.nextInt();
            System.out.println("Su numero es: " + numero);
            
            String palabra = null;
            MiException error = new MiException("ERROR");
            throw error;
        }catch(MiException e){
            System.out.println(e.getMessage());
        }catch(NullPointerException ex){
            System.out.println("Objeto nulo, error.");
        }catch(Exception ex){
            System.out.println("Pusiste un STRING");
        }
    }
}
