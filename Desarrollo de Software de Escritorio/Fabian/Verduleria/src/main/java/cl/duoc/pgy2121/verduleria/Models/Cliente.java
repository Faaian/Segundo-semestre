package cl.duoc.pgy2121.verduleria.Models;

public class Cliente {
    private String rut, dv, nombre, mail, direccion, telefono;

    public Cliente() {
    }

    public Cliente(String rut, String dv, String nombre, String mail, String direccion, String telefono) {
        this.rut = rut;
        this.dv = dv;
        this.nombre = nombre;
        this.mail = mail;
        this.direccion = direccion;
        this.telefono = telefono;
    }

    public String getRut() {
        return rut;
    }

    public void setRut(String rut) {
        this.rut = rut;
    }

    public String getDv() {
        return dv;
    }

    public void setDv(String dv) {
        this.dv = dv;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }
    
}
