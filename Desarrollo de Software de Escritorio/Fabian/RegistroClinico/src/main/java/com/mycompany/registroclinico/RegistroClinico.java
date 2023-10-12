package com.mycompany.registroclinico;

import com.mycompany.registroclinico.DTO.PacienteDTO;
import com.mycompany.registroclinico.Service.IPacienteService;
import com.mycompany.registroclinico.Service.impl.PacienteServiceImpl;

public class RegistroClinico {

    public static void main(String[] args) {
        PacienteDTO p = new PacienteDTO();
        p.setId(10);
        p.setFechaNacimiento(3,5,1992);
        p.setNombreCompleto("David de la Cruz Manolito");
        
        System.out.println("Pacientes");
        
        PacienteDTO p2 = new PacienteDTO();
        p2.setId(11);
        p2.setNombreCompleto("asdsa");
        p2.setFechaNacimiento(3,10,2000);
        
        IPacienteService servicio = new PacienteServiceImpl();
        servicio.CrearPaciente(p);
        servicio.CrearPaciente(p2);
        
        servicio.listarPacientes();
    }
}
