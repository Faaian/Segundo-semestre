package com.mycompany.registroclinico.DTO;

import java.time.LocalDate;

public class PacienteDTO {
    private int id;
    private String nombreCompleto;
    private LocalDate fechaNacimiento;

    public PacienteDTO(int id, String nombreCompleto, LocalDate fechaNacimiento) {
        this.id = id;
        this.nombreCompleto = nombreCompleto;
        this.fechaNacimiento = fechaNacimiento;
    }

    public PacienteDTO() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombreCompleto() {
        return nombreCompleto;
    }

    public void setNombreCompleto(String nombreCompleto) {
        this.nombreCompleto = nombreCompleto;
    }

    public LocalDate getFechaNacimiento() {
        return fechaNacimiento;
    }

    public void setFechaNacimiento(LocalDate fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }
    
    public void setFechaNacimiento(int dia, int mes, int año){
        this.fechaNacimiento = LocalDate.of(año, mes, dia);
    }

    @Override
    public String toString() {
        return nombreCompleto +" "+fechaNacimiento +" "+ id;
    }
    
    
}
