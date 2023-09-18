package com.mycompany.veterinario.models;

import java.time.LocalDate;

public class Mascota {
    private static int privateId = 1;
    
    private String nombre;
    private LocalDate fechaNac;
    private int chip;
    private String dueño;
    private int id;

    public Mascota(){
        this.id = privateId;
        this.nombre = "Sin nombre";
        this.fechaNac = LocalDate.now();
        this.chip = -1;
        this.dueño = "Sin dueño";
        
        privateId++;
    }
    
    public Mascota(String nombre, LocalDate fechaNac, int chip, String dueño, int id) {
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

    public LocalDate getFechaNac() {
        return fechaNac;
    }

    public void setFechaNac(LocalDate fechaNac) {
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
    
    public void setFecha(int dia, int mes, int año){
        this.fechaNac = LocalDate.of(año, mes, dia);
    }

    @Override
    public String toString() {
        return "Mascota #" + id
                + "\nNombre: " + nombre
                + "\nFecha de Nacimiento: " + fechaNac 
                + "\nNúmero de Chip: " + chip 
                + "\nDueño: " + dueño;
    }
}
