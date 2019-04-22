library metaTP;

import 'dart:io';
import 'dart:mirrors';

void main(List<String> args) {
  InstanceCreator instanceCreator = new InstanceCreator();
	var ps = instanceCreator.csvinit("personne.csv");
  print(ps);
	print(ps[0].getNom());
}

class InstanceCreator {
  csvinit(String filename) {
    String nomClass = filename.substring(0, filename.indexOf("."));
    nomClass = nomClass.substring(0, 1).toUpperCase() + nomClass.substring(1);
    
    var input = new File(Directory.current.path + "\\ProjetDeSessionPOO\\TP3\\" + filename);
    var lines = input.readAsLinesSync();
    
    int i=0;
    List instances = new List();
    for (var line in lines) {
      if (i!=0){
        instances.add(strinit(nomClass, line));
      }
      i++;
    }
    return instances;
  }

  strinit(String type, String data) {
    var strings = data.split(","); 
    
    MirrorSystem mirrors = currentMirrorSystem();
    LibraryMirror lm = mirrors.libraries.values.firstWhere(
      (LibraryMirror lm) => lm.qualifiedName == new Symbol('metaTP'));

    ClassMirror classMirror = lm.declarations[new Symbol(type)];
    var instance = classMirror.newInstance(new Symbol(''), strings);  
   
    return instance.reflectee;
  }
}

class Personne {
  String prenom;
	String getPrenom() { return prenom; }
	void setPrenom(String value) { prenom = value; }

	String nom;
	String getNom() { return nom; }
	void setNom(String value) { nom = value; }

  Personne(String prenom, String nom) {
	  this.prenom = prenom;
	  this.nom = nom;
	}
}