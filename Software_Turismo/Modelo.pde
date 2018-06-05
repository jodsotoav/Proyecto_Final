public class Modelo
{
  Fila fila; 
  
  //Constructor
  Modelo (Fila fila)
  {
    this.fila = fila;
  }
  
  //
  
  // Para devolver el texto del indice
  public String getId()
  {
    return fila.getId();
  }
  
  
}
