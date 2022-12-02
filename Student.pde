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
   this.socialSkill = "normal";
   this.productivity = p;
  }

  
  //go shopping
  void buyGroceries(){
    int shopListSize = 0;
    for (int i=0; i<(n+1); i++) {
      for (int j = 0; j<n; j++) {
        if (fud[i][j] == null) {
          shopListSize += 1;
        }
      }
    }
    println(shopListSize);
    
    //create shopping list, fill shopping list based on what fridge is lacking and health habits, chance of not filling list
    //for every item in shopping list, set arrayList<food> fridgeItems index to the index of shopping list, fills up fridge
    //set filled = true or not?
    
  }
  //eat out
  //earned money
  //went to workout
  //birthday
}
