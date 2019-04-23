void main(List<String> args) {
  Banane banane = new Banane();
	Fraise fraise = new Fraise();
	Orange orange = new Orange();

  //recette1(fraise, banane);
  //recette2(fraise, banane);
  //recette3(fraise, banane);
  recette4(orange, banane);
}

void recette1(Fraise fraise, Banane banane){
	exemple_banane();
	exemple_fruit(banane);
  exemple_fruit(fraise);
}
void recette2(Fraise fraise, Banane banane) 
{
  exemple_banane_p();
  exemple_fruit_p(banane);
  exemple_fruit_p(fraise);
}

void recette3(Fraise fraise, Banane banane)
{
  brochette_fp_fruit(banane);
  brochette_fp_fruit(fraise);
}

void recette4(Orange orange, Banane banane) 
{
  BrochetteGen<Fruit> brochetteFruit = new BrochetteGen<Fruit>();
	brochetteFruit.embrocher(banane);
	brochetteFruit.embrocher(orange);
	compte_sloubifuit(brochetteFruit);

  BrochetteGen<Banane> brochetteBanane = new BrochetteGen<Banane>();
  brochetteBanane.embrocher(banane);
  brochetteBanane.embrocher(banane);
  compte_sloubifuit(brochetteBanane);

  BrochetteGen<FruitAPeler> brochetteFruitAPeler = new BrochetteGen<FruitAPeler>();
  brochetteFruitAPeler.embrocher(banane);
  brochetteFruitAPeler.embrocher(orange);
  pele_mele(brochetteFruitAPeler);
  
  BrochetteGen<Banane> brochetteB = new BrochetteGen<Banane>();
	brochetteB.embrocher(banane);
	brochetteB.embrocher(banane);
	pele_mele(brochetteB);

  appel_a_peau(brochetteFruitAPeler);
	//appel_a_peau(brochetteFruit);
	
  print("Appel a peau : " + brochetteFruitAPeler.list.length.toString());
	//print("Appel a peau : " + brochetteFruit.list.length.toString());

}

void exemple_banane() {
  Brochette brochette = new Brochette();
  Banane banane = new Banane();
  brochette.embrocher(banane);
  FruitAPeler f = brochette.debrocher();
  f.peler();
}

void exemple_banane_p()
{
	BrochetteGen<FruitAPeler> brochette = new BrochetteGen<FruitAPeler>();
  Banane banane = new Banane();
	brochette.embrocher(banane);
  FruitAPeler f = brochette.debrocher();

  f.peler();
}
	
void exemple_fruit_p(Fruit fruit)
{
	BrochetteGen<FruitAPeler> brochette = new BrochetteGen<FruitAPeler>();
	brochette.embrocher(fruit);
	FruitAPeler f = brochette.debrocher();
	f.peler();
}

void exemple_fruit(Fruit fruit) {
  Brochette brochette = new Brochette();
  brochette.embrocher(fruit);
  FruitAPeler f = brochette.debrocher();
  f.peler();
}

void brochette_fp_fruit(Fruit fruit)
{
  BrochetteGen<FruitAPeler> brochette_p = new BrochetteGen<FruitAPeler>();
 	BrochetteGen<Fruit> brochette_f = brochette_p;
 	brochette_f.embrocher(fruit);
 	brochette_p.debrocher().peler();
}

void compte_sloubifuit(brochette) 
{
  int i=0;
  while(brochette.debrocher() != null) i++;
  print("Il y avait " + i.toString() + " fruits");
}

void pele_mele(BrochetteGen<FruitAPeler> brochette)
{
  FruitAPeler fruit = brochette.debrocher();

  while(fruit != null)
  {
    fruit.peler();
    fruit = brochette.debrocher();
  }
}

void appel_a_peau(BrochetteGen<FruitAPeler> brochette)
{
	brochette.embrocher(new Banane());
	brochette.embrocher(new Orange());
}

class Brochette
{
  List<Fruit> fruits = new List<Fruit>();
	
	void embrocher(Fruit fruit) 
	{
		fruits.add(fruit);
	}
	
	Fruit debrocher()
	{
		Fruit fruit =  fruits.last;
		fruits.removeLast();
		return fruit;
	}
}

class BrochetteGen<T> 
{
  List<T> list = new List<T>();

  void embrocher(T t)
  {
    list.add(t);
  }

  T debrocher()
  {
    if (list.length == 0) return null;
    T t = list.last;
    list.removeLast();
    return t;
  }
}

class Fruit {}

class FruitAPeler extends Fruit
{
  void peler()
	{
		print("Fruit pelé");
	}
}

class Fraise extends Fruit {}

class Banane extends FruitAPeler {}

class Orange extends FruitAPeler {}