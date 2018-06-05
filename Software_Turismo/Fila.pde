public static boolean validarAtributosFila ( String[] atributos ) {
  boolean valido = true;
  for (String att : atributos )
  {
    valido = valido && esVacioONulo(att);
    //println(valido);
  }
  return valido;
}

class Fila {
  Tabla tabla;
  public String[] atributos;
  
  //C
  Fila(String linea, Tabla tabla){
    this.atributos = linea.split(", "); //
    this.tabla = tabla;
  }
  
  //C
  Fila(String[] atributos, Tabla tabla){
    this.atributos = atributos; //
    this.tabla = tabla;
  } 
  
  public String getId()
  {
    String id = "";
    for (int i : tabla.llaves)
    {
      id += this.atributos[i];
    }
    return id;    
  }
  
  public boolean esMismaFila(Fila f)
  {
    for (int i : tabla.llaves)
    {
      if ( !this.atributos[i].equals(f.atributos[i]) )
        return false;
    }
    return true;
  }

  public String aTexto() {     
    String str = "";
    for (int i=0; i < this.atributos.length; i++)
    {
      str += this.atributos[i] + (i < this.atributos.length-1 ? ", " : "");
    }
    return str; 
  }     

  // Sobreescribir la funcion que convierte a texto todos los objetos java
  @Override
  public String toString() {     
    String str = "";
    for (int i : tabla.llaves)
    {      
      str += this.atributos[i];
      str += i < tabla.llaves.length-1 ? "," : ": ";
    }    
    str += this.atributos[tabla.atributoParaMostrar];
    return str; 
  }    
      
}
