class Student {
  
  //Fields
  String name;
  int age;
  int health;
  float healthiness;
  int boredom;
  int selfControl;
  Fridge fridge;
  int foodEaten;

  //CONSTRUCTOR
  Student(String n, int a, float h, int s, Fridge f) {
    this.name = n;
    this.age = a;
    this.health = 80;
    this.healthiness = h;
    this.boredom = 0;
    this.selfControl = s;
    this.fridge = f;
    this.foodEaten = 0;
  }

  //FIELDS
  
  void buyGroceries() { //go shopping
    f.fillFridge();
  }

  void chooseEat() {  //decides whether student eats at home or goes out
    if (boredom >= selfControl) {
      eatOut();
    } else {
      eatAtHome();
    }
  }

  //calculates values to input into eatAtHome function
  void eatAtHome() {
    float variance = 0.2;  //adds some leniency for how strict student's diet is
    int mealsPerDay;
    if (healthiness>=0.4) {
      mealsPerDay = int(random(1, 4));
    } else {
      mealsPerDay = int(random(0, 4));
    }
    eatFoodInFridge(mealsPerDay, healthiness + random(-variance, variance));
  }

  void eatFoodInFridge(int m, float hV) {
    health -= 2;
    boredom += 1;  
    for (int i=f.food.size()-1; i>=0; i--) {  //iterates through for loop backwards so that future index numbers aren't affected by removing an item from array
      Food item = f.food.get(i);
      if (m == 0) {  //Once student is done eating for the day or decides to starve, break loop
        break;
      }

      if ((item.healthValue >= hV) && (item.freshness>= hV-0.4)) {  //Healthier students will only eat healthier and more fresh items. 
        foodEaten++;
        health = health + round((item.healthValue)*4) - round((1-item.freshness)*3);  //health changes based on healthValue and freshness of the food, multiplied by factors
        f.removeItem(i);  
        m--;
      }
    }
    //code so that if no food is eaten that frame, health diminishes
  }
  //eat out
  void eatOut() {
    boredom = 0;  //Student has fun with their friends
    if ((healthiness + random(-0.1, 0.1)) >= 0.5) {
      println(name, "had a nice meal out with buddies at a fancy restaurant :)");
      health +=2;
    } else {
      println(name, "went to McDonalds with friends and got a Big Mac :(");
      health -= 2;
    }
  }


  void displayStats(int x, int y) {  //displays statistics alongside fridge
    fill(255);
    text("Food eaten: " + foodEaten, x, y);
    text("Food thrown out :" + f.numFoodSpoiled, x, y+50);
    text("Boredom: " + boredom, x, y + 150);
    if (health >= 100) {
      text("Student health: 100", x, y + 100);  //maximum health is 100
      health = 100;
    } else if (health <= 0) {
      text("Student health: 0", x, y + 100);  //minimum health is 100, if goes to 0 or below then call gameOver function
      gameOver();
    } else {
      text("Student health: " + health, x, y + 100);
    }
  }
}
