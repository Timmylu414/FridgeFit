class Student {
  String name;
  int age;
  int health;
  float healthiness;
  float responsibility;
  float balance;
  String socialSkill;
  float productivity;
  Fridge fridge;
  int foodEaten;

  Student(String n, int a, float h, float r, float b, float p, Fridge f) {
    this.name = n;
    this.age = a;
    this.health = 100;
    this.healthiness = h;
    this.responsibility = r;
    this.balance = b;
    this.socialSkill = "normal";
    this.productivity = p;
    this.fridge = f;
    this.foodEaten = 0;
  }



  //go shopping
  void buyGroceries(){
    f.fillFridge();
  }


  //  //create shopping list, fill shopping list based on what fridge is lacking and health habits, chance of not filling list
  //  //for every item in shopping list, set arrayList<food> fridgeItems index to the index of shopping list, fills up fridge
  //  //set filled = true or not?

  //}
  void eat() { 
  }
  
  void eatFoodInFridge() {
    
    // do some logic based on the students stats to decide what to send in the parameters for the eatFood() function in fridge
    // also check the timepassed. use that to implement how often the student eats
    float variance = 0.2;
    f.eatFood(this,int(random(0,3)),healthiness + random(-variance,variance),healthiness + random(-variance,variance));
  }
  //eat out
  //     adjust the student's health
  //earned money
  //went to workout
  //birthday
  
  void displayHealth(int x, int y) {
    fill(255);
    text("Student health: " + health, x, y);
    text("Food eaten: " + foodEaten, x, y + 50);
  }
}
