void main(List<String> args) {
  var v1 = new Voyageur("Philémon");
  var v2 = new Voyageur("Peninna");
  var m = new Marchand("Far★Star");
   
  WagonDouble w1 = new WagonDouble();
  w1.affreter(m);
  v1.monter(w1);
  v2.monter(w1);
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

mixin WagonVoyageur on Wagon {
  List<Voyageur> voyageurs = new List<Voyageur>();
  String wagonName = "VOYAGEUR: ";
  String afficherVoyageur() {
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

mixin WagonMarchandise on Wagon {
  Marchand marchand;
  String wagonName = "MARCHANDISE: ";

  void affreter(Marchand marchand) {
    this.marchand = marchand;
  }

  String afficherMarchand() {
    return "marchand: " + this.marchand.nom;
    
  }
}

class Marchand {
  String nom;
  Marchand(String nom) {
    this.nom =nom;
  }
}

class WagonDouble extends Wagon with WagonMarchandise, WagonVoyageur { 
  String wagonName = "DOUBLE: ";
  String afficher() {
    return afficherVoyageur() + " " + afficherMarchand();
  }
}

