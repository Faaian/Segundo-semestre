package com.mycompany.empresaapp;

import com.mycompany.empresaapp.DTO.CocheDTO;
import com.mycompany.empresaapp.DTO.EmpleadoDTO;
import com.mycompany.empresaapp.DTO.VendedorDTO;
import java.util.ArrayList;
import java.util.List;

public class EmpresaApp {

    public static void main(String[] args) {
        VendedorDTO v = new VendedorDTO();
        v.setCoche(new CocheDTO("sad","sadas","dsadsa"));
        v.setApellidos("El vendedor");
        
        v.DarAlta("Cencosud");
        v.DarAlta("Prosegur");
        v.Imprimir();
        System.out.println("===========");
        v.DarBaja("Prosegur");
        v.Imprimir();
        
        EmpleadoDTO e = new VendedorDTO();
        
        List<EmpleadoDTO> listaEmpleado = new ArrayList<>();
        listaEmpleado.add(v);
        listaEmpleado.add(e);
        
    }
}
