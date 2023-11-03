package com.mycompany.empresaapp.Service;

import com.mycompany.empresaapp.DTO.EmpleadoDTO;

public interface IEmpleadoService {
    public void AsignarSupervisor(EmpleadoDTO emp, EmpleadoDTO supervisor);
}
