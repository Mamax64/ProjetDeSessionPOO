import 'dart:core';
import 'dart:io';

import 'dart:mirrors';

void main	() {
		var bs = csvinit2("bataille.csv");
		print(bs);
    print(bs[2].toString());
		print(bs[2].getAnnee().toString());
}

csvinit2(String filename){
  String nomClass = filename.substring(0, filename.indexOf("."));
  nomClass = nomClass.substring(0, 1).toUpperCase() + nomClass.substring(1);
   
  var input = new File(Directory.current.path + "\\ProjetDeSessionPOO\\TP3\\" + filename);
  var lines = input.readAsLinesSync();
     
  int i=0;
  List<String> firstLine = List<String>();
  List<Bataille> instances = new List<Bataille>();

  for (var line in lines) {
    
    Bataille bataille = reflectClass(Bataille).newInstance(new Symbol(''), []).reflectee;

    if(i==0){
  	  firstLine = line.split(",");
      i++;
    }

    else {
      var splitedLine = line.split(",");
      for (int i=0; i<3; i++) {
        if (firstLine[i] == "nom") {
      		String nomBataille = splitedLine[i];
      		bataille.setValue(nomBataille);
       	}
        if (firstLine[i] == "annee") {
          String annee = splitedLine[i];
          Annee instanceAnnee = reflectClass(Annee).newInstance(new Symbol(''), [annee]).reflectee;
          bataille.setValue(instanceAnnee);
        }  
      	if (firstLine[i] == "decisive") {
       		bool decisive = splitedLine[i] == true;
       		bataille.setValue(decisive);
      	}
      }    
      instances.add(bataille);   
    }
  }
  return instances;
}


class Annee {
	/** Numéro de l'année: ne peut être négatif ou nul*/
	int numero;

	/** après la conquète de Aegon et l'arrivée à  PortRoyal */
	bool ac;

	Annee(String s) {
		var strings = s.split(" ");
		this.numero = int.parse("302");
		
		strings[1] = strings[1].replaceAll("AC", "true");
		strings[1] = strings[1].replaceAll("BC", "false");
		this.ac = strings[1] == "true";
	}

	
	@override String toString() {
		return "Numéro: " + this.numero.toString() + " ; AC: " + this.ac.toString();	
	}
}

class Bataille {
	String nom;
	void setNom(String value) { nom = value; }
	String getNom() { return nom; }
	Annee annee;
	void setAnnee(Annee value) { annee = value; }
	Annee getAnnee() { return annee; }
	bool decisive;
	void setDecisive(bool value) { decisive = value; }
	bool getDecisive() { return decisive; }

	@override String toString() {
    return "Nom: " + getNom().toString() + " ; Décisive: " + getDecisive().toString() + " ; " + getAnnee().toString();
	}

  	void setValue(Object value) {
		if (value.runtimeType == String) {
			this.nom = value;
		}
		if (value.runtimeType == bool) {
			this.decisive = value;
		}
		if (value.runtimeType == Annee) {
			this.annee = value;
		}
	}
}