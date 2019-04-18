import 'dart:io';

void main(List<String> args) {
  	Voyageur v1 = new Voyageur("Philémon");
		Voyageur v2 = new Voyageur("Peninna");
		Marchand m = new Marchand("Far★Star");
	
      Wagon w1 = new Wagon(true, false);
      v1.monter(w1);
      v2.monter(w1);

      Wagon w2 = new Wagon(false, true);
      w1.suivant = w2;
      w2.affreter(m);
	
      Wagon w3 = new Wagon(false, true);
      w2.suivant = w3;
      w3.affreter(m);

      Wagon w4 = new Wagon(true, true);
      w3.suivant = w4;
      v2.monter(w4);
	    w4.affreter(m);

		w1.afficher_train();
 }

class Wagon
{
	bool is_wagon_voyageurs;
	bool is_wagon_marchandises;

	Wagon(bool is_wagon_voyageurs, bool is_wagon_marchandises)
	{
		this.is_wagon_voyageurs = is_wagon_voyageurs;
		this.is_wagon_marchandises = is_wagon_marchandises;
	}
	
	Wagon suivant;
	
	List<Voyageur> voyageurs = new List<Voyageur>();	
	
	Marchand marchand;
	
	void affreter(Marchand marchand)
	{
		this.marchand = marchand;
	}

	void afficher_wagon()
	{
		if(is_wagon_voyageurs && is_wagon_marchandises == false)
		{
			stdout.write("VOYAGEUR: voyageur(s)=");
		
			for(Voyageur voyageur in voyageurs)
			{
				print(voyageur.nom + " ");
			}
		
		}
		
		if(is_wagon_voyageurs == false && is_wagon_marchandises)
		{
			print("MARCHANDISE: marchand=" + this.marchand.nom);
		}
		
		if(is_wagon_voyageurs && is_wagon_marchandises)
		{
			stdout.write("DOUBLE: voyageur(s)=");
		
			for(Voyageur voyageur in voyageurs)
			{
				stdout.write(voyageur.nom + " ");
			}

			print(" marchand=" + this.marchand.nom);
		}
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
	
class Voyageur
{
	String nom;
	Wagon wagon;
	
	Voyageur(String nom)
	{
		this.nom = nom;
	}
	
	void monter(Wagon wagon)
	{
		if(this.wagon != null)
		{
			descendre();
		}
		this.wagon = wagon;
		this.wagon.voyageurs.add(this);		
	}
	
	
	void descendre()
	{		
		this.wagon.voyageurs.remove(this);
		this.wagon = null;
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