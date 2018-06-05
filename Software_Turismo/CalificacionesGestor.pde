class CalificacionesGestor extends Gestor
{  
  ArrayList<CalificacionModelo> calificacionList = new ArrayList<CalificacionModelo>();
    
  // Contructor
  CalificacionesGestor(Tabla tabla)
  {
    super(tabla);  
    //
    Modelo elemento;
    for (Fila fila: tabla.filas)
    {
      elemento = new CalificacionModelo(fila);
      this.lista.add(elemento);
    }    
  }
  
  public void modificarCalificacion ( String calificador, String calificado,String valor)
  {
    CalificacionModelo c = new CalificacionModelo(calificador,calificado); 
    int indice = calificacionList.indexOf(c);
    if (indice != -1) 
    {
      c = calificacionList.get(indice);
      //println(c);
      c.setvalor(Integer.parseInt(valor));
      tabla.guardar();
      println("Calificacion actuaizada:",valor);
    }
    else
    {
      tabla.agregar(new String[]{calificador,calificado,valor});
      println("Nueva calificacion guardada:",valor);
    }
  }
  
  //
  public double  obtenerPromedio(String id)
  {
    int suma = 0;
    int n = 0;
    for (Fila fila: tabla.filas)
    {
      if(fila.atributos[1].equals(id))
      {
        suma += Integer.parseInt(fila.atributos[2]);
        n++;
      }
    }
    if (n==0) n=1;
    return suma/n;
  }  
  
  public int obtenerCalificacionUsuario(String usua,String guia)
  {
    int valor = 0;
    for (Fila fila: tabla.filas)
    {
      if(fila.atributos[0].equals(usua) && fila.atributos[1].equals(guia) )
      {
        valor = Integer.parseInt(fila.atributos[2]);
        
      }
    }
    return valor;
  }
    
}
