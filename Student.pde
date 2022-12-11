class Student {
  String name;
  int age;
  int health;
  float healthiness;
  float loneliness;
  Fridge fridge;
  int foodEaten;

  Student(String studentName, int a, float h, Fridge f) {
    this.name = studentName;
    this.age = a;
    this.health = 80;
    this.healthiness = h;
    this.loneliness = 0;
    this.fridge = f;
    this.foodEaten = 0;
  }

  //go shopping
  void buyGroceries() {
    f.fillFridge();
  }

  void chooseEat() {  //decides whether student eats at home or goes out
    if (loneliness>20) {
      eatOut();
      println(name, "touched grass");
    } else {
      eatFoodInFridge();
    }
  }

  //calculates values to input into eatAtHome function
  void eatFoodInFridge() {
    // do some logic based on the students stats to decide what to send in the parameters for the eatFood() function in fridge
    // also check the timepassed. use that to implement how often the student eats
    float variance = 0.2;
    int mealsPerDay;
    if (healthiness>=0.5) {
      mealsPerDay = int(random(1, 4));
    } else {
      mealsPerDay = int(random(0, 3));
    }
    eatAtHome(mealsPerDay, healthiness + random(-variance, variance), healthiness + random(-variance, variance));
  }

  void eatAtHome(int n, float hV, float fV) {
    health += n-2;
    loneliness += 1;
    println("n is: ", n);
    for (int i=f.food.size()-1; i>=0; i--) {
      Food item = f.food.get(i);
      if (n == 0) {
        break;
      }

      if ((item.healthValue >= hV) && (item.freshness>= hV-0.4)) {
        foodEaten++;
        health = health + round((item.healthValue-0.4)*5) - round((1-item.freshness)*3);
        f.removeItem(i);
        n--;
      }
    }
  }
  //eat out
  void eatOut() {
    loneliness = 0;
    health += 2;
  }


  void displayHealth(int x, int y) {
    fill(255);
    if (health >= 100) {
      text(studentName, x, y);
      text("'s health: 100", x + (studentName.length() + studentName.length()*10), y);
    } else if (health <= 0) {
      text(studentName, x, y);
      text("'s health: 0", x + (studentName.length() + studentName.length()*10), y);
      gameOver();
    } else {
      text(studentName, x, y);
      text("'s health: " + health, x + (studentName.length() + studentName.length()*10), y);
    }

    text("Food eaten: " + foodEaten, x, y + 50);
  }
}
