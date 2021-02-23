// Dimmer - Envoie des octets sur le port série de l'Arduino

// par David A. Mellis
// Cet exemple de code est dans le domaine public.

import processing.serial.*;
Serial port;

void setup() {
  size(256, 150);

  println("Ports série disponibles:");
  // si vous utilisez Processing 2.1 ou version ultérieure, utilisez Serial.printArray()
  println(Serial.list());

  // Utilise le premier port de cette liste (numéro 0).
  // Modifiez ceci pour sélectionner le port correspondant à votre carte Arduino.
  // Le dernier paramètre (par exemple 9600) est le vitesse de la communication.
  // Il doit correspondre à la valeur transmise à Serial.begin() dans votre programme Arduino.
  //port = new Serial(this, Serial.list()[0], 9600);

  // Ou, si vous connaissez le numéro du port COM utilisé par la carte Arduino,
  // vous pouvez le spécifier directement comme ça :
  port = new Serial(this, "COM8", 9600);
}

void draw() {
  // Dessine un dégradé du noir au blanc de 0 à 255 :
  for (int i = 0; i < 256; i++) {
    stroke(i); // Définit la couleur utilisée pour dessiner des lignes et des bordures autour des formes.
    line(i, 0, i, 150); // trace une ligne verticale de 150 pixels de hauteur
  }

  // Ecrit la position X actuelle de la souris sur le port série :
  port.write(mouseX);  // envoie un seul octet
}
