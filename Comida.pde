class Comida {
  int x, y;
  color colorComida;

  Comida(color colorComida) {
    this.colorComida = colorComida;
    nuevaComida();
  }

  void nuevaComida() {
    x = int(random(width / 20)) * 20;
    y = int(random(height / 20)) * 20;
  }

  void mostrar() {
    fill(colorComida);
    rect(x, y, 20, 20);
  }
}
