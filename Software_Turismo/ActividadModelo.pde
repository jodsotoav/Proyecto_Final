class ActividadModelo extends Modelo 
{
  ActividadModelo (Fila fila)
  {
    super(fila);    
  }
  
  public String getDescripcionParaMostrar()
  {    
    return fila.atributos[1] + ", \n PRECIO: " + fila.atributos[3] + "\n " + fila.atributos[2];
  }
}
