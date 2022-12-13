class Student {
  String name;
  int age;
  int health;
  float healthiness;
  int boredom;
  int selfControl;
  Fridge fridge;
  int foodEaten;


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

  //go shopping
  void buyGroceries() {
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
    // do some logic based on the students stats to decide what to send in the parameters for the eatFood() function in fridge
    // also check the timepassed. use that to implement how often the student eats
    float variance = 0.2;
    int mealsPerDay;
    if (healthiness>=0.4) {
      mealsPerDay = int(random(1, 4));
    } else {
      mealsPerDay = int(random(0, 4));
    }
    eatFoodInFridge(mealsPerDay, healthiness + random(-variance, variance), healthiness + random(-variance, variance));
  }

  void eatFoodInFridge(int n, float hV, float fV) {
    health -= 2;
    boredom += 1;
    //println("n is: ", n);
    for (int i=f.food.size()-1; i>=0; i--) {
      Food item = f.food.get(i);
      if (n == 0) {
        break;
      }

      if ((item.healthValue >= hV) && (item.freshness>= hV-0.4)) {
        foodEaten++;
        health = health + round((item.healthValue)*4) - round((1-item.freshness)*3);
        f.removeItem(i);
        n--;
      }
    }
    //code so that if no food is eaten that frame, health diminishes
  }
  //eat out
  void eatOut() {
    boredom = 0;
    if ((healthiness + random(-0.1, 0.1)) >= 0.5) {
      println(name, "had a nice meal out with buddies at a fancy restaurant");
      health +=2;
    } else {
      println(name, "went to McDonalds and got a Big Mac :(");
      health -= 2;
    }
  }


  void displayHealth(int x, int y) {
    fill(255);
    text("Food eaten: " + foodEaten, x, y + 50);
    text("Boredom: " + boredom, x, y + 100);
    if (health >= 100) {
      text("Student health: 100", x, y);
      health = 100;
    } else if (health <= 0) {
      text("Student health: 0", x, y);
      gameOver();
    } else {
      text("Student health: " + health, x, y);
    }
  }
}
