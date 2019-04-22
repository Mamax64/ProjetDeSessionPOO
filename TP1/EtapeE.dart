import 'dart:io';

void main(List<String> args) {
  	Voyageur v1 = new Voyageur("Philémon");
		Voyageur v2 = new Voyageur("Peninna");
		Marchand m = new Marchand("Far★Star");
	
		WagonVoyageur w1 = new WagonVoyageur();
		Facade.monter(v1, w1);
		Facade.monter(v2, w1);
	
		WagonMarchandise w2 = new WagonMarchandise();
		w1.suivant = w2;
		Facade.affreter(m, w2);
	
		WagonMarchandise w3 = new WagonMarchandise();
		w2.suivant = w3;
		Facade.affreter(m, w3);
	
		WagonVoyageur w4 = new WagonVoyageur();
		w3.suivant = w4;
		Facade.monter(v2, w4);
		
		WagonDouble w5 = new WagonDouble();
		w4.suivant = w5;
		Facade.affreter(m, w5);
		Facade.monter(v2, w5);
	
		w1.afficher_train();
}
class Wagon 
{
  Wagon suivant;
	
	void afficher_wagon()
	{
	}	
	
	void afficher_train()
	{
		afficher_wagon();
		
		if(this.suivant != null)
		{
			this.suivant.afficher_train();
		}
	}	
}
	
class WagonVoyageur extends Wagon
{
	List<Voyageur> voyageurs = new List<Voyageur>();	
	Voyage voyage = new Voyage();
	void afficher_wagon()
	{
		stdout.write("Voyageur: ");
		print(voyage.afficher());
	}
}

class Voyageur
{
	String nom;
	Voyage voyage;
	
	Voyageur(String nom)
	{
		this.nom = nom;
	}
	
	void monter(Voyage voyage)
	{
		descendre();	
		this.voyage = voyage;
		this.voyage.voyageurs.add(this);
	}
	
	void descendre()
	{
		if(voyage != null)
		{
			this.voyage.voyageurs.remove(this);
			this.voyage = null; 
		}
	}
}

class WagonMarchandise extends Wagon
{
	Fret fret = new Fret();
	
	void afficher_wagon()
	{
		stdout.write("Marchandise: marchand=");
		print(fret.Afficher());
	}
}

class Marchand
{
	String nom;
	
	Marchand(String nom)
	{
		this.nom = nom;
	}
}

class WagonDouble extends Wagon
{
	Fret fret = new Fret();
  Voyage voyage = new Voyage();
	
	void afficher_wagon()
	{
		stdout.write("Double: "); 
		stdout.write(voyage.afficher());
		stdout.write(fret.Afficher());
	}
}

class Voyage
{
	List<Voyageur> voyageurs = new List<Voyageur>();	

	String afficher()
	{
		String str = "voyageur(s)= ";
		
		for(Voyageur voyageur in voyageurs)
		{
			str = str + voyageur.nom + " ";
		}
		
		return str;
	}
}

class Fret
{
	Marchand marchand = null;
	void Affreter(Marchand marchand) 
	{ 
		this.marchand = marchand; 
	}
	String Afficher()
	{
		return ("marchand= " + marchand.nom);
	}
}

class Facade
{
	static void affreter(Marchand marchand, Wagon wagon)
	{
        if(wagon is WagonMarchandise)
        {
            wagon.fret.Affreter(marchand);
        }
	else if(wagon is WagonDouble)
	{
	wagon.fret.Affreter(marchand);
	}
	else print("Pas affretable");   
	}
	
	static void monter(Voyageur voyageur, Wagon wagon)
	{
  if(wagon is WagonVoyageur){
    voyageur.monter(wagon.voyage);
	}
	else if(wagon is WagonDouble)
	{
    voyageur.monter(wagon.voyage);
	}
	else print("Pas montable");   
	}
}
