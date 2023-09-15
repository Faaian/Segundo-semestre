package com.mycompany.veterinario.models;

public class Mascota {
    
    private String nombre;
    private String fechaNac;
    private int chip;
    private String dueño;

    public Mascota(){
        
    }
    
    public Mascota(String nombre, String fechaNac, int chip, String dueño) {
        this.nombre = nombre;
        this.fechaNac = fechaNac;
        this.chip = chip;
        this.dueño = dueño;
    }

    
    public String getNombre() {
        return nombre;
    }
    
    public void setNombre(String nombre) {
        if(nombre.length() == 0){
            System.out.println("ERROR: El nombre esta vacio");
        }
        else
            this.nombre = nombre;
    }

    public String getFechaNac() {
        return fechaNac;
    }

    public void setFechaNac(String fechaNac) {
        if(fechaNac.length() == 0){
            System.out.println("ERROR: La fecha esta vacia");
        }
        this.fechaNac = fechaNac;
    }

    public int getChip() {
        return chip;
    }

    public void setChip(int chip) {
        this.chip = chip;
    }

    public String getDueño() {
        return dueño;
    }

    public void setDueño(String dueño) {
        this.dueño = dueño;
    }
    
    
}
