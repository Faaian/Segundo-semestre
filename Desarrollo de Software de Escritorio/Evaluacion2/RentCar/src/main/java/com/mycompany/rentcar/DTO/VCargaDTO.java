package com.mycompany.rentcar.DTO;

public class VCargaDTO extends VehiculoDTO {
    private int kg;
    
    public VCargaDTO(int kg, String patente, int dias) {
        super(patente, dias);
        this.kg = kg;
    }
    
    public VCargaDTO(){
        super();
        this.kg = 0;
    }

    public int getKg() {
        return kg;
    }

    public void setKg(int kg) {
        this.kg = kg;
    }
       
    @Override
    public void mostrarDatos(){
        System.out.println("Patente: "+ super.getPatente()
        + "\nTipo: Carga\nKilos: "+ this.kg);
    }
    
}
