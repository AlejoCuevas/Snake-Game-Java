color colorFondo = color(0, 100, 0);
color textoColor = color(250);
int opcion = 0; // Cambiado a 0 para manejar índices correctamente
int totalOpciones = 3;
int estado = 0; // Estado del Juego (Pantallas)
PantallaDeJuego pantallaDeJuego; // Declara la instancia pantalla de juego
PantallaOpciones pantallaOpciones; // Declara la instancia pantalla de opciones

void settings() {
  size(800, 600);
}

void setup() {
  pantallaOpciones = new PantallaOpciones(); // Inicializa la instancia de PantallaOpciones
  pantallaDeJuego = new PantallaDeJuego(pantallaOpciones); // Inicializa la instancia de PantallaDeJuego 
}

void draw() {
  if (estado == 0) {
    mostrarMenu();
  } else if (estado == 1) {
    pantallaDeJuego.mostrar();
  } else if (estado == 2) {
    pantallaOpciones.mostrar();
  }
}

void mostrarMenu() {
  background(colorFondo); // Asegúrate de limpiar la pantalla con el color de fondo

  textAlign(CENTER, CENTER);
  textSize(40);
  fill(textoColor);
  text("Snake Game", width / 2, height / 4);
  // Muestra el nombre del juego en pantalla

  textSize(30);
  textAlign(CENTER, CENTER);

  // Muestra las opciones del menú
  for (int i = 0; i < totalOpciones; i++) {
    if (i == opcion) {
      fill(255, 0, 0); // Cambia el color de la opción seleccionada
    } else {
      fill(textoColor);
    }
    switch (i) {
    case 0:
      text("Jugar", width / 2, height / 2 + i * 80);
      break;
    case 1:
      text("Opciones", width / 2, height / 2 + i * 80);
      break;
    case 2:
      text("Salir", width / 2, height / 2 + i * 80);
      break;
    }
  }
}

void keyPressed() {
  if (estado == 0) { // Navegar por el menú
    if (keyCode == UP) {
      opcion--;
      if (opcion < 0) {
        opcion = totalOpciones - 1;
      }
    } else if (keyCode == DOWN) {
      opcion++;
      if (opcion >= totalOpciones) {
        opcion = 0;
      }
    } else if (keyCode == ENTER) {
      // Acción para cada opción seleccionada
      switch (opcion) {
      case 0:
        println("Jugar seleccionado");
        estado = 1;
        break;
      case 1:
        println("Opciones seleccionadas");
        estado = 2;
        break;
      case 2:
        println("Salir seleccionado");
        // Salir del juego
        exit();
        break;
      }
    }
  } else if (estado == 1) { // En el estado de juego
    if (keyCode == UP && pantallaDeJuego.serpiente.ydir == 0) {
      pantallaDeJuego.cambiarDireccion(0, -1);
    }
    if (keyCode == DOWN && pantallaDeJuego.serpiente.ydir == 0) {
      pantallaDeJuego.cambiarDireccion(0, 1);
    }
    if (keyCode == LEFT && pantallaDeJuego.serpiente.xdir == 0) {
      pantallaDeJuego.cambiarDireccion(-1, 0);
    }
    if (keyCode == RIGHT && pantallaDeJuego.serpiente.xdir == 0) {
      pantallaDeJuego.cambiarDireccion(1, 0);
    } else if (keyCode == TAB) {
      estado = 0; // Volver al menú
    }
  } else if (estado == 2) { // En el estado de opciones
    if (keyCode == UP) {
      pantallaOpciones.cambiarOpcion(0);
    } else if (keyCode == DOWN) {
      pantallaOpciones.cambiarOpcion(1);
    } else if (keyCode == TAB) {
      estado = 0;  // Volver al menú
    }
  } else { // En cualquier otro estado, se puede volver al menú presionando TAB
    if (keyCode == TAB) {
      println("Volver al menú");
      estado = 0;
    }
  }
}
