class CalificacionModelo extends Modelo {
  
  String calificador;
  String calificado;
  int valor;
  
  CalificacionModelo( Fila fila)
  {
    super(fila);
    this.fila = fila;    
    this.calificador = fila.atributos[0];
    this.calificado = fila.atributos[1];
    this.setvalor(Integer.parseInt(fila.atributos[2]));     
  }  
  
  CalificacionModelo( String calificador, String calificado)
  {
    super(null);
    this.calificador = calificador;
    this.calificado = calificado;    
  }
  
  CalificacionModelo( String calificador, String calificado,String valor, Fila fila)
  {
    super(fila);
    this.fila = fila;    
    this.calificador = calificador;
    this.calificado = calificado;
    this.setvalor(Integer.parseInt(valor));     
  }
  
  public void setvalor (int valor)
  {
    this.valor = valor;
    this.fila.atributos[2] = String.valueOf(valor);
  }
  
  // Para la funcions COntains
  @Override    
  public boolean equals(Object o) {
    if (o == this) return true;
            if (!(o instanceof CalificacionModelo)) {
                return false;
            }    
    CalificacionModelo c = (CalificacionModelo) o;
    return c.calificador.equals(this.calificador) && c.calificado.equals(this.calificado);
  }    
  
  @Override  
  public String toString() { 
    return calificador+" a "+calificado+": "+valor+"."; 
  }   
}
