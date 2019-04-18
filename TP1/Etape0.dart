  void main(List<String> args) {
    var v1 = new Voyageur("Philémon");
    var v2 = new Voyageur("Peninna");
    var m = new Marchand("Far★Star");

    var w1 = new WagonVoyageur();
    v1.monter(w1);
    v2.monter(w1);

    var w2 = new WagonMarchandise();
    w1.suivant = w2;
    w2.affreter(m);

    var w3 = new WagonMarchandise();
    w2.suivant = w3;
    w3.affreter(m);

    var w4 = new WagonVoyageur();
    w3.suivant = w4;
    v2.monter(w4);

    w1.afficherTrain();
  }

class Wagon {
  Wagon suivant;
  String wagonName = "wagon";

  String afficher() { return "";}

  void afficherWagon() {
    print(this.wagonName + " " + afficher());
  }

  void afficherTrain() {
    afficherWagon();
    if (suivant != null) {
      suivant.afficherTrain();
    }
  }
}

class WagonVoyageur extends Wagon {
  List<Voyageur> voyageurs = new List<Voyageur>();
  String wagonName = "VOYAGEUR: ";
  String afficher() {
    String str = "voyageur(s) = ";
    for (Voyageur voyageur in voyageurs) {
      str = str + voyageur.nom + " ";
    } 
    return str;
  }
}

class Voyageur {
  String nom;
  WagonVoyageur wagon;

  Voyageur(String nom) {
    this.nom = nom;
  }

  void monter(WagonVoyageur wagon) {
    descendre();
    this.wagon = wagon;
    wagon.voyageurs.add(this);
  }

  void descendre() {
    if (this.wagon != null) {
      this.wagon.voyageurs.remove(this);
      this.wagon = null;
    }
  }
}

class WagonMarchandise extends Wagon {
  Marchand marchand;
  String wagonName = "MARCHANDISE: ";

  void affreter(Marchand marchand) {
    this.marchand = marchand;
  }

  String afficher() {
    return "marchand: " + this.marchand.nom;
    
  }
}

class Marchand {
  String nom;
  Marchand(String nom) {
    this.nom =nom;
  }
}