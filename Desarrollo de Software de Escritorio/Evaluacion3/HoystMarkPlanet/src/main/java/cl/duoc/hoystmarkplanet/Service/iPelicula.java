package cl.duoc.hoystmarkplanet.Service;

import cl.duoc.hoystmarkplanet.DTO.PeliculaDTO;
import java.util.List;

public interface iPelicula {
    public void guardar(PeliculaDTO p);
    public void editar(PeliculaDTO p, String id);
    public List<PeliculaDTO> listar();
    public void eliminar(String id);
    public PeliculaDTO traer(String id);
    public List<PeliculaDTO> busquedaAño(int menor, int mayor);
    public List<PeliculaDTO> busquedaGenero(String genero);
}
