class Student{
  String name;
  int age;
  int health;
  float balance;
  String socialSkill;
  float productivity;
  
  Student(String n, int a,int  h, float b, float p){
   this.name = n;
   this.age = a;
   this.health = h;
   this.balance = b;
   this.socialSkill = "normal"; //(good, normal, bad)
   this.productivity = p;
  }

  
  //go shopping
  void buyGroceries(){
    int shopListSize = 0;
    for (int i=0; i<(n+1); i++) {
      for (int j = 0; j<n; j++) {
        if (fud[i][j] == null) {
          shopListSize += 1;
          if (totalHealthValue < 30){
            fud[i][j] = (new Food(10,10,10,"vegetable", random(2,10)));
            balance = balance - random(3,4);
            println(balance);
          }
          else if (socialSkill == "bad"){
            int SpecialActivity = int(random(0, 4));
            if (SpecialActivity == 0){
              eatout();
            }
            if (SpecialActivity == 1){
              throwParty();
            }
            if (SpecialActivity == 2){
              stayLonely();
            }
          }
        }
      }
    }
  }
  
  //create shopping list, fill shopping list based on what fridge is lacking and health habits, chance of not filling list
  
  //for every item in shopping list, set arrayList<food> fridgeItems index to the index of shopping list, fills up fridge
  //set filled = true or not?
  
  void removeSpoiled() {
    for(int i=0; i<(n+1); i++) {
      for (int j=0; j<n; j++) {
        if (fud[i][j]!= null) {
          if ((fud[i][j].freshness<2) && (random(0,1)>0.8)) {
            fud[i][j] = null;
          }
        }
      }
    }
  }
  
  //eat out
  void eatout(){
    balance = balance - random(5, 20);
    socialSkill = "good";
  }
  
  //party
  void throwParty(){
    //empties out whole fridge
    balance = balance - random(10, 50);
    socialSkill = "good";
  }
  
  void stayLonely(){
    balance = balance - random(50, 60); //assuming now they need therapy
    socialSkill = "bad";
  }
  
  //earned money
  //went to workout
}
