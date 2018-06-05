// ------------------------
// DECLARACION DE VARIABLES
// ------------------------

// Surface o MainWindow
GLabel userLb; 
GTextField usuarioTxt; 
GLabel passwordLb; 
GPassword passwordPw; 
GLabel respuestaLb; 
GButton IniciarBtn;
GButton registrarBtn; 

// PaisWindow
GWindow PaisWindow;
GLabel paisDescrip_lb; 
PImage imgPais;
GImageButton paisImg; 
GDropList paisDl; 
GImageButton guiaImg; 
GDropList guiaDl; 
GLabel guiaLb; 
GLabel sitiosLb; 
GLabel actividadesLb; 
GDropList sitiosDl; 
GDropList actividadesDl; 
GDropList calificacionDl; 
GLabel califLb; 

// Registro
GWindow registroWindow;
GLabel nombreLb; 
GLabel apellidoLb; 
GTextField nombreTxt; 
GTextField apellidoTxt; 
GLabel ninLb; 
GTextField ninTxt; 
GLabel useNrLb; 
GTextField usuarioNuevoTxt; 
GLabel passwordNuevaLb; 
GTextField passwordNuevaTxt; 
GButton guardarUsuarioBtn; 
GLabel descripLb; 
GTextArea descripNuevaTxa; 
GLabel paisLb; 
GDropList paisUserDl; 
GLabel yearLb; 
GLabel telLb; 
GTextField yearTxt; 
GTextField telefonoTxt; 

// Sitio tur.
GWindow SitioWindow;
PImage imgSitio;
GLabel tituloSitWLb; 
GImageButton imgActW; 
GLabel descSitWLb; 


// Actividad tur.
GWindow ActividadWindow;
PImage imgActividad;
GLabel tituloActWLb; 
GLabel descripActWLb; 
GImageButton imgActWL; 

// Acerca de
GWindow AcercaWindow;
GLabel realizadoPorLb; 
GLabel unalLb; 

// ------------------------
// METODOS PARA CONTROLES
// ------------------------

public void IniciarBtn_click(GButton source, GEvent event) {
  iniciarSesion();
}

public void registrarBtn_click(GButton source, GEvent event) {
  mostraVentanaRegistro();
}

synchronized public void PaisWindow_draw(PApplet appc, GWinData data) { 
  appc.background(230);
  appc.image(imgPais, 20.0, 20.0, 80.0, 80.0);
} 

synchronized public void SitioWindow_draw(PApplet appc, GWinData data) { //_CODE_:SitioWindow:692603:
  appc.background(230);
  appc.image(imgSitio, 20.0, 60.0, 440.0, 260.0);
} //_CODE_:SitioWindow:692603:


synchronized public void ActividadWindow_draw(PApplet appc, GWinData data) { //_CODE_:ActividadWindow:347536:
  appc.background(230);
  appc.image(imgActividad, 20.0, 60.0, 440.0, 260.0);
} //_CODE_:ActividadWindow:347536:


public void cerrarApp(GWindow window) {
  
} 

public void paisDl_click(GDropList source, GEvent event) { 
  seleccionarPais();
}

public void guiaDl_click(GDropList source, GEvent event) { 
  SeleccionarGuia();
} 

public void sitiosDl_click(GDropList source, GEvent event) {
  SeleccionarSitio();
} 

public void actividadesDl_click(GDropList source, GEvent event) { 
  SeleccionarActividad();
} 

public void calificacionDl_click1(GDropList source, GEvent event) { 
  setCalificacion();
} 

public void guardarUsuarioBtn_click(GButton source, GEvent event) { 
  registrarUsuario();
} 





// ------------------------
// CREACIÓN PARA CONTROLES
// ------------------------
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setCursor(ARROW);
  
  //Ventana principal (Suerface): Loguin
  surface.setTitle("Turismo App");
  userLb = new GLabel(this, 120, 40, 80, 20);
  userLb.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  userLb.setText("Usuario");
  userLb.setOpaque(false);
  usuarioTxt = new GTextField(this, 80, 60, 160, 30, G4P.SCROLLBARS_NONE);
  usuarioTxt.setOpaque(true);
  passwordLb = new GLabel(this, 120, 100, 80, 20);
  passwordLb.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  passwordLb.setText("Contraseña");
  passwordLb.setOpaque(false);
  passwordPw = new GPassword(this, 80, 120, 160, 30);
  passwordPw.setMaxWordLength(10);
  passwordPw.setOpaque(true);
  respuestaLb = new GLabel(this, 80, 160, 160, 30);
  respuestaLb.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  respuestaLb.setText("Bienvenido");
  respuestaLb.setOpaque(false);
  IniciarBtn = new GButton(this, 120, 200, 80, 30);
  IniciarBtn.setText("Iniciar");
  IniciarBtn.addEventHandler(this, "IniciarBtn_click");
  registrarBtn = new GButton(this, 120, 240, 80, 30);
  registrarBtn.setText("Registrar");
  registrarBtn.addEventHandler(this, "registrarBtn_click");  
  
  // Ventana normal: Pricipal/Pais
  imgPais = loadImage("banderas/no_flag.png");
  PaisWindow = GWindow.getWindow(this, "Turismo App", 0, 0, 480, 480, JAVA2D);
  PaisWindow.noLoop();
  PaisWindow.setActionOnClose(G4P.EXIT_APP);
  PaisWindow.addDrawHandler(this, "PaisWindow_draw");
  PaisWindow.addOnCloseHandler(this, "cerrarApp");
  
  paisDescrip_lb = new GLabel(PaisWindow, 100, 40, 360, 60);
  paisDescrip_lb.setTextAlign(GAlign.LEFT, GAlign.TOP);
  paisDescrip_lb.setText("Descripción de país.");
  paisDescrip_lb.setOpaque(false);
  
  paisDl = new GDropList(PaisWindow, 100, 20, 200, 80, 3);
  paisDl.setItems(paisDisponibles(), 0);
  paisDl.addEventHandler(this, "paisDl_click");
  
  guiaImg = new GImageButton(PaisWindow, 20, 120, 80, 80, new String[] { "user.png", "user.png", "user.png" } );
  
  guiaDl = new GDropList(PaisWindow, 100, 120, 200, 80, 3);
  guiaDl.setItems(usuariosGestor.listaUsuarios(pais,""), 0);
  guiaDl.addEventHandler(this, "guiaDl_click");
  guiaLb = new GLabel(PaisWindow, 100, 140, 360, 60);
  guiaLb.setTextAlign(GAlign.LEFT, GAlign.TOP);
  guiaLb.setText("Descripción de guía");
  guiaLb.setOpaque(false);
  
  sitiosLb = new GLabel(PaisWindow, 20, 220, 160, 20);
  sitiosLb.setText("Sitsio turísticos");
  sitiosLb.setOpaque(false);
  sitiosDl = new GDropList(PaisWindow, 20, 240, 440, 80, 3);
  sitiosDl.setItems(sitiosGestor.listaFiltroPais(pais), 0);
  sitiosDl.addEventHandler(this, "sitiosDl_click");  
  
  actividadesLb = new GLabel(PaisWindow, 20, 280, 160, 20);
  actividadesLb.setText("Actividades Turísticas");
  actividadesLb.setOpaque(false);
  actividadesDl = new GDropList(PaisWindow, 20, 300, 440, 80, 3);
  actividadesDl.setItems(actividadesGestor.listaFiltroPais(pais), 0);
  actividadesDl.addEventHandler(this, "actividadesDl_click");
  
  calificacionDl = new GDropList(PaisWindow, 380, 120, 80, 80, 3);
  String[] callificacionesArray = new String[]{"0","1","2","3","4","5"};  
  calificacionDl.setItems(callificacionesArray, 0);
  calificacionDl.addEventHandler(this, "calificacionDl_click1");
  
  califLb = new GLabel(PaisWindow, 300, 120, 80, 20);
  califLb.setTextAlign(GAlign.RIGHT, GAlign.MIDDLE);
  califLb.setText("Calif.");
  califLb.setOpaque(false);

  //Ventana normal: Registro
  registroWindow = GWindow.getWindow(this, "Registro", 0, 0, 460, 460, JAVA2D);
  registroWindow.noLoop();
  
  nombreLb = new GLabel(registroWindow, 20, 20, 80, 20);
  nombreLb.setText("Nombre");
  nombreLb.setOpaque(false);
  
  apellidoLb = new GLabel(registroWindow, 240, 20, 80, 20);
  apellidoLb.setText("Apellido");
  apellidoLb.setOpaque(false);
  
  nombreTxt = new GTextField(registroWindow, 20, 40, 200, 30, G4P.SCROLLBARS_NONE);
  nombreTxt.setOpaque(true);
  
  apellidoTxt = new GTextField(registroWindow, 240, 40, 200, 30, G4P.SCROLLBARS_NONE);
  apellidoTxt.setOpaque(true);
  
  ninLb = new GLabel(registroWindow, 20, 80, 80, 20);
  ninLb.setText("NIN");
  ninLb.setOpaque(false);
  
  ninTxt = new GTextField(registroWindow, 20, 100, 200, 30, G4P.SCROLLBARS_NONE);
  ninTxt.setOpaque(true);
  
  useNrLb = new GLabel(registroWindow, 240, 80, 80, 20);
  useNrLb.setText("Usuario");
  useNrLb.setOpaque(false);
  
  usuarioNuevoTxt = new GTextField(registroWindow, 240, 100, 200, 30, G4P.SCROLLBARS_NONE);
  usuarioNuevoTxt.setOpaque(true);
  
  passwordNuevaLb = new GLabel(registroWindow, 20, 140, 80, 20);
  passwordNuevaLb.setText("Contraseña");
  passwordNuevaLb.setOpaque(false);
  
  passwordNuevaTxt = new GTextField(registroWindow, 20, 160, 200, 30, G4P.SCROLLBARS_NONE);
  passwordNuevaTxt.setOpaque(true);
  
  guardarUsuarioBtn = new GButton(registroWindow, 120, 380, 220, 30);
  guardarUsuarioBtn.setText("Registrar");
  guardarUsuarioBtn.addEventHandler(this, "guardarUsuarioBtn_click");
  
  descripLb = new GLabel(registroWindow, 20, 260, 80, 20);
  descripLb.setText("Descripcion");
  descripLb.setOpaque(false);
  
  descripNuevaTxa = new GTextArea(registroWindow, 20, 280, 420, 80, G4P.SCROLLBARS_NONE);
  descripNuevaTxa.setOpaque(true);
  
  paisLb = new GLabel(registroWindow, 240, 140, 80, 20);
  paisLb.setText("País");
  paisLb.setOpaque(false);
  
  paisUserDl = new GDropList(registroWindow, 240, 160, 200, 120, 10);
  paisUserDl.setItems(paisesLista, 0);
  
  yearLb = new GLabel(registroWindow, 20, 200, 100, 20);
  yearLb.setText("Año Nacimiento");
  yearLb.setOpaque(false);
  
  telLb = new GLabel(registroWindow, 240, 200, 80, 20);
  telLb.setText("Telefono");
  telLb.setOpaque(false);
  
  yearTxt = new GTextField(registroWindow, 20, 220, 160, 30, G4P.SCROLLBARS_NONE);
  yearTxt.setOpaque(true);
  
  telefonoTxt = new GTextField(registroWindow, 240, 220, 200, 30, G4P.SCROLLBARS_NONE);
  telefonoTxt.setOpaque(true);
  
  //Ventana normal: Sitio Turistico ----------------------------------------------------------------------------------------------------------
  imgSitio = loadImage("fotos/none.png");
  SitioWindow = GWindow.getWindow(this, "Sitio Turístico", 0, 0, 480, 480, JAVA2D);
  SitioWindow.noLoop();
  SitioWindow.addDrawHandler(this, "SitioWindow_draw");  
  
  tituloSitWLb = new GLabel(SitioWindow, 20, 20, 440, 40);
  tituloSitWLb.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  tituloSitWLb.setText("Titulo de Sitio Turístico");
  tituloSitWLb.setTextBold();
  tituloSitWLb.setOpaque(true);
  
  descSitWLb = new GLabel(SitioWindow, 20, 320, 440, 80);
  descSitWLb.setTextAlign(GAlign.LEFT, GAlign.TOP);
  descSitWLb.setText("Descripcionde sitio");
  descSitWLb.setOpaque(false);
  

  
  //Ventana normal: Actividad Tursitica ----------------------------------------------------------------------------------------------------------
  imgActividad = loadImage("fotos/none.png");
  ActividadWindow = GWindow.getWindow(this, "Actividad Turística", 0, 0, 480, 480, JAVA2D);
  ActividadWindow.noLoop();
  ActividadWindow.addDrawHandler(this, "ActividadWindow_draw");
  
  tituloActWLb = new GLabel(ActividadWindow, 20, 20, 440, 40);
  tituloActWLb.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  tituloActWLb.setText("Titulo de Actividad Turística");
  tituloActWLb.setTextBold();
  tituloActWLb.setOpaque(true);
  
  descripActWLb = new GLabel(ActividadWindow, 20, 320, 440, 80);
  descripActWLb.setTextAlign(GAlign.LEFT, GAlign.TOP);
  descripActWLb.setText("Descripcion de Actividad Turística");
  descripActWLb.setTextBold();
  descripActWLb.setOpaque(false);
  


  //Ventana normal: Acerca de...  ----------------------------------------------------------------------------------------------------------
  AcercaWindow = GWindow.getWindow(this, "Acerca de...", 0, 0, 320, 200, JAVA2D);
  AcercaWindow.noLoop();
  
  realizadoPorLb = new GLabel(AcercaWindow, 20, 20, 280, 120);
  realizadoPorLb.setTextAlign(GAlign.LEFT, GAlign.TOP);
  realizadoPorLb.setText("Trabajo realizado por:");
  realizadoPorLb.setOpaque(false);
  
  unalLb = new GLabel(AcercaWindow, 80, 140, 220, 40);
  unalLb.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  unalLb.setText("Universidad Nacional de Colombia");
  unalLb.setOpaque(false);
    
  //
  PaisWindow.loop();
  registroWindow.loop();
  SitioWindow.loop();
  ActividadWindow.loop();
  AcercaWindow.loop();
}
