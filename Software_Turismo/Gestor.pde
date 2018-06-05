class Gestor
{
  Tabla tabla;
  ArrayList<Modelo> lista = new ArrayList<Modelo>();
 
 //
  Gestor (Tabla tabla)
  {
    this.tabla = tabla;    
  }

  // Para devolver un elemento de la lista por su posicion
  public Modelo getElementoLista (int i)
  {
    if (i == -1) return null;
    Modelo e = this.lista.get(i);
    return e;
  }
  
  // Para devolver un elemento de la lista por el texto su indice
  public Modelo getElementoLista (String id)
  {
    for (Modelo e: this.lista)
    {
      if (e.getId().equals(id)) return e;
    }
    return null;       
  }
  
  //
  public ArrayList<String> listaFiltroPais(String pais)
  {
    ArrayList<String> listaStr = new ArrayList<String>();
    Fila fila;
    int paisPosAtt = 0;
    listaStr.add ("Ninguno");
    for (Modelo e: lista)
    {
      //
      fila = e.fila;
      paisPosAtt = fila.tabla.atributos.get("pais");
      if ( fila.atributos[ paisPosAtt ].equals(pais) )
        listaStr.add(e.fila+"");
    }     
    return listaStr;
  }    
  
}
