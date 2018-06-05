class ActividadesGestor extends Gestor
{
  ActividadesGestor(Tabla tabla)
  {
    super(tabla); //    
    
    //
    Modelo elemento;
    for (Fila fila: tabla.filas)
    {
      elemento = new ActividadModelo(fila);
      this.lista.add(elemento);
    }    
  }
  
  //
  public ActividadModelo getActividadPorDescp (String descp)
  {
    String[] str = descp.split(":"); //
    String id = str[0];
    return (ActividadModelo) getElementoLista(id);
  }     
}
