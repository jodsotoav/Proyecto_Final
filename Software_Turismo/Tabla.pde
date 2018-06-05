import java.util.*;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

class Tabla {
  
  String directorio;
  public ArrayList<Fila> filas = new ArrayList<Fila>();
  public HashMap<String,Integer> atributos = new HashMap<String,Integer>();
  public String[] encabezados = {};
  public Integer[] llaves;
  public int atributoParaMostrar = 0;
  
  Tabla (String directorio, Integer[] llaves, int atributoParaMostrar){
    this.directorio = directorio;
    this.llaves = llaves;    
    this.atributoParaMostrar = atributoParaMostrar;

    String[] lineas = loadStrings(directorio);
    //
    encabezados = lineas[0].split(", "); //primer renglon
    for (int i = 0 ; i < encabezados.length; i++) {
      atributos.put( encabezados[i], i );      
    }        
    cargar();

  }
  
  void cargar()
  {
    String[] lineas = loadStrings(directorio);
    println("Cargando datos de " + directorio+". ");       
    println("\t atributos:",atributos);
    
    //
    for (int i = 1 ; i < lineas.length; i++) {
      Fila fila = new Fila(lineas[i], this);
      filas.add(fila);
      println("\t",fila.aTexto());
    }      
    println("\t tamaño filas: ",filas.size());      
  }
  
  public Fila seleccionar(String id) {
    Fila seleccion = null;
    for (Fila fila: filas)
    {
      if (fila.atributos[0].equals(id)) seleccion = fila;
    }
    return seleccion;
  }
  
  public boolean contiene (Fila f){
    for (Fila fila: filas)
    {
      if (fila.esMismaFila(f)) return true;
    }    
    return false;
  }
  
  public boolean agregar(String[] atributos)
  {   
    // procede  el proceso
    if (!validarAtributosFila(atributos))
    {
      println("MODELO Usuarios: atributos invalidos.");
      return false;
    }
    
    // Crea la fila de usuario
    Fila f = new Fila (atributos,this);    
    
    boolean exito = false;
    exito = !contiene(f);
    //println("agregar: ",exito);
    if (exito) 
    {
      exito = filas.add(f);
    }
    //println("agregar: ",exito);
    this.guardar();    
    return exito;
  }   
  
  public void guardar() 
  {
    String[] stringArray = new String [filas.size()+1];
    
    //Escribir encabezados
    stringArray[0] = "";
    //
    for(int i = 0; i < encabezados.length; i++)
    {
      stringArray[0] += encabezados[i];
      stringArray[0] += i < encabezados.length-1 ? ", " : "";
    }    
    
    
    //Escribir datos
    for(int i = 1; i < filas.size()+1; i++)
    {
      stringArray[i] = filas.get(i-1).aTexto();
      println(stringArray[i]);
    }
 
    //
    saveStrings("Data/"+directorio, stringArray);
    
    //
    cargar();
  }
}