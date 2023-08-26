package cl.duoc.pgy2121.spotifytrucho;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author cetecom
 */
public class Cancion {
    private String titulo, artista;
    private double duracion;
    
    public Cancion(String titulo, String artista, double duracion){
        this.titulo = titulo;
        this.artista = artista;
        this.duracion = duracion;
    }
    
    public void setTitulo(String titulo){
        this.titulo = titulo;
        System.out.println("El nombre de la canción es: " + titulo);
    }
    public void setArtista(String artista){
        this.artista = artista;
        System.out.println("El artista es: " + artista);
    }
    public void setDuracion(int duracion){
        this.duracion = duracion;
        switch (duracion){
        case duracion < 3.45 -> {
        System.out.println("La duracion es corta"); }
        case duracion > 3.50 -> {
        System.out.println("La duracion es: ");
    }
      
    public String getTitulo(){
        return this.titulo;
    }
    public String getArtista(){
        return this.artista;
    }
    public double getDuracion(){
        return this.duracion;
    }
    
}
