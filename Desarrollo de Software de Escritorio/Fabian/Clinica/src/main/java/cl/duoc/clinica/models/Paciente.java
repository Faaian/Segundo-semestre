package cl.duoc.clinica.models;

public class Paciente {
    private String nombre;
    private String apellido;
    private int numeroTelefono;
    
    public Paciente(){
        this.nombre = "Sin nombre";
        this.apellido = "Sin apellido";
        this.numeroTelefono = -1;
    }

    public Paciente(String nombre, String apellido, int numeroTelefono) {
        this.nombre = nombre;
        this.apellido = apellido;
        this.numeroTelefono = numeroTelefono;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public int getNumeroTelefono() {
        return numeroTelefono;
    }

    public void setNumeroTelefono(int numeroTelefono) {
        this.numeroTelefono = numeroTelefono;
    }

}

