// Need G4P library
import g4p_controls.*;

// Usuarios
Tabla usuarioTabla;
UsuariosGestor usuariosGestor;
UsuarioModelo usuarioActivo;

// Calificaciones
Tabla calificacionesTabla;
CalificacionesGestor calificacionesUsuarios;

// Sitios
Tabla sitiosTabla;
SitiosGestor sitiosGestor;
SitioModelo sitioActivo;

// Actividades
Tabla actividadesTabla;
ActividadesGestor actividadesGestor;
ActividadModelo actividadActivo;

// PaisWindow
UsuarioModelo guiaSeleccionado;
String pais = "Ninguno";

// Setup de PROCESSING
public void setup(){          
  cargarDatos(); 
  
  size(320, 320, JAVA2D); //size: https://processing.org/reference/size_.html
  createGUI();
  customGUI();   
}

public void draw(){
  background(230);  
}

public void cargarDatos() {
  //
  paisesLista = getPaises(); //Obtiene lista de paises por nombre
  
  //
  calificacionesTabla = new Tabla("Calificaciones.txt", new Integer[]{0,1}, 2); //Primero se cargan calificaciones
  calificacionesUsuarios = new CalificacionesGestor(calificacionesTabla);
  
  //
  usuarioTabla = new Tabla("Usuarios.txt", new Integer[]{0}, 3);  
  usuariosGestor = new UsuariosGestor(usuarioTabla,calificacionesUsuarios);  
  
  //
  sitiosTabla = new Tabla("Sitios.txt", new Integer[]{0}, 1);
  sitiosGestor = new SitiosGestor(sitiosTabla);
  
  //
  actividadesTabla = new Tabla("Actividades.txt", new Integer[]{0}, 1);
  actividadesGestor = new ActividadesGestor(actividadesTabla);
}

public void customGUI(){
  PaisWindow.setVisible(false);
  registroWindow.setVisible(false);
  SitioWindow.setVisible(false);
  ActividadWindow.setVisible(false);
  AcercaWindow.setVisible(false);
}
public static boolean esVacioONulo( String str ) {
  return str != null && !str.isEmpty();
} 