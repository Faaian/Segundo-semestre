package com.mycompany.rentcar.DTO;

public abstract class VehiculoDTO {
    private String patente;
    private int dias;
    
    private final int precio = 35000;
    
    public VehiculoDTO(String patente, int dias) {
        this.patente = patente;
        this.dias = dias;
    }

    public VehiculoDTO() {
        this.patente = "";
        this.dias = 0;
    }

    public String getPatente() {
        return patente;
    }

    public void setPatente(String patente) {
        this.patente = patente;
    }
    
    public int getDias(){
        return dias;
    }
    
    public void setDias(int dias){
        this.dias = dias;
    }
    
    public int getPrecio(){
        return precio;
    }
    
    // Customs
    public abstract void mostrarDatos();

}
