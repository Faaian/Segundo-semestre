package com.mycompany.veterinario.models;

public class Mascota {
    private static int privateId = 1;
    
    private String nombre;
    private String fechaNac;
    private int chip;
    private String dueño;
    private int id;

    public Mascota(){
        this.id = privateId;
        this.nombre = "Sin nombre";
        this.fechaNac = "00/00/000";
        this.chip = -1;
        this.dueño = "Sin dueño";
        
        privateId++;
    }
    
    public Mascota(String nombre, String fechaNac, int chip, String dueño, int id) {
        this.nombre = nombre;
        this.fechaNac = fechaNac;
        this.chip = chip;
        this.dueño = dueño;
        this.id = privateId;     
    }

    public int getId(){
        return id;
    }
    
    public String getNombre() {
        return nombre;
    }
    
    public void setNombre(String nombre) {
        if(nombre.length() == 0){
            System.out.println("ERROR: El nombre esta vacio");
        }
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
