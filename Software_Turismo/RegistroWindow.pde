public void registrarUsuario()
{
  boolean exito = false;
  String[] atributos = {
        ninTxt.getText(),  
        usuarioNuevoTxt.getText(),
        passwordNuevaTxt.getText(),        
        nombreTxt.getText(),
        apellidoTxt.getText(),
        telefonoTxt.getText(),
        getPaisCode( paisUserDl.getSelectedText() ),
        yearTxt.getText(),        
        descripNuevaTxa.getText()  
  };
  
  

  exito = usuarioTabla.agregar(atributos);
  
  if (exito)
  {
    println("GUI: Se creo el usuario");
    registroWindow.setVisible(false);
    respuestaLb.setText("Usuario registrado");
  }
  else 
  {
    println("GUI: NO se creo el usuario");
    respuestaLb.setText("Error al registrar usuaario");
  }
}
