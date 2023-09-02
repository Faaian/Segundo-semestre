package cl.duoc.pgy2121.verduleria.Models;

import java.util.Date;

public class Solicitud {
    private int numero;
    private String cliente, productos;
    private Date fecha;
    private double total;

    public void agregarProducto(Producto producto){
        this.productos = this.productos + "\n" +
                producto.getSubcategoria()+" " + producto.getDescripcion() +" $"+
                producto.getPrecio()+ " " + producto.getCantidad()+" " + producto.getMedida();
        System.out.println("Producto agregado con exito!");
    }
    
    public Solicitud() {
    }

    public Solicitud(int numero, String cliente, String productos, Date fecha, double total) {
        this.numero = numero;
        this.cliente = cliente;
        this.productos = productos;
        this.fecha = fecha;
        this.total = total;
    }

    public int getNumero() {
        return numero;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }

    public String getCliente() {
        return cliente;
    }

    public void setCliente(String cliente) {
        this.cliente = cliente;
    }

    public String getProductos() {
        return productos;
    }

    public void setProductos(String productos) {
        this.productos = productos;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }
    
}
