package com.mycompany.rentcar.Services;

import com.mycompany.rentcar.DTO.VehiculoDTO;
import java.util.List;

public interface IVehiculoService {
    
    public void boleta();
    
    public void almacenarVehiculo(VehiculoDTO ve);
    
    public List<VehiculoDTO> mostrarVehiculos();
    
    public void vehiculos7();
}
