package cl.duoc.pgy2121.verduleria.Models;
 
public class Producto {
    private int codigo, cantidad;
    private String subcategoria, descripcion, medida;
    private double precio;

    public Producto() {
    }

    public Producto(int codigo, int cantidad, String subcategoria, String descripcion, String medida, double precio) {
        this.codigo = codigo;
        this.cantidad = cantidad;
        this.subcategoria = subcategoria;
        this.descripcion = descripcion;
        this.medida = medida;
        this.precio = precio;
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public String getSubcategoria() {
        return subcategoria;
    }

    public void setSubcategoria(String subcategoria) {
        this.subcategoria = subcategoria;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getMedida() {
        return medida;
    }

    public void setMedida(String medida) {
        this.medida = medida;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }
    
}
