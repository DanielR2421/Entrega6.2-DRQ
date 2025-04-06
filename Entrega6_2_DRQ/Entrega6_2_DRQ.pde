int escenaActual;
String mensaje = "";

//Imagenes de fondo de las diferentes escenas
PImage sc1, sc2, sc3, sc4, sc5, sc6, sc7;
PImage sc1a, sc2b, sc3c, sc4d, sc5e, sc6f, sc7g;

//Imágenes de objetos
PImage imgOrden, imgMenu, imgReloj, imgLibro, imgLlave, imgCarta, imgPiano;

//Array de objetos moviles en cada escena
objetoMov[] objetoMovible = new objetoMov[7];

//Verificación para ver si el mouse está moviendo el objeto o se está dejando de dar click izquierdo con el mouse
boolean arrastrando = false;

//Esto indica que objeto estoy seleccionando y el -1 indica que no he seleccionado nada
int objetoSeleccionado = -1;

void setup() {
  size(1280, 800);
  escenaActual = 0;
  
  // Cargar las 7 imágenes
  sc1 = loadImage("escena1.jpeg");
  sc2 = loadImage("escena2.jpeg");
  sc3 = loadImage("escena3.jpeg");
  sc4 = loadImage("escena4.jpeg");
  sc5 = loadImage("escena5.jpeg");
  sc6 = loadImage("escena6.jpeg");
  sc7 = loadImage("escena7.jpeg");

  // Cargar las imágenes alternativas
  // Usar las mismas si no hay alternativas
  sc1a = loadImage("escena1.jpeg");
  sc2b = loadImage("escena2.jpeg");
  sc3c = loadImage("escena3.jpeg");
  sc4d = loadImage("escena4.jpeg");
  sc5e = loadImage("escena5.jpeg");
  sc6f = loadImage("escena6.jpeg");
  sc7g = loadImage("escena7.jpeg");

  // Cargar imágenes de objetos
  imgOrden = loadImage("escena1.jpeg");  // Usar escenas como temporales
  imgMenu = loadImage("escena1.jpeg");
  imgReloj = loadImage("escena1.jpeg");
  imgLibro = loadImage("escena1.jpeg");
  imgLlave = loadImage("escena1.jpeg");
  imgCarta = loadImage("escena1.jpeg");
  imgPiano = loadImage("escena1.jpeg");
  
  // Inicializar objetos
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

  // Dibujar la escena actual
  if (escenaActual == 0) {
    image(sc1, 0, 0, width, height);
  } else if (escenaActual == 1) {
    image(sc2, 0, 0, width, height);
  } else if (escenaActual == 2) {
    image(sc3, 0, 0, width, height);
  } else if (escenaActual == 3) {
    image(sc4, 0, 0, width, height);
  } else if (escenaActual == 4) {
    image(sc5, 0, 0, width, height);
  } else if (escenaActual == 5) {
    image(sc6, 0, 0, width, height);
  } else if (escenaActual == 6) {
    image(sc7, 0, 0, width, height);
  }

  // Mostrar objetos interactivos
  for (int i = 0; i < 7; i++) {
    if (objetoMovible[i].escena == escenaActual) {
      objetoMovible[i].display();
    }
  }
  
  // Mostrar mensaje
  if (mensaje != "") {
    fill(255);
    textSize(24);
    textAlign(CENTER);
    text(mensaje, width/2, 50);
  }
}

void keyPressed() {
  // Para moverse entre escenas
  if (keyCode == RIGHT) {
    escenaActual = (escenaActual + 1) % 7;
    mensaje = "";
  } else if (keyCode == LEFT) {
    escenaActual = (escenaActual + 6) % 7;
    mensaje = "";
  }

  // Mostrar imágenes alternativas
  switch(escenaActual) {
    case 0:
      if (key == 'a') {
        image(sc1a, 0, 0, width, height);
      }
      break;
    case 1:
      if (key == 'b') {
        image(sc2b, 0, 0, width, height);
      }
      break;
    case 2:
      if (key == 'c') {
        image(sc3c, 0, 0, width, height);
      }
      break;
    case 3:
      if (key == 'd') {
        image(sc4d, 0, 0, width, height);
      }
      break;
    case 4:
      if (key == 'e') {
        image(sc5e, 0, 0, width, height);
      }
      break;
    case 5:
      if (key == 'f') {
        image(sc6f, 0, 0, width, height);
      }
      break;
    case 6:
      if (key == 'g') {
        image(sc7g, 0, 0, width, height);
      }
      break;
  }
}

void mousePressed() {
  // Establecer mensaje cuando se hace clic izquierdo
  if (mouseButton == LEFT) {
    if (escenaActual == 0) {
      mensaje = "La condena";
    } else if (escenaActual == 1) {
      mensaje = "Vida en el hotel";
    } else if (escenaActual == 2) {
      mensaje = "Amistades";
    } else if (escenaActual == 3) {
      mensaje = "Sofía";
    } else if (escenaActual == 4) {
      mensaje = "Transformación";
    } else if (escenaActual == 5) {
      mensaje = "Escape";
    } else if (escenaActual == 6) {
      mensaje = "Final";
    }
  }
  
  // Verificar si se seleccionó un objeto
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

// Clase para objetos movibles
class objetoMov {
  PImage img;
  float x;
  float y;
  String texto;
  int escena;
  
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
}
