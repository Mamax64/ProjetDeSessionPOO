import 'dart:mirrors';

void main(List<String> args) {
  Personne instance = strinit(Personne, "Jon,Snow");
  print(instance);
  print(instance.getNom());
}

strinit(Type type, String data) {
  var strings = data.split(","); 
   
  var instance = reflectClass(type).newInstance(new Symbol(''), strings);  
   
  return instance.reflectee;
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