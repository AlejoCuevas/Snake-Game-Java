class PantallaDeJuego {
  Serpiente serpiente;
  Comida comida;
  int puntuacion;
  PantallaOpciones pantallaOpciones;
  
  PantallaDeJuego() {
  color colorSerpiente = pantallaOpciones.getColorSerpiente();
  color colorComida = color(255, 0, 0);
  serpiente = new Serpiente(colorSerpiente);
  comida = new Comida(colorComida);
  puntuacion = 0;
  }
  
  void mostrar() {
    background(pantallaOpciones.getColorFondo()); // Fondo negro para la pantalla de juego
    serpiente.actualizar();
    serpiente.mostrar();
    comida.mostrar();

    if (serpiente.colision(comida.x, comida.y)) {
    serpiente.crecer();
    comida.nuevaComida();
    puntuacion++;
    }
    if(serpiente.colisionPared() || serpiente.colisionCuerpo()) {
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
