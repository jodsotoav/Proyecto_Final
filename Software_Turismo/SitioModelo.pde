class SitioModelo extends Modelo 
{
  SitioModelo (Fila fila)
  {
    super(fila);    
  }
  
  public String getDescripcionParaMostrar()
  {    
    return fila.atributos[1] + ", " + fila.atributos[2];
  }
}
