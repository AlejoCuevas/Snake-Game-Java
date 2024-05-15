class PantallaOpciones {

  color[] coloresSerpiente = {color(0, 0, 255), color(255, 0, 0), color(255, 105, 180)};
  color[] coloresFondo = {color(0), color(0, 100, 0)};
  int indiceColorSerpiente = 0;
  int indiceColorFondo = 0;


  void mostrar() {
    background(coloresFondo[indiceColorFondo]);

    fill(255);
    textSize(20);
    text("Pantalla de Opciones", width / 2, height / 6);
    textSize(16);
    text("Color de la Serpiente: " + nombreColorSerpiente(), width / 2, height / 2 - 40);
    text("Color de Fondo: " + nombreColorFondo(), width / 2, height / 2);
    text("Presione TAB para volver al menu.", width / 2, height / 2 + 40);
  }
  
  String nombreColorSerpiente() {
    switch (indiceColorSerpiente) {
      case 0: return "Azul";
      case 1: return "Rojo";
      case 2: return "Rosa";
      default: return "Azul";
    }
  }
   String nombreColorFondo() {
    switch (indiceColorFondo) {
      case 0: return "Negro";
      case 1: return "Verde";
      default: return "Verde";
    }
  }
  
   void cambiarOpcion(int opcion) {
    switch (opcion) {
      case 0: // Cambiar color de la serpiente
        indiceColorSerpiente = (indiceColorSerpiente + 1) % coloresSerpiente.length;
        break;
      case 1: // Cambiar color de fondo
        indiceColorFondo = (indiceColorFondo + 1) % coloresFondo.length;
        break;
    }
  }
  
  color getColorSerpiente() {
    return coloresSerpiente[indiceColorSerpiente];
  }
  color getColorFondo() {
    return coloresFondo[indiceColorFondo];
  }
}
