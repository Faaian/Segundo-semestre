/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cl.duoc.pgy2121.spotifytrucho;

/**
 *
 * @author fabia
 */
public class Cancion {
    private String titulo, artista;
    private double duracion;
    
    public Cancion(String titulo, String artista, double duracion){
        this.titulo = titulo;
        this.artista = artista;
        this.duracion = duracion;
    }
    
    public void setTitulo(){
        this.titulo = titulo;
        System.out.println("El nombre de la canción es " + titulo);
    }
    public void setArtista(){
        System.out.println("El artista es " + artista);
        this.artista = artista;
    }
    public void setDuracion(){
        this.duracion = duracion;
        if (duracion > 4.59){
            System.out.println("La duracion de la cancion es de mas de 5 minutos y es larga");
        }
        else {
            System.out.println("La duracion de la cancion es normal");
        }
            
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
