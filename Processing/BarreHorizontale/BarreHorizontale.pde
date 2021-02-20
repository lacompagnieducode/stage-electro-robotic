/**
 * @file BarreHorizontale.pde
 * @author ArnauldDev
 * @brief Affichage d'une barre horizontale
 * @version 1.01
 * @date 2021-02-20
 * 
 * @copyright Copyright (c) 2021, La Compagnie du Code <https://www.lacompagnieducode.org/>
 */

import processing.serial.*;

// Créer un objet à partir de la classe Serial
Serial mon_port_serie;  // créer un objet de la classe Serial pour la communication sur le port série

float x, y;

void setup() {
  // Modifiez ici le numéro du port COM de votre carte Arduino 
  mon_port_serie = new Serial(this, "COM6", 9600); // classe d'envoi et de réception de données via le protocole de communication série <https://processing.org/reference/libraries/serial/index.html>

  size(1150, 150); // taille de la fenêtre avec width = largeur et height = hauteur
  strokeWeight(40);
  //stroke(255, 160);
  textSize(32); // définit la taille actuelle de la police de caractère dans la fenêtre graphique <https://processing.org/reference/textSize_.html>

  // Définit le point de départ de trait à déssiner
  x = 60;
  y = 80;
  // ou en relatif par rapport à la taille de la fenêtre
  //x = width * 0.05;
  //y = height * 0.5;
}

void draw() {
  // Si des données sont disponibles sur le port série :
  if (mon_port_serie.available() > 0) {
    String message_recu_en_ascii = mon_port_serie.readStringUntil('\n'); // lisez-le et stockez-le dans val <https://processing.org/reference/libraries/serial/Serial_readStringUntil_.html>

    // Renouvèlement de la couleur de l'arrière-plan de la fenêtre, permet d'effacer son contenu ;-) 
    background(0); // définit la couleur utilisée pour l'arrière-plan de la fenêtre, 0 = noir et 255 <https://processing.org/reference/background_.html>

    int nombre_entier = Integer.parseInt(trim(message_recu_en_ascii)); // enlever les espaces en debut et fin de String, ainsi que les caractères spéciaux '\r' '\n'
    print("nombre entier: ");
    println(nombre_entier);

    text(nombre_entier, 50, 40); // afficahage de la valeur numérique dans la fenêtre graphique

    // Redéfinir une nouvelle origine des objets dans la fenêtre d'affichage <https://processing.org/reference/translate_.html>
    translate(x, y); // redéfinition de la nouvelle origine pour le tracé des traits

    // Affichage d'une barre fixe comme décorateur de fond pour la fenêtre
    strokeWeight(50); // définition de l'épaisseur du trait
    stroke(70, 160); // définition de la couleur
    line(0, 0, 1023, 0); // tracé du trait du fond

    // Solution classique : line(x_debut, y_debut, x_fin, y_fin)
    //line(60, 80, nombre_entier+60, 80); // dessine un segment de droite <https://processing.org/reference/line_.html>
    strokeWeight(40); // définition de l'épaisseur du trait
    stroke(255, 160); // définition de la couleur
    line(0, 0, nombre_entier, 0);
  }
}
