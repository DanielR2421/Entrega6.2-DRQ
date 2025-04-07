int escenaActual;
int versionEscena = 0;
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

boolean escenaSecundaria = false;

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
  sc1a = loadImage("escena3A.jpeg");
  sc2b = loadImage("escena3B.jpeg");
  sc3c = loadImage("escena4A.jpeg");
  sc4d = loadImage("escena5A.jpeg");
  sc5e = loadImage("escena6A.jpeg");
  sc6f = loadImage("escena6B.jpeg");
  sc7g = loadImage("escena6C.jpeg");

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
    //Centrar las imagenes
    float centroX = (width - sc1.width) / 2;
    float centroY = (height - sc1.height) / 2;
    
   // Usar la imagen normal o secundaria para la escena
    if (escenaSecundaria) {
      image(sc1a, centroX, centroY);
    } else {
      image(sc1, centroX, centroY);
    }
  } else if (escenaActual == 1) {
    
    float centroX2 = (width - sc2.width) / 2;
    float centroY2 = (height - sc2.height) / 2;
    
    if (escenaSecundaria) {
      image(sc2b, centroX2, centroY2);
    } else {
      image(sc2, centroX2, centroY2);
    }    
  } else if (escenaActual == 2) {
    
   float centroX3 = (width - sc3.width) / 2;
    float centroY3 = (height - sc3.height) / 2;
    
   if (versionEscena == 1) {
    image(sc1a, centroX3, centroY3);  // Versión A (3A)
  } 
  else if (versionEscena == 2) {
    image(sc2b, centroX3, centroY3);  // Versión B (3B)
  } else {
      image(sc3, centroX3, centroY3);
    }
  } else if (escenaActual == 3) {
    
    float centroX4 = (width - sc4.width) / 2;
    float centroY4 = (height - sc4.height) / 2;
    
    if (versionEscena == 1) {
    image(sc3c, centroX4, centroY4);  // Versión A (4A)
    } else {
      image(sc4, centroX4, centroY4);
    }
  } else if (escenaActual == 4) {
    
    float centroX5 = (width - sc5.width) / 2;
    float centroY5 = (height - sc5.height) / 2;
    
   if (versionEscena == 1) {
    image(sc4d, centroX5, centroY5);  // Versión A (5A)
    } else {
      image(sc5, centroX5, centroY5);
    }
  } else if (escenaActual == 5) {
    
    float centroX6 = (width - sc6.width) / 2;
    float centroY6 = (height - sc6.height) / 2;
    
   if (versionEscena == 1) {
    image(sc5e, centroX6, centroY6);  // Versión A (6A)
  } 
  else if (versionEscena == 2) {
    image(sc6f, centroX6, centroY6);  // Versión B (6B)
  }
  else if (versionEscena == 3) {
    image(sc7g, centroX6, centroY6);  // Versión C (6C)
  }
  else {
    image(sc6, centroX6, centroY6);   // Versión normal
  }
  } else if (escenaActual == 6) {
    
    float centroX7 = (width - sc7.width) / 2;
    float centroY7 = (height - sc7.height) / 2;
    
    if (escenaSecundaria) {
      image(sc7g, centroX7, centroY7);
    } else {
      image(sc7, centroX7, centroY7);
    }
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
    versionEscena = 0; // Resetear al cambiar de escena
    
  } else if (keyCode == LEFT) {
    escenaActual = (escenaActual + 6) % 7;
    mensaje = "";
    versionEscena = 0; // Resetear al cambiar de escena
  }

// Mostrar imágenes secundarias
 if (key == 'a') {
    versionEscena = (versionEscena == 1) ? 0 : 1;  // Alterna entre normal y versión A
  }
  else if (key == 'b') {
    versionEscena = (versionEscena == 2) ? 0 : 2;  // Alterna entre normal y versión B
  }
  else if (key == 'c') {
    versionEscena = (versionEscena == 3) ? 0 : 3;  // Alterna entre normal y versión C
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

  //Mofificar los ultimos 2 para usar el tamaño de las imagenes osea para conservar el orirginal quitar el 100, 100
  void display() {
    image(img, x, y, 100, 100);
  }
}
