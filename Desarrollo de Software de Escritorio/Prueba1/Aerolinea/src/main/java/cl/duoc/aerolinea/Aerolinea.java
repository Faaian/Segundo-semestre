package cl.duoc.aerolinea;

import cl.duoc.aerolinea.models.Pasaje;
import cl.duoc.aerolinea.models.Pasajero;

public class Aerolinea {

    public static void main(String[] args) {
        Pasajero pasajero1 = new Pasajero("21.698.571-0", "Fabian", "Loyola", 18);
        
        String pRut = pasajero1.getRut();
        String pNombre = pasajero1.getNombre();
        String pApellido = pasajero1.getApellido();
        int edad = pasajero1.getEdad();
        
        String pasajero = "Rut: "+ pRut + "\nNombre: " + pNombre + "\nApellido: " + pApellido + "\nEdad: " + edad;
        
        Pasaje p = new Pasaje();
        p.setDestino("Santiago");
        p.setFecha(10, 5, 2024);
        p.setValor(15000);
        p.setNumAsiento(85);
        p.setEquipaje("si");
        
        System.out.println(p.toString(pasajero));
        
    }
}
