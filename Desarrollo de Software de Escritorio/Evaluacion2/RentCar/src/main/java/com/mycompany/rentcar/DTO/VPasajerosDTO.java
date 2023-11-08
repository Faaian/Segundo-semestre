package com.mycompany.rentcar.DTO;

public class VPasajerosDTO extends VehiculoDTO {

    private int pasajeros;
        
    public VPasajerosDTO() {
        super();
        this.pasajeros = 0;
    }

    public VPasajerosDTO(String patente, int dias, int pasajeros) {
        super(patente, dias);
        this.pasajeros = pasajeros;
    }

    public int getPasajeros() {
        return pasajeros;
    }

    public void setPasajeros(int pasajeros) {
        if (pasajeros > 0 && pasajeros < 7) {
            this.pasajeros = pasajeros;
        }
    }

    @Override
    public void mostrarDatos() {
        System.out.println("Patente: "+ super.getPatente()
        + "\nTipo: Pasajeros\nCantidad de Pasajeros: "+ this.pasajeros);
    }

}
