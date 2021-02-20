/**
 Voici ce que le programme affichera si la carte Arduino envoie au PC la chaîne "1023\r\n"
 
 =====================
 1: 1023
 
 [0] '1'
 [1] '0'
 [2] '2'
 [3] '3'
 [4] ''
 [5] '
 '
 soit en valeur decimale:
 49
 48
 50
 51
 13
 10
 ---
 2: 1023
 [0] '1'
 [1] '0'
 [2] '2'
 [3] '3'
 soit en valeur decimale:
 49
 48
 50
 51
 ---
 3: 1023
 [0] '1'
 [1] '0'
 [2] '2'
 [3] '3'
 soit en valeur decimale:
 49
 48
 50
 51
 ---
 nombre entier: 1023
 ou avec tout sur une seule ligne de code
 nombre entier: 1023
 */

import processing.serial.*;

// Créer un objet à partir de la classe Serial
Serial mon_port_serie;  // créer un objet de la classe Serial pour la communication sur le port série

void setup() {
  mon_port_serie = new Serial(this, "COM6", 9600); // classe d'envoi et de réception de données via le protocole de communication série <https://processing.org/reference/libraries/serial/index.html>

  size(200, 130); // taille de la fenêtre avec width = largeur et height = hauteur
  textSize(32); // définit la taille actuelle de la police de caractère dans la fenêtre graphique <https://processing.org/reference/textSize_.html>
}

void draw() {
  // Si des données sont disponibles sur le port série :
  if (mon_port_serie.available() > 0) {
    String message_recu_en_ascii = mon_port_serie.readStringUntil('\n'); // lisez-le et stockez-le dans val <https://processing.org/reference/libraries/serial/Serial_readStringUntil_.html>

    // Renouvèlement de la couleur de l'arrière-plan de la fenêtre, permet d'effacer son contenu ;-) 
    background(0); // définit la couleur utilisée pour l'arrière-plan de la fenêtre, 0 = noir et 255 <https://processing.org/reference/background_.html>

    println(); // faire un saut de ligne
    println("====================="); // ligne de séparation de chaque message reçu (ou trame)
    print("1: ");
    println(message_recu_en_ascii);

    // Déclare un tableau de type char qui contient notre chaîne pour décomposition
    char[] decomposition_de_la_chaine = message_recu_en_ascii.toCharArray(); // notre chaîne converti en un tableau de caractère
    println(decomposition_de_la_chaine);
    println("soit en valeur decimale:");
    for (int i = 0; i < decomposition_de_la_chaine.length; i = i+1) {
      //println(decomposition_de_la_chaine[i]);
      int valeur_numerique_du_caractere = decomposition_de_la_chaine[i];
      println(valeur_numerique_du_caractere);
    }

    println("---");

    String message_ascii_sans_espace = trim(message_recu_en_ascii); // supprime les caractères d'espaces du début et de la fin d'une chaîne <https://processing.org/reference/trim_.html>
    print("2: ");
    println(message_ascii_sans_espace);
    decomposition_de_la_chaine = message_ascii_sans_espace.toCharArray(); // notre chaîne converti en un tableau de caractère
    println(decomposition_de_la_chaine);
    println("soit en valeur decimale:");
    for (int i = 0; i < decomposition_de_la_chaine.length; i = i+1) {
      int valeur_numerique_du_caractere = decomposition_de_la_chaine[i];
      println(valeur_numerique_du_caractere);
    }

    println("---");

    String message_ascii_sans_caracteres_de_fin = message_recu_en_ascii.replaceAll("\\r\\n", ""); // enlever les caractères CR et LF <https://fr.wikipedia.org/wiki/Carriage_Return_Line_Feed>
    print("3: ");
    println(message_ascii_sans_caracteres_de_fin);
    decomposition_de_la_chaine = message_ascii_sans_caracteres_de_fin.toCharArray(); // notre chaîne converti en un tableau de caractère
    println(decomposition_de_la_chaine);
    println("soit en valeur decimale:");
    for (int i = 0; i < decomposition_de_la_chaine.length; i = i+1) {
      //println(decomposition_de_la_chaine[i]);
      int valeur_numerique_du_caractere = decomposition_de_la_chaine[i];
      println(valeur_numerique_du_caractere);
    }

    println("---");

    int nombre_entier = Integer.parseInt(message_ascii_sans_caracteres_de_fin);
    print("nombre entier: ");
    println(nombre_entier);
    println("ou avec tout sur une seule ligne de code");
    // soit :
    nombre_entier = Integer.parseInt(trim(message_recu_en_ascii)); // enlever les espaces en debut et fin de String, ainsi que les caractères spéciaux '\r' '\n'
    print("nombre entier: ");
    println(nombre_entier);

    text(nombre_entier, 10, 30); // afficahage de la valeur numérique dans la fenêtre graphique
  }
}
