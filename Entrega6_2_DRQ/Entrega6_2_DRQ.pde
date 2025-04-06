int escenaActual ;

String mensaje = "";

PImage sc1, sc2, sc3, sc4, sc5, sc6, sc7;

PImage sc1a, sc2b, sc3c, sc4d, sc5e, sc6f, sc7g;

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
text(mensaje,  0, -300);
}
pop();

//Mensaje escena 3
push();
mensaje = "Amistades";
if (escenaActual == 2 && mouseButton == LEFT ) {
text(mensaje,  0, -300);
}
pop();

//Mensaje escena 4
push();
mensaje = "Sofía";
if (escenaActual == 3 && mouseButton == LEFT ) {
text(mensaje,  0, -300);
}
pop();

//Mensaje escena 5
push();
mensaje = "Transformación";
if (escenaActual == 4 && mouseButton == LEFT ) {
text(mensaje,  0, -300);
}
pop();

//Mensaje escena 6
push();
mensaje = "Escape";
if (escenaActual == 5 && mouseButton == LEFT ) {
text(mensaje,  0, -300);
}
pop();

//Mensaje escena 7
push();
mensaje = "Final";
if (escenaActual == 6 && mouseButton == LEFT ) {
text(mensaje,  0, -300);
}
pop();

}
