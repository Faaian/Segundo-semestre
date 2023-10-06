package com.mycompany.registroclinico.Service;

import com.mycompany.registroclinico.DTO.PacienteDTO;
import java.util.List;

public interface IPacienteService {
    public void CrearPaciente(PacienteDTO obj);
    public void ActualizarPaciente(int indice, PacienteDTO obj);
    public PacienteDTO obtenerPaciente(int indice);
    public void EliminarPaciente(int indice);
    public List<PacienteDTO> listarPacientes();
}
