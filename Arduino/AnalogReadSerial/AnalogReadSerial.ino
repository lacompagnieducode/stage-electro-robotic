/*
  Exemple : AnalogReadSerial

  Lit une entrée analogique sur la broche A0 et envoie le résultat sur le port série.
  La représentation graphique est disponible en utilisant dans le menu "Outils > Traceur série"
  Fixez la broche centrale d'un potentiomètre à la broche A0 et les broches extérieures à + 5V et à la masse.

  Cet exemple de code est dans le domaine public.

  https://www.arduino.cc/en/Tutorial/BuiltInExamples/AnalogReadSerial
*/

// La routine de configuration s'exécute une seule fois lorsque vous branchez la carte
// ou que vous appuyez sur le bouton reset.
void setup() {
  // Initialiser la communication série à la vitesse de 9600 bits par seconde :
  Serial.begin(9600); // le PC devra également être configurer avec cette même vitesse pour commprendre le message transmit
}

// La routine de boucle s'exécute encore et encore, sans jamais s'arrêter.
void loop() {
  // Lire la tension de l'entrée analogique de la broche A0 :
  int valeur_du_capteur = analogRead(A0);

  // Envoyer la valeur que l'on vient lire sur le port série :
  Serial.println(valeur_du_capteur);

  delay(100); // délai entre chaque lecture, ici ralenti pour permettre un défilement plus lent sur l'affichage du PC
}
