int escenaActual ;

String mensaje = "";

//Imagenes de fondo de las diferentes escenas
PImage sc1, sc2, sc3, sc4, sc5, sc6, sc7;

//Tal vez ni las use complejiza el codigo
PImage sc1a, sc2b, sc3c, sc4d, sc5e, sc6f, sc7g;

//Revisar
PImage  imgOrden, imgMenu, imgReloj, imgLibro, imgLlave, imgCarta, imgPiano;

//Array de objetos moviles en cada escena
objetoMov[] objetoMovible = new objetoMov[7];

//Verificación para ver si el mouse o esta moviendo el objeto o se esta dejando de dar click izquierdo con el mouse
boolean arrastrando = false;

//Esto indica que objeto estoy seleccionando y el -1 indica que no he seleccionado nada
int objetoSeleccionado = -1;

void setup() {
  size(800, 800);
  escenaActual = 0;
  // Cargar las 7 imágenes

  sc1 = loadImage("escena1.jpg");
  sc2 = loadImage("escena2.jpg");
  sc3 = loadImage("escena3.jpg");
  sc4 = loadImage("escena4.jpg");
  sc5 = loadImage("escena5.jpg");
  sc6 = loadImage("escena6.jpg");
  sc7 = loadImage("escena7.jpg");

  sc1a = loadImage("escena1.1.jpg");
  sc2b = loadImage("escena2.1.jpg");
  sc3c = loadImage("escena3.1.jpg");
  sc4d = loadImage("escena4.1.jpg");
  sc5e = loadImage("escena5.1.jpg");
  sc6f = loadImage("escena6.1.jpg");
  sc7g = loadImage("escena7.1.jpg");

  imgOrden = loadImage("orden.png");
  imgMenu = loadImage("menu.png");
  imgReloj = loadImage("reloj.png");
  imgLibro = loadImage("libro.png");
  imgLlave = loadImage("llave.png");
  imgCarta = loadImage("carta.png");
  imgPiano = loadImage("piano.png");
  
  objetoMovible[0] = new objetoMov(imgReloj, 400, 300, "El reloj del Hotel Metropol", 0);
  objetoMovible[1] = new objetoMov(imgLibro, 400, 300, "El libro de Montaigne", 1);
  objetoMovible[2] = new objetoMov(imgLlave, 400, 300, "La llave dorada de Nina", 2);
  objetoMovible[3] = new objetoMov(imgCarta, 400, 300, "Carta de despedida", 3);
  objetoMovible[4] = new objetoMov(imgPiano, 400, 300, "El piano de Sofía", 4);
  objetoMovible[5] = new objetoMov(imgReloj, 400, 300, "El reloj que dejó atrás", 5);
  objetoMovible[6] = new objetoMov(imgCarta, 400, 300, "Una carta para el futuro", 6);
}

void draw() {
  background(0);

  if (escenaActual == 0) {

    image(sc1, 0, 0);
    /* image(sc1a, 0, 0); ESTAS LAS PONGO COMO TEXTO PORQUE NO SE SI
     TIENEN QUE APARECER O CUANDO FUNCIONE EL SWITCH
     */
  } else if (escenaActual == 1) {
    image(sc2, 0, 0);
    // image(sc2b, 0, 0);
  } else if (escenaActual == 2) {
    image(sc3, 0, 0);
    // image(sc3c, 0, 0);
  } else if (escenaActual == 3) {
    image(sc4, 0, 0);
    // image(sc4d, 0, 0);
  } else if (escenaActual == 4) {
    // image(sc5, 0, 0);
    // image(sc5e, 0, 0);
  } else if (escenaActual == 5) {
    image(sc6, 0, 0);
    // image(sc6f, 0, 0);
  } else if (escenaActual == 6) {
    image(sc7, 0, 0);
    //image(sc7g, 0, 0);
  }

  for (int i = 0; i < 7; i++) {
    if (objetoMovible[i].escena == escenaActual) {
      objetoMovible[i].display();
    }
  }
}
void keyPressed() {

  // para moverse entre escenas mejor usar flechas y dejar las letras para las interacciones en las escenas

  if (keyCode == RIGHT) {
    escenaActual = (escenaActual + 1) % 7;
  } else if (keyCode == LEFT)
    escenaActual = (escenaActual + 6) % 7;


  switch(escenaActual) {

  case 0:
    if (key == 'a') {
      image(sc1a, 0, 0);
    }
    break;

  case 1:
    if (key == 'b') {
      image(sc2b, 0, 0);
    }
    break;

  case 2:
    if (key == 'c') {
      image(sc3c, 0, 0);
    }
    break;

  case 3:
    if (key == 'd')
      image(sc4d, 0, 0);
    break;

  case 4:
    if (key == 'e') {
      image(sc5e, 0, 0);
    }
    break;

  case 5:
    if (key == 'f') {
      image(sc6f, 0, 0);
    }
    break;

  case 6:
    if (key == 'g') {
      image(sc7g, 0, 0);
    }
    break;
  }
}

void mousePressed() {
  // el Clic izquierdo muestra los mensajes de cual escena está la historia

  //Mensaje escena 1
  push();
  mensaje = "La condena";
  if (escenaActual== 0 && mouseButton == LEFT ) {
    text(mensaje, 0, -300);
  }
  pop();

  //Mensaje escena 2
  push();
  mensaje = "Vida en el hotel";
  if (escenaActual == 1 && mouseButton == LEFT ) {
    text(mensaje, 0, -300);
  }
  pop();

  //Mensaje escena 3
  push();
  mensaje = "Amistades";
  if (escenaActual == 2 && mouseButton == LEFT ) {
    text(mensaje, 0, -300);
  }
  pop();

  //Mensaje escena 4
  push();
  mensaje = "Sofía";
  if (escenaActual == 3 && mouseButton == LEFT ) {
    text(mensaje, 0, -300);
  }
  pop();

  //Mensaje escena 5
  push();
  mensaje = "Transformación";
  if (escenaActual == 4 && mouseButton == LEFT ) {
    text(mensaje, 0, -300);
  }
  pop();

  //Mensaje escena 6
  push();
  mensaje = "Escape";
  if (escenaActual == 5 && mouseButton == LEFT ) {
    text(mensaje, 0, -300);
  }
  pop();

  //Mensaje escena 7
  push();
  mensaje = "Final";
  if (escenaActual == 6 && mouseButton == LEFT ) {
    text(mensaje, 0, -300);
  }
  pop();
  
  //No se si sea necesario utilizarlo no entiendo bien
   for (int i = 0; i < 7; i++) {
    if (objetoMovible[i].escena == escenaActual) {
      if (mouseX > objetoMovible[i].x && mouseX < objetoMovible[i].x + 100 && 
          mouseY > objetoMovible[i].y && mouseY < objetoMovible[i].y + 100) {
        objetoSeleccionado = i;
        arrastrando = true;
        mensaje = objetoMovible[i].texto;
      }
    }
  }
}


class objetoMov {
  PImage img;    // Imagen del objeto
  float x;  // Posición
  float y;
  String texto;  // Descripción
  int escena;    // A qué escena pertenece

  // Constructor
  objetoMov(PImage imagen, float posX, float posY, String descripcion, int numEscena) {
    img = imagen;
    x = posX;
    y = posY;
    texto = descripcion;
    escena = numEscena;
  }
  void display() {
    image(img, x, y, 100, 100);
  }

  void move() {
    // posY = posY + speed;
    x = mouseX;
    y = mouseY;
  }
}



void mouseDragged() {
  
   if (arrastrando && objetoSeleccionado >= 0) {
    objetoMovible[objetoSeleccionado].x = mouseX - 50;
    objetoMovible[objetoSeleccionado].y = mouseY - 50;
  }
}
  void mouseReleased() {
  arrastrando = false;
  objetoSeleccionado = -1;
 }
 
