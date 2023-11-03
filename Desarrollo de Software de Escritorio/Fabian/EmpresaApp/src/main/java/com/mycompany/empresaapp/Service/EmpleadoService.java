package com.mycompany.empresaapp.Service;

import com.mycompany.empresaapp.DTO.EmpleadoDTO;
import com.mycompany.empresaapp.DTO.VendedorDTO;

public class EmpleadoService implements IEmpleadoService {

    @Override
    public void AsignarSupervisor(EmpleadoDTO emp, EmpleadoDTO supervisor) {
        
        if(supervisor.getClass() == VendedorDTO.class){
            emp.setSupervisor(supervisor);
        }
        emp.setSupervisor(supervisor);
    }
    
    
}
