package com.mycompany.rentcar;

import com.mycompany.rentcar.DTO.VCargaDTO;
import com.mycompany.rentcar.DTO.VPasajerosDTO;
import com.mycompany.rentcar.Services.IVehiculoService;
import com.mycompany.rentcar.Services.VehiculoService;

public class RentCar {

    public static void main(String[] args) {        
        IVehiculoService service = new VehiculoService();
        VPasajerosDTO pasaj = new VPasajerosDTO();
        VCargaDTO carg = new VCargaDTO();
        
        pasaj.setPatente("PTCL23");
        pasaj.setDias(5);
        pasaj.setPasajeros(3);
        
        carg.setPatente("GKSB78");
        carg.setDias(10);
        carg.setKg(50);
        
        service.almacenarVehiculo(pasaj);
        service.almacenarVehiculo(carg);
        
        service.mostrarVehiculos();
        
        service.boleta();
        
        service.vehiculos7();
    }
}
