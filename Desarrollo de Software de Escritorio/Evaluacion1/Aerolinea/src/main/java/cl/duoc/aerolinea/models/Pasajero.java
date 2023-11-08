package cl.duoc.aerolinea.models;

public class Pasajero {
    private String rut;
    private String nombre;
    private String apellido;
    private int edad;

    public Pasajero(String rut, String nombre, String apellido, int edad) {
        this.rut = rut;
        this.nombre = nombre;
        this.apellido = apellido;
        this.edad = edad;
    }

    public String getRut() {
        return rut;
    }

    public String getNombre() {
        return nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public int getEdad() {
        return edad;
    }  
}
