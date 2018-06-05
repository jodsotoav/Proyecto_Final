class UsuariosGestor extends Gestor
{

  CalificacionesGestor calificacionesUsuarios; 
    
  // Contructor
  UsuariosGestor(Tabla tabla, CalificacionesGestor calificacionesUsuarios)
  {
    super(tabla); // 
    this.calificacionesUsuarios = calificacionesUsuarios;
    //
    Modelo elemento;
    for (Fila fila: tabla.filas)
    {
      elemento = new UsuarioModelo(fila,calificacionesUsuarios);
      this.lista.add(elemento);
    }    
  }
    
  //
  public UsuarioModelo getUsuarioPorDescp (String descp)
  {
    String[] str = descp.split(":"); //
    String id = str[0];
    return (UsuarioModelo) getElementoLista(id);
  }    

  //
  public ArrayList<String> listaUsuarios(String pais, String mismoUser)
  {
    ArrayList<String> listaStr = new ArrayList<String>();
    listaStr.add ("Ninguno");
    for (Modelo u: lista)
    {
      if (u.fila.atributos[6].equals(pais) && !u.fila.atributos[0].equals(mismoUser))
        listaStr.add(u.fila.atributos[0]+": "+u.fila.atributos[1]);
    }     
    return listaStr;
  } 
  
  //Iniciar sesión
  public UsuarioModelo iniciarSesion (String usuario, String password)
  {
    for (Modelo e: lista)
    {
      if (e.fila.atributos[1].equals(usuario) &&  e.fila.atributos[2].equals(password))
      {
        println(e.fila);
        return (UsuarioModelo) e;
      }
      
    }
    return null;   
  }     
    
}
