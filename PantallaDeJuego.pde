class PantallaDeJuego {
  Serpiente serpiente;
  Comida comida;
  int puntuacion;
  PantallaOpciones pantallaOpciones;
  int numColumnas = 30;
  int numFilas = 30;
  int tamanoCuadro;
  
  PantallaDeJuego(PantallaOpciones pantallaOpciones) {
    this.pantallaOpciones = pantallaOpciones;
    color colorSerpiente = pantallaOpciones.getColorSerpiente();
    color colorComida = color(255, 0, 0);
    
    serpiente = new Serpiente(colorSerpiente);
    comida = new Comida(colorComida);
    puntuacion = 0;
    tamanoCuadro = min(width/numColumnas, height/numFilas);
  }

  void mostrar() {
    background(pantallaOpciones.getColorFondo()); // Fondo negro para la pantalla de juego
    //Cuadricula
    stroke(100); // Color
    for (int i = 0; i < width; i += tamanoCuadro) {
      line(i, 0, i, height); // Lineas verticales.
    }
    for (int j = 0; j < width; j += tamanoCuadro) {
      line(0, j, width, j); // Lineas horizontales.
    }

    serpiente.actualizar();
    serpiente.mostrar();
    comida.mostrar();
    if (serpiente.colision(comida.x, comida.y)) {
      serpiente.crecer();
      serpiente.actualizar();
      comida.nuevaComida();
      puntuacion++;
    }
    if (serpiente.colisionPared() || serpiente.colisionCuerpo()) {
      println("Game Over: " + puntuacion);
      noLoop();
    }
    mostrarPuntuacion();
  }
  void mostrarPuntuacion() {
    fill(255);
    textSize(20);
    text("Puntuacion: " + puntuacion, 50, 50);
  }
  void cambiarDireccion(int x, int y) {
    serpiente.direccion(x, y);
  }
}
