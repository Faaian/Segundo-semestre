package com.mycompany.rentcar.Services;

import com.mycompany.rentcar.DTO.VCargaDTO;
import com.mycompany.rentcar.DTO.VPasajerosDTO;
import com.mycompany.rentcar.DTO.VehiculoDTO;
import java.util.ArrayList;
import java.util.List;

public class VehiculoService implements IVehiculoService {

    List<VehiculoDTO> vehiculos;
    
    private static List<String>  
        patentes = new ArrayList<>();
    
    public VehiculoService() {
        vehiculos = new ArrayList<>();
    }
    
    @Override
    public void boleta(){
        int i = 1;
        System.out.println();
        for(VehiculoDTO vehi : vehiculos){
            int precio_dias = vehi.getPrecio() * vehi.getDias();
            int descuento_p = (precio_dias * 7)/100;
            int descuento_c = (precio_dias * 3)/100;
            int iva = (precio_dias * 19)/100;
            int total_p = (precio_dias - descuento_p);
            int total_c = (precio_dias - descuento_p);
            if(vehi.getClass() == VPasajerosDTO.class){
                System.out.println(
                        "\n---- Boleta ----"+ 
                        "\nVehiculo "+ i +
                        "\nPatente: " + vehi.getPatente()+
                        "\nTipo: Pasajeros"+
                        "\nValor dia: " + vehi.getPrecio()+
                        "\nCantidad dias: "+ vehi.getDias()+
                        "\nDescuento: "+ descuento_p+
                        "\nIVA: " + iva+
                        "\nTotal: " + total_p);
                System.out.println("");
            }
            else if(vehi.getClass() == VCargaDTO.class){
                System.out.println(
                        "\n---- Boleta ----"+
                        "\nVehiculo "+ i +
                        "\nPatente: " + vehi.getPatente()+
                        "\nTipo: Carga"+
                        "\nValor dia: " + vehi.getPrecio()+
                        "\nCantidad dias: "+ vehi.getDias()+
                        "\nDescuento: "+ descuento_c+
                        "\nIVA: " + iva+
                        "\nTotal: " + total_c);
                System.out.println("");
            }
            i++;
        }
    }
    
    @Override
    public void almacenarVehiculo(VehiculoDTO ve) {
        boolean verificar = patentes.contains(ve.getPatente());
        if (!verificar) {
            vehiculos.add(ve);
            patentes.add(ve.getPatente());
        }
        else
            System.out.println("La patente " + ve.getPatente()+ " ya esta registrada");
    }

    @Override
    public List<VehiculoDTO> mostrarVehiculos() {
        int i = 1;
        for (VehiculoDTO vehi : vehiculos) {
            System.out.println("------------");
            System.out.println("Vehiculo " + i);
            vehi.mostrarDatos();
            i++;
        }
        return vehiculos;
    }

    @Override
    public void vehiculos7(){
        int i = 0;
        for(VehiculoDTO vehi : vehiculos){
            if(vehi.getDias() >= 7){
                i++;
            }
        }
        System.out.println("Cantidad de Vehiculos con arriendo de 7 o mas dias: " + i);
    }
}
