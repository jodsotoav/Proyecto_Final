class UsuarioModelo extends Modelo {
  
  // Apuntador al gestor de calificaciones
  CalificacionesGestor calificacionesUsuarios;
     
  // Constructor
  UsuarioModelo(Fila fila, CalificacionesGestor calificacionesUsuarios)
  {
    super(fila);
    this.calificacionesUsuarios = calificacionesUsuarios;
  }    
  
  // Para obtener el promedio de calificaciones
  public double obtenerCalificacion() {
    return calificacionesUsuarios.obtenerPromedio(getId());
  }
  
  // Para obtener un texto descriptivo de este usuario
  public String getDescripcion(){
    String[] atributos = fila.atributos;
    Locale l = new Locale( "", atributos[6].toUpperCase() );
    String pais = l.getDisplayCountry();    
    return atributos[3] + " " + atributos[4] +" de " + pais +". "+atributos[8] ;
  }  

  @Override      
  public String toString() { 
    return "USUARIO:"+fila;
  }
}
