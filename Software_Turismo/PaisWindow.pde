public void entrarAplicacion()
{
  PaisWindowSetup();
  surface.setVisible(false); 
  PaisWindow.setVisible(true);

}

public void PaisWindowSetup()
{
  
}

public void seleccionarPais() 
{
  // obtener el codigo del pais
  pais = paisDl.getSelectedText();
  println("pais: ",pais);
  
  //Actualizar los droplist con el nuevo pais seleccionado
  guiaDl.setItems(usuariosGestor.listaUsuarios(pais,usuarioActivo.getId()), 0);  
  sitiosDl.setItems(sitiosGestor.listaFiltroPais(pais), 0);
  actividadesDl.setItems(actividadesGestor.listaFiltroPais(pais), 0);
  
  //  Actualizar imagen del pais
  if (pais.equals("Ninguno")) pais = "no_flag";
  imgPais = loadImage("banderas/"+pais.toLowerCase()+".png");
  
  // Restaurar calificacion y descripcion guia
  calificacionDl.setSelected(0);
  califLb.setText( "Calif." );
  guiaLb.setText( "Seleccione un guia.");
}

public void SeleccionarGuia()
{
  String descp = guiaDl.getSelectedText();
  guiaSeleccionado = (UsuarioModelo) usuariosGestor.getUsuarioPorDescp( descp );
  println("guiaSeleccionado: ",guiaSeleccionado,descp);
  if ( guiaSeleccionado == null)
  {
    calificacionDl.setSelected(0);
    califLb.setText( "Calif." );
    guiaLb.setText( "Seleccione un guia.");
  }
  else
  {
    int selec = calificacionesUsuarios.obtenerCalificacionUsuario( usuarioActivo.getId(), guiaSeleccionado.getId() );
    calificacionDl.setSelected(selec);
    setCalifLb();
    guiaLb.setText(guiaSeleccionado.getDescripcion());      
  }

}

public void setCalifLb() {
  double valor = guiaSeleccionado.obtenerCalificacion();
  califLb.setText( String.valueOf(valor) );
}

public void setCalificacion()
{ 
  if( guiaSeleccionado == null ) return;
  calificacionesUsuarios.modificarCalificacion(usuarioActivo.getId(), guiaSeleccionado.getId(), calificacionDl.getSelectedText());
  setCalifLb();
}

public void SeleccionarSitio()
{
  String descp = sitiosDl.getSelectedText();
  sitioActivo = (SitioModelo) sitiosGestor.getSitioPorDescp( descp );
  println("sitioActivo: ",sitioActivo,descp);  
  tituloSitWLb.setText(sitioActivo.fila.atributos[1]);
  descSitWLb.setText(sitioActivo.getDescripcionParaMostrar());
  imgSitio = loadImage("fotos/"+sitioActivo.fila.atributos[3]);
  SitioWindow.setVisible(true);
}

public void SeleccionarActividad()
{
  String descp = actividadesDl.getSelectedText();
  actividadActivo = (ActividadModelo) actividadesGestor.getActividadPorDescp( descp );
  println("actividadActivo: ",actividadActivo,descp);    
  tituloActWLb.setText(actividadActivo.fila.atributos[1]);
  descripActWLb.setText(actividadActivo.getDescripcionParaMostrar());
  imgActividad = loadImage("fotos/"+actividadActivo.fila.atributos[4]);
  ActividadWindow.setVisible(true);  
}
ArrayList<String> paisesLista = new ArrayList<String>(); 

public ArrayList<String> paisDisponibles() {
  ArrayList<String> p = new ArrayList<String>();
  p.add ("Ninguno");
  String pid;
  for (Modelo e: usuariosGestor.lista)
  {
    pid = e.fila.atributos[6];
    if (!p.contains(pid))
      p.add( pid ) ;      
  }     //<>//
  return p;
}

public ArrayList<String> getPaises()
{
  String[] locales = Locale.getISOCountries();
  ArrayList<String> p = new ArrayList<String>();
  for (String countryCode : locales) {
    Locale obj = new Locale("", countryCode);
    p.add (obj.getDisplayCountry());
  }    
  return p;  
}

public String getPaisCode (String pais)
{
  String[] locales = Locale.getISOCountries();
  for (String countryCode : locales) 
  {
    Locale obj = new Locale("", countryCode);
    if (obj.getDisplayCountry().equals(pais))
      return obj.getCountry() ;
  }     
  return "Ninguno";  
}