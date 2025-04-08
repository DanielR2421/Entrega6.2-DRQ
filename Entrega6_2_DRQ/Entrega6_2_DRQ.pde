int escenaActual;
int versionEscena = 0;
String mensaje = "";

//Imagenes de fondo de las diferentes escenas
PImage sc1, sc2, sc3, sc4, sc5, sc6, sc7;
PImage sc1a, sc2b, sc3c, sc4d, sc5e, sc6f, sc7g;

//Imágenes de objetos
PImage imgMartillo, imgCopa, imgLlave, imgCepillo, imgReloj, imgTiquete, imgManzana;

//Array de objetos moviles en cada escena
objetoMov[] objetoMovible = new objetoMov[7];

//Verificación para ver si el mouse está moviendo el objeto o se está dejando de dar click izquierdo con el mouse
boolean arrastrando = false;

boolean escenaSecundaria = false;

//Esto indica que objeto estoy seleccionando y el -1 indica que no he seleccionado nada
int objetoSeleccionado = -1;

// Variables para mostrar el texto de la historia
boolean mostrarTexto = false;
String textoHistoria = "";
String tituloHistoria = "";

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
  imgMartillo = loadImage("Matrillo_de_juez.png");
  imgCopa = loadImage("Copa_de_vino.png");
  imgLlave = loadImage("Llave_dorada.png");
  imgCepillo = loadImage("Cepillo_de_peinar.png");
  imgReloj = loadImage("Reloj_de_bolsillo.png");
  imgTiquete = loadImage("Tiquete_de_tren.png");
  imgManzana = loadImage("Manzana.png");

  // Inicializar objetos con sus clases específicas para posiciones personalizadas
  objetoMovible[0] = new ObjetoMartillo(imgMartillo, "El Juicio", 0, "La Condena del Conde Alexander Rostov", 
    "En 1922, el Conde Rostov es sentenciado por un tribunal soviético a arresto domiciliario en el Hotel Metropol. " +
    "Aunque pierde su libertad, mantiene su dignidad mientras cruza la gran entrada del hotel, iniciando una nueva " +
    "vida encerrada entre sus muros.");
    
  objetoMovible[1] = new ObjetoCopa(imgCopa, "Restaurante Boyarsky", 1, "Vida cotidiana en el Hotel Metropol", 
    "Rostov recorre los pasillos del Boyarsky, observando la vida de los huéspedes desde su mesa habitual. Arriba, " +
    "en su pequeño ático, encuentra consuelo en la lectura, la escritura y el silencio, oscilando entre el bullicio y " +
    "la introspección.");
    
  objetoMovible[2] = new ObjetoLlave(imgLlave, "Pasadizos del Hotel", 2, "Las amistades", 
    "Nina, una niña con una llave dorada, le muestra al Conde los secretos del Metropol. Años después, Rostov " +
    "comparte momentos íntimos con Anna Urbanova, una actriz. Sus relaciones le devuelven la cercanía humana y " +
    "un sentido renovado de pertenencia.");
    
  objetoMovible[3] = new ObjetoCepillo(imgCepillo, "Cuidado de Sofía", 3, "La llegada de Sofía", 
    "Nina regresa para dejarle a su hija Sofía. Rostov, al principio inseguro, aprende a criarla con afecto. " +
    "Juegan, leen, comparten. La niña transforma su rutina y le da un nuevo propósito.");
    
  objetoMovible[4] = new ObjetoReloj(imgReloj, "Paso del Tiempo", 4, "La transformación del Conde", 
    "Sofía, ya joven, toca el piano mientras Rostov la observa con orgullo. El hotel ha perdido su esplendor. " +
    "Él, antes aristócrata, ahora trabaja en la cocina. Su rol cambia, pero su esencia se fortalece en lo cotidiano.");
    
  objetoMovible[5] = new ObjetoTiquete(imgTiquete, "Busqueda de mejor vida", 5, "El plan de escape", 
    "Rostov ayuda a Sofía a huir a París. Finge su suicidio y desaparece por los pasillos secretos del hotel. " +
    "Bajo la lluvia, se aleja en la noche, dejando atrás su antigua vida.");
    
  objetoMovible[6] = new ObjetoManzana(imgManzana, "Fin", 6, "¿Es Rostov?", 
    "En un café rural, un hombre con sombrero bebe té. Un segundo vaso espera sobre la mesa. La escena sugiere " +
    "que Rostov, al fin, ha encontrado libertad en el anonimato.");
}

void draw() {
  background(0);
  //  Incidarores de cuando debe ir organizada la escena actual junto con las escenas secundarias
  
  if (escenaActual == 0) {
    //Centrar las imagenes con las variables designadas para representar o una escena principal o una escena secundaria
    float centroX = (width - sc1.width) / 2;
    float centroY = (height - sc1.height) / 2;

    // Usar la imagen normal o secundaria para la escena
    if (escenaSecundaria) {
      image(sc1a, centroX, centroY); // esto es para que aparezca la imagen
    } else {
      image(sc1, centroX, centroY); // Escena Original
    }
  } else if (escenaActual == 1) {

    float centroX2 = (width - sc2.width) / 2;
    float centroY2 = (height - sc2.height) / 2;

    if (escenaSecundaria) {
      image(sc2b, centroX2, centroY2);
    } else {
      image(sc2, centroX2, centroY2); // Escena Original
    }
  } else if (escenaActual == 2) {

    float centroX3 = (width - sc3.width) / 2;
    float centroY3 = (height - sc3.height) / 2;

    if (versionEscena == 1) {
      float centroSecX = (width - sc1a.width) / 2;
      float centroSecY = (height - sc1a.height) / 2;
      image(sc1a, centroSecX, centroSecY);  // Escena secundaria A (3A)
    } else if (versionEscena == 2) {
      float centroSecX = (width - sc2b.width) / 2;
      float centroSecY = (height - sc2b.height) / 2;
      image(sc2b, centroSecX, centroSecY);  // Escena secundaria B (3B)
    } else {
      image(sc3, centroX3, centroY3); // Escena Original
    }
  } else if (escenaActual == 3) {

    float centroX4 = (width - sc4.width) / 2;
    float centroY4 = (height - sc4.height) / 2;

    if (versionEscena == 1) {
      float centroSecX = (width - sc3c.width) / 2;
      float centroSecY = (height - sc3c.height) / 2;
      image(sc3c, centroSecX, centroSecY);  // Escena secundaria A (4A)
    } else {
      image(sc4, centroX4, centroY4); // Escena Original
    }
  } else if (escenaActual == 4) {

    float centroX5 = (width - sc5.width) / 2;
    float centroY5 = (height - sc5.height) / 2;

    if (versionEscena == 1) {
      float centroSecX = (width - sc4d.width) / 2;
      float centroSecY = (height - sc4d.height) / 2;
      image(sc4d, centroSecX, centroSecY);  // Escena secundaria A (5A)
    } else {
      image(sc5, centroX5, centroY5); // Escena Original
    }
  } else if (escenaActual == 5) {

    float centroX6 = (width - sc6.width) / 2;
    float centroY6 = (height - sc6.height) / 2;

    if (versionEscena == 1) {
      float centroSecX = (width - sc5e.width) / 2;
      float centroSecY = (height - sc5e.height) / 2;
      image(sc5e, centroSecX, centroSecY);  // Escena secundaria A (6A)
    } else if (versionEscena == 2) {
      float centroSecX = (width - sc6f.width) / 2;
      float centroSecY = (height - sc6f.height) / 2;
      image(sc6f, centroSecX, centroSecY);  // Escena secundaria B (6B)
    } else if (versionEscena == 3) {
      float centroSecX = (width - sc7g.width) / 2;
      float centroSecY = (height - sc7g.height) / 2;
      image(sc7g, centroSecX, centroSecY);  // Escena secundaria C (6C)
    } else {
      image(sc6, centroX6, centroY6);   // Escena Original
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
  
  // Mostrar el texto de la historia si está activo
  if (mostrarTexto) {
    // Fondo semi-transparente para el texto
    fill(0, 0, 0, 200);
    rect(0, height - 200, width, 200);
    
    // Título
    fill(255);
    textSize(28);
    textAlign(CENTER);
    text(tituloHistoria, width/2, height - 170);
    
    // Texto de la historia
    textSize(20);
    textAlign(CENTER);
    text(textoHistoria, 50, height - 140, width - 100, 120);
    
    // Instrucción para cerrar
    textSize(14);
    textAlign(RIGHT);
    text("Presiona ESPACIO para cerrar", width - 50, height - 20);
    
    // Instrucciones para cambiar de escena
    textSize(14);
    textAlign(LEFT);
    text("Presiona FLECHA DERECHA para AVANZAR a la siguiente escena", width - 1230, height - 40);
    text("O FLECHA IZQUIERDA para RETROCEDER a la anterior", width - 1230, height - 20);
    
    // Instrucciones para cambiar de escena
    textSize(12);
    textAlign(CENTER);
    text("Presiona 'a','b','c'para ver las escenas secundarias", width - 640, height - 40);
    text("Disponible en las escenas 3, 4, 5, 6", width - 640, height - 20); 
    
  }
}

void keyPressed() {
  // Cerrar el texto si está mostrándose
  if (mostrarTexto && key == ' ') {
    mostrarTexto = false;
    return;
  }
  
  // Para moverse entre escenas
  if (keyCode == RIGHT) {
    escenaActual = (escenaActual + 1) % 7;
    mensaje = "";
    versionEscena = 0; // Resetear al cambiar de escena
    mostrarTexto = false; // Ocultar texto al cambiar de escena
  } else if (keyCode == LEFT) {
    escenaActual = (escenaActual + 6) % 7;
    mensaje = "";
    versionEscena = 0; // Resetear al cambiar de escena
    mostrarTexto = false; // Ocultar texto al cambiar de escena
  }

  // Mostrar imágenes secundarias
  if (key == 'a') {
    versionEscena = (versionEscena == 1) ? 0 : 1;  // Alterna entre Escena principal y versión A
  } else if (key == 'b') {
    versionEscena = (versionEscena == 2) ? 0 : 2;  // Alterna entre Escena principal y versión B
  } else if (key == 'c') {
    versionEscena = (versionEscena == 3) ? 0 : 3;  // Alterna entre Escena principal y versión C
  }
}

void mousePressed() {
  // Si está mostrando texto, ocultarlo al hacer click
  if (mostrarTexto) {
    mostrarTexto = false;
    return;
  }  
  // Verificar si se seleccionó un objeto; esto por alguna razon puede fallar a veces
  for (int i = 0; i < 7; i++) {
    if (objetoMovible[i].escena == escenaActual) {
      if (mouseX > objetoMovible[i].x && mouseX < objetoMovible[i].x + 100 &&
        mouseY > objetoMovible[i].y && mouseY < objetoMovible[i].y + 100) {
        objetoSeleccionado = i;
        arrastrando = true;
        mensaje = objetoMovible[i].texto;
        
        // Mostrar texto de la historia al hacer clic en el objeto
        mostrarTextoHistoria(i);
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

// Función para mostrar el texto de la historia
void mostrarTextoHistoria(int indiceObjeto) {
  mostrarTexto = true;
  tituloHistoria = objetoMovible[indiceObjeto].tituloTexto;
  textoHistoria = objetoMovible[indiceObjeto].textoCompleto;
}

// Clase para objetos movibles
class objetoMov {
  PImage img;
  float x;
  float y;
  String texto;
  int escena;
  String tituloTexto;
  String textoCompleto;

  // Constructor
  objetoMov(PImage imagen, float posX, float posY, String descripcion, int numEscena, String titulo, String textoLargo) {
    img = imagen;
    x = posX;
    y = posY;
    texto = descripcion;
    escena = numEscena;
    tituloTexto = titulo;
    textoCompleto = textoLargo;
  }

  //Tamaño y posición del objeto del objeto interactivo
  void display() {
    image(img, x, y);
  }
}

// Clases extendidas para posicionar los objetos - añadidas al final del código como en el ejemplo original
class ObjetoMartillo extends objetoMov {
  ObjetoMartillo(PImage imagen, String descripcion, int numEscena, String titulo, String textoLargo) {
    super(imagen, 1050, 150, descripcion, numEscena, titulo, textoLargo);
  }
}

class ObjetoCopa extends objetoMov {
  ObjetoCopa(PImage imagen, String descripcion, int numEscena, String titulo, String textoLargo) {
    super(imagen, 250, 400, descripcion, numEscena, titulo, textoLargo);
  }
}

class ObjetoLlave extends objetoMov {
  ObjetoLlave(PImage imagen, String descripcion, int numEscena, String titulo, String textoLargo) {
    super(imagen, 640, 600, descripcion, numEscena, titulo, textoLargo);
  }
}

class ObjetoCepillo extends objetoMov {
  ObjetoCepillo(PImage imagen, String descripcion, int numEscena, String titulo, String textoLargo) {
    super(imagen, 180, 150, descripcion, numEscena, titulo, textoLargo);
  }
}

class ObjetoReloj extends objetoMov {
  ObjetoReloj(PImage imagen, String descripcion, int numEscena, String titulo, String textoLargo) {
    super(imagen, 950, 550, descripcion, numEscena, titulo, textoLargo);
  }
}

class ObjetoTiquete extends objetoMov {
  ObjetoTiquete(PImage imagen, String descripcion, int numEscena, String titulo, String textoLargo) {
    super(imagen, 640, 150, descripcion, numEscena, titulo, textoLargo);
  }
}

class ObjetoManzana extends objetoMov {
  ObjetoManzana(PImage imagen, String descripcion, int numEscena, String titulo, String textoLargo) {
    super(imagen, 640, 400, descripcion, numEscena, titulo, textoLargo);
  }
}
