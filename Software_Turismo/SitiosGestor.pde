class SitiosGestor extends Gestor
{
  SitiosGestor(Tabla tabla)
  {
    super(tabla); //    
    
    //
    Modelo elemento;
    for (Fila fila: tabla.filas)
    {
      elemento = new SitioModelo(fila);
      this.lista.add(elemento);
    }    
  }
  
  //
  public SitioModelo getSitioPorDescp (String descp)
  {
    String[] str = descp.split(":"); //
    String id = str[0];
    Modelo m = getElementoLista(id);
    SitioModelo s = (SitioModelo) m; //<>// //<>//
    return s;
  }      
}
