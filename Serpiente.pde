class Serpiente {
  ArrayList<Segmento> segmentos;
  int xdir, ydir;
  color colorSerpiente;

  Serpiente(color colorSerpiente) {
    segmentos = new ArrayList<Segmento>();
    segmentos.add(new Segmento(40, 40)); // Segmento inicial
    xdir = 1;
    ydir = 0;
    this.colorSerpiente = colorSerpiente;
  }
  void actualizar() {
    Segmento cabeza = segmentos.get(0);
    int newX = cabeza.x + xdir * 5; //Velocidad de la serpiente
    int newY = cabeza.y + ydir * 5; //Velocidad de la serpiente

    segmentos.add(0, new Segmento(newX, newY));
    segmentos.remove(segmentos.size() - 1); // Remueve el último segmento
  }
  void crecer() {
    Segmento cola = segmentos.get(segmentos.size() - 1);
    for (int i = 0; i < 3; i++) {
      segmentos.add(new Segmento(cola.x, cola.y));
    }
  }
  void mostrar() {
    fill(colorSerpiente);
    for (Segmento s : segmentos) {
      s.mostrar();
    }
  }
  void direccion(int x, int y) {
    xdir = x;
    ydir = y;
  }
  boolean colision(int x, int y) {
    for (Segmento s : segmentos) {
      // Verificar si alguna parte de la serpiente coincide con el cuadrado de la comida
      if (s.x == x && s.y == y) {
        return true;
      }
    }
    return false;
  }
  boolean colisionPared() {
    Segmento cabeza = segmentos.get(0);
    return cabeza.x < 0 || cabeza.y < 0 || cabeza.x >= width || cabeza.y >= height;
  }
  boolean colisionCuerpo() {
    Segmento cabeza = segmentos.get(0);
    for (int i = 1; i < segmentos.size(); i++) {
      Segmento s = segmentos.get(i);
      if (cabeza.x == s.x && cabeza.y == s.y) {
        return true;
      }
    }
    return false;
  }
}
