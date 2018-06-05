public void mostraVentanaRegistro()
{
  registroWindow.setVisible(true);
}

public void iniciarSesion()
{
  usuarioActivo = usuariosGestor.iniciarSesion(usuarioTxt.getText(),passwordPw.getPassword());
  if (usuarioActivo != null) 
  {
    println("Usuario activo:",usuarioActivo);
    entrarAplicacion();
  } 
  else 
  {
    respuestaLb.setText("Usuario o contraseña inválida");
  }
}
