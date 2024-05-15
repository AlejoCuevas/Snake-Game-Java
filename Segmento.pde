class Segmento {

  int x, y;


  Segmento(int x, int y) {
    this.x = x;
    this.y = y;
  }

  void mostrar() {
    fill(0, 255, 0);
    rect(x, y, 20, 20);
  }
}
