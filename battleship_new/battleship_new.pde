PImage shp; // image for player side ship

PImage enemyshp; // image for enemy ship

// random player coordinates
int [] playerCoordinatesX = new int[5]; 
int [] playerCoordinatesY = new int[5];
// random enemy coordinates
int [] enemyCoordinatesX = new int[5];
int [] enemyCoordinatesY = new int[5];
//random enemy guesses on player side
int [] enemyGuessX = new int[100];
int [] enemyGuessY = new int[100];

//player and enemy tallies
int playerCount;
int enemyCount;

//int for random enemy guesses
int a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z;

void setup(){
   
background(0, 0, 0);
size(1000, 600);
textSize(30);


//draws everything except grid
 strokeWeight(1);
 fill(255, 255, 255);
      textSize(15);
      text("First to sink all 5 ships wins", 50, 550);
      fill(200, 0, 0);
      rect(400, 525, 20, 20);
      fill(255, 255, 255);
      text(" = hit a ship", 430, 540);
      fill(0, 0, 200);
      rect(400, 565, 20, 20);
      fill(255, 255, 255);
      text(" = miss (hit open water)", 430, 580);
      fill(0, 200, 200);
      textSize(30);
      text("Good Luck!", 750, 560); 
     

i = floor(random(0, 101));

shp = loadImage("shp.png");
enemyshp = loadImage("enemyshp.png");





for(int y = 0; y < 100; y++){
  int newA = floor(random(0, 5));
  int newB = floor(random(0, 5));

enemyGuessX[y] = newA;
enemyGuessY[y] = newB;

}



//random values for player ships
for (int y = 0; y < 5; y++) {
  int newX = floor(random(0, 5));
  int newY = floor(random(0, 5));
  
  for (int i=0; i<y; i++) {
    if (playerCoordinatesX[i] == newX && playerCoordinatesY[i]  == newY) {
      newX = floor(random(0, 5));
      newY = floor(random(0, 5));
      i = 0;
      continue;
    }
  }
  
  playerCoordinatesX[y] = newX;
  playerCoordinatesY[y] = newY;
}

// random values for enemy ships
for (int y = 0; y < 5; y++) {
  int newX = floor(random(5, 10));
  int newY = floor(random(0, 5));
  
  for (int i = 0; i < y; i++) {
    if (enemyCoordinatesX[i] == newX && enemyCoordinatesY[i]  == newY) {
      newX = floor(random(5, 10));
      newY = floor(random(0, 5));
      i = 0;
      continue;
    }
  }
  
  enemyCoordinatesX[y] = newX;
  enemyCoordinatesY[y] = newY;
}


//draws grid
for (int y = 0; y < 1000; y += 100) {
    for (int z = 0; z < 500; z += 100) {
      strokeWeight(1);
      fill(0, 150, 150);
      rect(y, z, 100, 100);
      
    }


}

  //visible player ships
  image(shp, playerCoordinatesX[0] * 100 + 10, playerCoordinatesY[0] * 100 + 10, 80, 80);
  image(shp, playerCoordinatesX[1] * 100 + 10, playerCoordinatesY[1] * 100 + 10, 80, 80);
  image(shp, playerCoordinatesX[2] * 100 + 10, playerCoordinatesY[2] * 100 + 10, 80, 80);
  image(shp, playerCoordinatesX[3] * 100 + 10, playerCoordinatesY[3] * 100 + 10, 80, 80);
  image(shp, playerCoordinatesX[4] * 100 + 10, playerCoordinatesY[4] * 100 + 10, 80, 80);
  //enemy ships are blurred out so the player can't see them, otherwise it would be cheating
  //image(enemyshp, enemyCoordinatesX[0] * 100 + 10, enemyCoordinatesY[0] * 100 + 10, 80, 80);
  //image(enemyshp, enemyCoordinatesX[1] * 100 + 10, enemyCoordinatesY[1] * 100 + 10, 80, 80);
  //image(enemyshp, enemyCoordinatesX[2] * 100 + 10, enemyCoordinatesY[2] * 100 + 10, 80, 80);
  //image(enemyshp, enemyCoordinatesX[3] * 100 + 10, enemyCoordinatesY[3] * 100 + 10, 80, 80);
  //image(enemyshp, enemyCoordinatesX[4] * 100 + 10, enemyCoordinatesY[4] * 100 + 10, 80, 80);


}


void draw() {
 
//helps restart the code, keeps thicker middle line seperating player and enemy
if(playerCount < 5 && enemyCount < 5){
 strokeWeight(6);
      rect(495, 0, 1, 498);
 }

}



void mousePressed(){
 
 
if(playerCount <= 4){   
 
  int x = floor(mouseX / 100);
  int y = floor(mouseY / 100); // converts (example: mouseY = 425.3728 to 4
  
  println(x, y); // shows the player their guesses

strokeWeight(1);

//the next like 400 lines of code are just a longer way of making the enemy AI guess on player ships

if(x == 5 && y == 0){
  if(enemyGuessX[0] == playerCoordinatesX[0] && enemyGuessY[0] == playerCoordinatesY[0] || enemyGuessX[0] == playerCoordinatesX[1] && enemyGuessY[0] == playerCoordinatesY[1] || enemyGuessX[0] == playerCoordinatesX[2] && enemyGuessY[0] == playerCoordinatesY[2] || enemyGuessX[0] == playerCoordinatesX[3] && enemyGuessY[0] == playerCoordinatesY[3] || enemyGuessX[0] == playerCoordinatesX[4] && enemyGuessY[0] == playerCoordinatesY[4]){
    fill(200, 0, 0);
    rect(enemyGuessX[0] * 100, enemyGuessY[0] * 100, 100, 100);
    image(enemyshp, enemyGuessX[0] * 100, enemyGuessY[0] * 100, 100, 100);
    enemyCount = enemyCount + 1;
  }else{
    fill(0, 0, 200);
    rect(enemyGuessX[0] * 100, enemyGuessY[0] * 100, 100, 100);
    
  }
}

if(x == 6 && y == 0){
  if(enemyGuessX[1] == playerCoordinatesX[0] && enemyGuessY[1] == playerCoordinatesY[0] || enemyGuessX[1] == playerCoordinatesX[1] && enemyGuessY[1] == playerCoordinatesY[1] || enemyGuessX[1] == playerCoordinatesX[2] && enemyGuessY[1] == playerCoordinatesY[2] || enemyGuessX[1] == playerCoordinatesX[3] && enemyGuessY[1] == playerCoordinatesY[3] || enemyGuessX[1] == playerCoordinatesX[4] && enemyGuessY[1]== playerCoordinatesY[4]){
    fill(200, 0, 0);
    rect(enemyGuessX[1] * 100, enemyGuessY[1] * 100, 100, 100);
    image(enemyshp, enemyGuessX[1] * 100, enemyGuessY[1] * 100, 100, 100);
    enemyCount = enemyCount + 1;
  }else{
    fill(0, 0, 200);
    rect(enemyGuessX[1] * 100, enemyGuessY[1] * 100, 100, 100);
    
  }
}

if(x == 7 && y == 0){
  if(enemyGuessX[2] == playerCoordinatesX[0] && enemyGuessY[2] == playerCoordinatesY[0] || enemyGuessX[2] == playerCoordinatesX[1] && enemyGuessY[2] == playerCoordinatesY[1] || enemyGuessX[2] == playerCoordinatesX[2] && enemyGuessY[2] == playerCoordinatesY[2] || enemyGuessX[2] == playerCoordinatesX[3] && enemyGuessY[2] == playerCoordinatesY[3] || enemyGuessX[2] == playerCoordinatesX[4] && enemyGuessY[2]== playerCoordinatesY[4]){
    fill(200, 0, 0);
    rect(enemyGuessX[2] * 100, enemyGuessY[2] * 100, 100, 100);
    image(enemyshp, enemyGuessX[2] * 100, enemyGuessY[2] * 100, 100, 100);
    enemyCount = enemyCount + 1;
  }else{
    fill(0, 0, 200);
    rect(enemyGuessX[2] * 100, enemyGuessY[2] * 100, 100, 100);
    
  }
}

if(x == 8 && y == 0){
  if(enemyGuessX[3] == playerCoordinatesX[0] && enemyGuessY[3] == playerCoordinatesY[0] || enemyGuessX[3] == playerCoordinatesX[1] && enemyGuessY[3] == playerCoordinatesY[1] || enemyGuessX[3] == playerCoordinatesX[2] && enemyGuessY[3] == playerCoordinatesY[2] || enemyGuessX[3] == playerCoordinatesX[3] && enemyGuessY[3] == playerCoordinatesY[3] || enemyGuessX[3] == playerCoordinatesX[4] && enemyGuessY[3]== playerCoordinatesY[4]){
    fill(200, 0, 0);
    rect(enemyGuessX[3] * 100, enemyGuessY[3] * 100, 100, 100);
    image(enemyshp, enemyGuessX[3] * 100, enemyGuessY[3] * 100, 100, 100);
    enemyCount = enemyCount + 1;
  }else{
    fill(0, 0, 200);
    rect(enemyGuessX[3] * 100, enemyGuessY[3] * 100, 100, 100);
    
  }
}

if(x == 9 && y == 0){
  if(enemyGuessX[4] == playerCoordinatesX[0] && enemyGuessY[4] == playerCoordinatesY[0] || enemyGuessX[4] == playerCoordinatesX[1] && enemyGuessY[4] == playerCoordinatesY[1] || enemyGuessX[4] == playerCoordinatesX[2] && enemyGuessY[4] == playerCoordinatesY[2] || enemyGuessX[4] == playerCoordinatesX[3] && enemyGuessY[4] == playerCoordinatesY[3] || enemyGuessX[4] == playerCoordinatesX[4] && enemyGuessY[4]== playerCoordinatesY[4]){
    fill(200, 0, 0);
    rect(enemyGuessX[4] * 100, enemyGuessY[4] * 100, 100, 100);
    image(enemyshp, enemyGuessX[4] * 100, enemyGuessY[4] * 100, 100, 100);
    enemyCount = enemyCount + 1;
  }else{
    fill(0, 0, 200);
    rect(enemyGuessX[4] * 100, enemyGuessY[4] * 100, 100, 100);
    
  }
}

if(x == 5 && y == 1){
  if(enemyGuessX[5] == playerCoordinatesX[0] && enemyGuessY[5] == playerCoordinatesY[0] || enemyGuessX[5] == playerCoordinatesX[1] && enemyGuessY[5] == playerCoordinatesY[1] || enemyGuessX[5] == playerCoordinatesX[2] && enemyGuessY[5] == playerCoordinatesY[2] || enemyGuessX[5] == playerCoordinatesX[3] && enemyGuessY[5] == playerCoordinatesY[3] || enemyGuessX[5] == playerCoordinatesX[4] && enemyGuessY[5]== playerCoordinatesY[4]){
    fill(200, 0, 0);
    rect(enemyGuessX[5] * 100, enemyGuessY[5] * 100, 100, 100);
    image(enemyshp, enemyGuessX[5] * 100, enemyGuessY[5] * 100, 100, 100);
    enemyCount = enemyCount + 1;
  }else{
    fill(0, 0, 200);
    rect(enemyGuessX[5] * 100, enemyGuessY[5] * 100, 100, 100);
    
  }
}

if(x == 6 && y == 1){
  if(enemyGuessX[6] == playerCoordinatesX[0] && enemyGuessY[6] == playerCoordinatesY[0] || enemyGuessX[6] == playerCoordinatesX[1] && enemyGuessY[6] == playerCoordinatesY[1] || enemyGuessX[6] == playerCoordinatesX[2] && enemyGuessY[6] == playerCoordinatesY[2] || enemyGuessX[6] == playerCoordinatesX[3] && enemyGuessY[6] == playerCoordinatesY[3] || enemyGuessX[6] == playerCoordinatesX[4] && enemyGuessY[6]== playerCoordinatesY[4]){
    fill(200, 0, 0);
    rect(enemyGuessX[6] * 100, enemyGuessY[6] * 100, 100, 100);
    image(enemyshp, enemyGuessX[6] * 100, enemyGuessY[6] * 100, 100, 100);
    enemyCount = enemyCount + 1;
  }else{
    fill(0, 0, 200);
    rect(enemyGuessX[6] * 100, enemyGuessY[6] * 100, 100, 100);
    
  }
}

if(x == 7 && y == 1){
  if(enemyGuessX[7] == playerCoordinatesX[0] && enemyGuessY[7] == playerCoordinatesY[0] || enemyGuessX[7] == playerCoordinatesX[1] && enemyGuessY[7] == playerCoordinatesY[1] || enemyGuessX[7] == playerCoordinatesX[2] && enemyGuessY[7] == playerCoordinatesY[2] || enemyGuessX[7] == playerCoordinatesX[3] && enemyGuessY[7] == playerCoordinatesY[3] || enemyGuessX[7] == playerCoordinatesX[4] && enemyGuessY[7]== playerCoordinatesY[4]){
    fill(200, 0, 0);
    rect(enemyGuessX[7] * 100, enemyGuessY[7] * 100, 100, 100);
    image(enemyshp, enemyGuessX[7] * 100, enemyGuessY[7] * 100, 100, 100);
    enemyCount = enemyCount + 1;
  }else{
    fill(0, 0, 200);
    rect(enemyGuessX[7] * 100, enemyGuessY[7] * 100, 100, 100);
    
  }
}

if(x == 8 && y == 1){
  if(enemyGuessX[8] == playerCoordinatesX[0] && enemyGuessY[8] == playerCoordinatesY[0] || enemyGuessX[8] == playerCoordinatesX[1] && enemyGuessY[8] == playerCoordinatesY[1] || enemyGuessX[8] == playerCoordinatesX[2] && enemyGuessY[8] == playerCoordinatesY[2] || enemyGuessX[8] == playerCoordinatesX[3] && enemyGuessY[8] == playerCoordinatesY[3] || enemyGuessX[8] == playerCoordinatesX[4] && enemyGuessY[8]== playerCoordinatesY[4]){
    fill(200, 0, 0);
    rect(enemyGuessX[8] * 100, enemyGuessY[8] * 100, 100, 100);
    image(enemyshp, enemyGuessX[8] * 100, enemyGuessY[8] * 100, 100, 100);
    enemyCount = enemyCount + 1;
  }else{
    fill(0, 0, 200);
    rect(enemyGuessX[8] * 100, enemyGuessY[8] * 100, 100, 100);
    
  }
}

if(x == 9 && y == 1){
  if(enemyGuessX[9] == playerCoordinatesX[0] && enemyGuessY[9] == playerCoordinatesY[0] || enemyGuessX[8] == playerCoordinatesX[1] && enemyGuessY[9] == playerCoordinatesY[1] || enemyGuessX[8] == playerCoordinatesX[2] && enemyGuessY[9] == playerCoordinatesY[2] || enemyGuessX[8] == playerCoordinatesX[3] && enemyGuessY[9] == playerCoordinatesY[3] || enemyGuessX[8] == playerCoordinatesX[4] && enemyGuessY[9]== playerCoordinatesY[4]){
    fill(200, 0, 0);
    rect(enemyGuessX[9] * 100, enemyGuessY[9] * 100, 100, 100);
    image(enemyshp, enemyGuessX[8] * 100, enemyGuessY[9] * 100, 100, 100);
    enemyCount = enemyCount + 1;
  }else{
    fill(0, 0, 200);
    rect(enemyGuessX[9] * 100, enemyGuessY[9] * 100, 100, 100);
    
  }
}

if(x == 5 && y == 2){
  if(enemyGuessX[10] == playerCoordinatesX[0] && enemyGuessY[10] == playerCoordinatesY[0] || enemyGuessX[10] == playerCoordinatesX[1] && enemyGuessY[10] == playerCoordinatesY[1] || enemyGuessX[10] == playerCoordinatesX[2] && enemyGuessY[10] == playerCoordinatesY[2] || enemyGuessX[10] == playerCoordinatesX[3] && enemyGuessY[10] == playerCoordinatesY[3] || enemyGuessX[10] == playerCoordinatesX[4] && enemyGuessY[10]== playerCoordinatesY[4]){
    fill(200, 0, 0);
    rect(enemyGuessX[10] * 100, enemyGuessY[10] * 100, 100, 100);
    image(enemyshp, enemyGuessX[10] * 100, enemyGuessY[10] * 100, 100, 100);
    enemyCount = enemyCount + 1;
  }else{
    fill(0, 0, 200);
    rect(enemyGuessX[10] * 100, enemyGuessY[10] * 100, 100, 100);
    
  }
}

if(x == 6 && y == 2){
  if(enemyGuessX[11] == playerCoordinatesX[0] && enemyGuessY[11] == playerCoordinatesY[0] || enemyGuessX[11] == playerCoordinatesX[1] && enemyGuessY[11] == playerCoordinatesY[1] || enemyGuessX[11] == playerCoordinatesX[2] && enemyGuessY[11] == playerCoordinatesY[2] || enemyGuessX[11] == playerCoordinatesX[3] && enemyGuessY[11] == playerCoordinatesY[3] || enemyGuessX[11] == playerCoordinatesX[4] && enemyGuessY[11]== playerCoordinatesY[4]){
    fill(200, 0, 0);
    rect(enemyGuessX[11] * 100, enemyGuessY[11] * 100, 100, 100);
    image(enemyshp, enemyGuessX[11] * 100, enemyGuessY[11] * 100, 100, 100);
    enemyCount = enemyCount + 1;
  }else{
    fill(0, 0, 200);
    rect(enemyGuessX[11] * 100, enemyGuessY[11] * 100, 100, 100);
    
  }
}

if(x == 7 && y == 2){
  if(enemyGuessX[12] == playerCoordinatesX[0] && enemyGuessY[12] == playerCoordinatesY[0] || enemyGuessX[12] == playerCoordinatesX[1] && enemyGuessY[12] == playerCoordinatesY[1] || enemyGuessX[12] == playerCoordinatesX[2] && enemyGuessY[12] == playerCoordinatesY[2] || enemyGuessX[12] == playerCoordinatesX[3] && enemyGuessY[12] == playerCoordinatesY[3] || enemyGuessX[12] == playerCoordinatesX[4] && enemyGuessY[12]== playerCoordinatesY[4]){
    fill(200, 0, 0);
    rect(enemyGuessX[12] * 100, enemyGuessY[12] * 100, 100, 100);
    image(enemyshp, enemyGuessX[12] * 100, enemyGuessY[12] * 100, 100, 100);
    enemyCount = enemyCount + 1;
  }else{
    fill(0, 0, 200);
    rect(enemyGuessX[12] * 100, enemyGuessY[12] * 100, 100, 100);
    
  }
}

if(x == 8 && y == 2){
  if(enemyGuessX[13] == playerCoordinatesX[0] && enemyGuessY[13] == playerCoordinatesY[0] || enemyGuessX[13] == playerCoordinatesX[1] && enemyGuessY[13] == playerCoordinatesY[1] || enemyGuessX[13] == playerCoordinatesX[2] && enemyGuessY[13] == playerCoordinatesY[2] || enemyGuessX[13] == playerCoordinatesX[3] && enemyGuessY[13] == playerCoordinatesY[3] || enemyGuessX[13] == playerCoordinatesX[4] && enemyGuessY[13]== playerCoordinatesY[4]){
    fill(200, 0, 0);
    rect(enemyGuessX[13] * 100, enemyGuessY[13] * 100, 100, 100);
    image(enemyshp, enemyGuessX[13] * 100, enemyGuessY[13] * 100, 100, 100);
    enemyCount = enemyCount + 1;
  }else{
    fill(0, 0, 200);
    rect(enemyGuessX[13] * 100, enemyGuessY[13] * 100, 100, 100);
    
  }
}

if(x == 9 && y == 2){
  if(enemyGuessX[14] == playerCoordinatesX[0] && enemyGuessY[14] == playerCoordinatesY[0] || enemyGuessX[14] == playerCoordinatesX[1] && enemyGuessY[14] == playerCoordinatesY[1] || enemyGuessX[14] == playerCoordinatesX[2] && enemyGuessY[14] == playerCoordinatesY[2] || enemyGuessX[14] == playerCoordinatesX[3] && enemyGuessY[14] == playerCoordinatesY[3] || enemyGuessX[14] == playerCoordinatesX[4] && enemyGuessY[14]== playerCoordinatesY[4]){
    fill(200, 0, 0);
    rect(enemyGuessX[14] * 100, enemyGuessY[14] * 100, 100, 100);
    image(enemyshp, enemyGuessX[14] * 100, enemyGuessY[14] * 100, 100, 100);
    enemyCount = enemyCount + 1;
  }else{
    fill(0, 0, 200);
    rect(enemyGuessX[14] * 100, enemyGuessY[14] * 100, 100, 100);
    
  }
}

if(x == 5 && y == 3){
  if(enemyGuessX[15] == playerCoordinatesX[0] && enemyGuessY[15] == playerCoordinatesY[0] || enemyGuessX[15] == playerCoordinatesX[1] && enemyGuessY[15] == playerCoordinatesY[1] || enemyGuessX[15] == playerCoordinatesX[2] && enemyGuessY[15] == playerCoordinatesY[2] || enemyGuessX[15] == playerCoordinatesX[3] && enemyGuessY[15] == playerCoordinatesY[3] || enemyGuessX[15] == playerCoordinatesX[4] && enemyGuessY[15]== playerCoordinatesY[4]){
    fill(200, 0, 0);
    rect(enemyGuessX[15] * 100, enemyGuessY[15] * 100, 100, 100);
    image(enemyshp, enemyGuessX[15] * 100, enemyGuessY[15] * 100, 100, 100);
    enemyCount = enemyCount + 1;
  }else{
    fill(0, 0, 200);
    rect(enemyGuessX[15] * 100, enemyGuessY[15] * 100, 100, 100);
    
  }
}

if(x == 6 && y == 3){
  if(enemyGuessX[16] == playerCoordinatesX[0] && enemyGuessY[16] == playerCoordinatesY[0] || enemyGuessX[15] == playerCoordinatesX[1] && enemyGuessY[16] == playerCoordinatesY[1] || enemyGuessX[15] == playerCoordinatesX[2] && enemyGuessY[16] == playerCoordinatesY[2] || enemyGuessX[15] == playerCoordinatesX[3] && enemyGuessY[16] == playerCoordinatesY[3] || enemyGuessX[15] == playerCoordinatesX[4] && enemyGuessY[16]== playerCoordinatesY[4]){
    fill(200, 0, 0);
    rect(enemyGuessX[16] * 100, enemyGuessY[16] * 100, 100, 100);
    image(enemyshp, enemyGuessX[16] * 100, enemyGuessY[16] * 100, 100, 100);
    enemyCount = enemyCount + 1;
  }else{
    fill(0, 0, 200);
    rect(enemyGuessX[16] * 100, enemyGuessY[16] * 100, 100, 100);
    
  }
}

if(x == 7 && y == 3){
  if(enemyGuessX[17] == playerCoordinatesX[0] && enemyGuessY[17] == playerCoordinatesY[0] || enemyGuessX[17] == playerCoordinatesX[1] && enemyGuessY[17] == playerCoordinatesY[1] || enemyGuessX[17] == playerCoordinatesX[2] && enemyGuessY[17] == playerCoordinatesY[2] || enemyGuessX[17] == playerCoordinatesX[3] && enemyGuessY[17] == playerCoordinatesY[3] || enemyGuessX[17] == playerCoordinatesX[4] && enemyGuessY[17]== playerCoordinatesY[4]){
    fill(200, 0, 0);
    rect(enemyGuessX[17] * 100, enemyGuessY[17] * 100, 100, 100);
    image(enemyshp, enemyGuessX[17] * 100, enemyGuessY[17] * 100, 100, 100);
    enemyCount = enemyCount + 1;
  }else{
    fill(0, 0, 200);
    rect(enemyGuessX[17] * 100, enemyGuessY[17] * 100, 100, 100);
    
  }
}

if(x == 8 && y == 3){
  if(enemyGuessX[18] == playerCoordinatesX[0] && enemyGuessY[18] == playerCoordinatesY[0] || enemyGuessX[18] == playerCoordinatesX[1] && enemyGuessY[18] == playerCoordinatesY[1] || enemyGuessX[18] == playerCoordinatesX[2] && enemyGuessY[18] == playerCoordinatesY[2] || enemyGuessX[18] == playerCoordinatesX[3] && enemyGuessY[18] == playerCoordinatesY[3] || enemyGuessX[18] == playerCoordinatesX[4] && enemyGuessY[18]== playerCoordinatesY[4]){
    fill(200, 0, 0);
    rect(enemyGuessX[18] * 100, enemyGuessY[18] * 100, 100, 100);
    image(enemyshp, enemyGuessX[18] * 100, enemyGuessY[18] * 100, 100, 100);
    enemyCount = enemyCount + 1;
  }else{
    fill(0, 0, 200);
    rect(enemyGuessX[18] * 100, enemyGuessY[18] * 100, 100, 100);
    
  }
}

if(x == 9 && y == 3){
  if(enemyGuessX[19] == playerCoordinatesX[0] && enemyGuessY[19] == playerCoordinatesY[0] || enemyGuessX[19] == playerCoordinatesX[1] && enemyGuessY[19] == playerCoordinatesY[1] || enemyGuessX[19] == playerCoordinatesX[2] && enemyGuessY[19] == playerCoordinatesY[2] || enemyGuessX[19] == playerCoordinatesX[3] && enemyGuessY[19] == playerCoordinatesY[3] || enemyGuessX[19] == playerCoordinatesX[4] && enemyGuessY[19]== playerCoordinatesY[4]){
    fill(200, 0, 0);
    rect(enemyGuessX[19] * 100, enemyGuessY[19] * 100, 100, 100);
    image(enemyshp, enemyGuessX[19] * 100, enemyGuessY[19] * 100, 100, 100);
    enemyCount = enemyCount + 1;
  }else{
    fill(0, 0, 200);
    rect(enemyGuessX[19] * 100, enemyGuessY[19] * 100, 100, 100);
    
  }
}

if(x == 5 && y == 4){
  if(enemyGuessX[20] == playerCoordinatesX[0] && enemyGuessY[20] == playerCoordinatesY[0] || enemyGuessX[20] == playerCoordinatesX[1] && enemyGuessY[20] == playerCoordinatesY[1] || enemyGuessX[20] == playerCoordinatesX[2] && enemyGuessY[20] == playerCoordinatesY[2] || enemyGuessX[20] == playerCoordinatesX[3] && enemyGuessY[20] == playerCoordinatesY[3] || enemyGuessX[20] == playerCoordinatesX[4] && enemyGuessY[20]== playerCoordinatesY[4]){
    fill(200, 0, 0);
    rect(enemyGuessX[20] * 100, enemyGuessY[20] * 100, 100, 100);
    image(enemyshp, enemyGuessX[20] * 100, enemyGuessY[20] * 100, 100, 100);
    enemyCount = enemyCount + 1;
  }else{
    fill(0, 0, 200);
    rect(enemyGuessX[20] * 100, enemyGuessY[20] * 100, 100, 100);
    
  }
}

if(x == 6 && y == 4){
  if(enemyGuessX[21] == playerCoordinatesX[0] && enemyGuessY[21] == playerCoordinatesY[0] || enemyGuessX[21] == playerCoordinatesX[1] && enemyGuessY[21] == playerCoordinatesY[1] || enemyGuessX[21] == playerCoordinatesX[2] && enemyGuessY[21] == playerCoordinatesY[2] || enemyGuessX[21] == playerCoordinatesX[3] && enemyGuessY[21] == playerCoordinatesY[3] || enemyGuessX[21] == playerCoordinatesX[4] && enemyGuessY[21]== playerCoordinatesY[4]){
    fill(200, 0, 0);
    rect(enemyGuessX[21] * 100, enemyGuessY[21] * 100, 100, 100);
    image(enemyshp, enemyGuessX[21] * 100, enemyGuessY[21] * 100, 100, 100);
    enemyCount = enemyCount + 1;
  }else{
    fill(0, 0, 200);
    rect(enemyGuessX[21] * 100, enemyGuessY[21] * 100, 100, 100);
    
  }
}

if(x == 7 && y == 4){
  if(enemyGuessX[22] == playerCoordinatesX[0] && enemyGuessY[22] == playerCoordinatesY[0] || enemyGuessX[22] == playerCoordinatesX[1] && enemyGuessY[22] == playerCoordinatesY[1] || enemyGuessX[22] == playerCoordinatesX[2] && enemyGuessY[22] == playerCoordinatesY[2] || enemyGuessX[22] == playerCoordinatesX[3] && enemyGuessY[22] == playerCoordinatesY[3] || enemyGuessX[22] == playerCoordinatesX[4] && enemyGuessY[22]== playerCoordinatesY[4]){
    fill(200, 0, 0);
    rect(enemyGuessX[22] * 100, enemyGuessY[22] * 100, 100, 100);
    image(enemyshp, enemyGuessX[22] * 100, enemyGuessY[22] * 100, 100, 100);
    enemyCount = enemyCount + 1;
  }else{
    fill(0, 0, 200);
    rect(enemyGuessX[22] * 100, enemyGuessY[22] * 100, 100, 100);
    
  }
}

if(x == 8 && y == 4){
  if(enemyGuessX[23] == playerCoordinatesX[0] && enemyGuessY[23] == playerCoordinatesY[0] || enemyGuessX[23] == playerCoordinatesX[1] && enemyGuessY[23] == playerCoordinatesY[1] || enemyGuessX[23] == playerCoordinatesX[2] && enemyGuessY[23] == playerCoordinatesY[2] || enemyGuessX[23] == playerCoordinatesX[3] && enemyGuessY[23] == playerCoordinatesY[3] || enemyGuessX[23] == playerCoordinatesX[4] && enemyGuessY[23]== playerCoordinatesY[4]){
    fill(200, 0, 0);
    rect(enemyGuessX[23] * 100, enemyGuessY[23] * 100, 100, 100);
    image(enemyshp, enemyGuessX[23] * 100, enemyGuessY[23] * 100, 100, 100);
    enemyCount = enemyCount + 1;
  }else{
    fill(0, 0, 200);
    rect(enemyGuessX[23] * 100, enemyGuessY[23] * 100, 100, 100);
    
  }
}

if(x == 9 && y == 4){
  if(enemyGuessX[24] == playerCoordinatesX[0] && enemyGuessY[24] == playerCoordinatesY[0] || enemyGuessX[24] == playerCoordinatesX[1] && enemyGuessY[24] == playerCoordinatesY[1] || enemyGuessX[24] == playerCoordinatesX[2] && enemyGuessY[24] == playerCoordinatesY[2] || enemyGuessX[24] == playerCoordinatesX[3] && enemyGuessY[24] == playerCoordinatesY[3] || enemyGuessX[24] == playerCoordinatesX[4] && enemyGuessY[24]== playerCoordinatesY[4]){
    fill(200, 0, 0);
    rect(enemyGuessX[24] * 100, enemyGuessY[24] * 100, 100, 100);
    image(enemyshp, enemyGuessX[24] * 100, enemyGuessY[24] * 100, 100, 100);
    enemyCount = enemyCount + 1;
  }else{
    fill(0, 0, 200);
    rect(enemyGuessX[24] * 100, enemyGuessY[24] * 100, 100, 100);
    
  }
}


// confirm statements for player guesses
if(playerCount <= 4 && enemyCount <= 4){
  if(x == enemyCoordinatesX[0] && y == enemyCoordinatesY[0]){
    fill(200, 0, 0);
    rect(enemyCoordinatesX[0] * 100, enemyCoordinatesY[0] * 100, 100, 100);
    image(enemyshp, enemyCoordinatesX[0] * 100, enemyCoordinatesY[0] * 100, 100, 100);
    playerCount = playerCount + 1;
     
 
}else if(x == enemyCoordinatesX[1] && y == enemyCoordinatesY[1]){
    fill(200, 0, 0);
    rect(enemyCoordinatesX[1] * 100, enemyCoordinatesY[1] * 100, 100, 100);
    image(enemyshp, enemyCoordinatesX[1] * 100, enemyCoordinatesY[1] * 100, 100, 100);
    playerCount = playerCount + 1;
  
    
 }else if(x == enemyCoordinatesX[2] && y == enemyCoordinatesY[2]){
    fill(200, 0, 0);
    rect(enemyCoordinatesX[2] * 100, enemyCoordinatesY[2] * 100, 100, 100);
    image(enemyshp, enemyCoordinatesX[2] * 100 , enemyCoordinatesY[2] * 100 , 100, 100);
    playerCount = playerCount + 1;
    
    
 }else if(x == enemyCoordinatesX[3] && y == enemyCoordinatesY[3]){
    fill(200, 0, 0);
    rect(enemyCoordinatesX[3] * 100, enemyCoordinatesY[3] * 100, 100, 100);
    image(enemyshp, enemyCoordinatesX[3] * 100, enemyCoordinatesY[3] * 100, 100, 100);
    playerCount = playerCount + 1;
   
    
 }else if(x == enemyCoordinatesX[4] && y == enemyCoordinatesY[4]){
    fill(200, 0, 0);
    rect(enemyCoordinatesX[4] * 100, enemyCoordinatesY[4] * 100, 100, 100);
    image(enemyshp, enemyCoordinatesX[4] * 100, enemyCoordinatesY[4] * 100, 100, 100);
    playerCount = playerCount + 1;
 
    
 }else if(mouseX > 0 && mouseX < 500 && mouseY > 0 && mouseY < 500){
   println("dont attack your own side of the board");
   println(" ");

//else, draw water
}else{
  fill(0, 0, 200);
  rect(floor(mouseX / 100) * 100, floor(mouseY / 100) * 100, 100, 100);
 
  }  
  
}

}
//win statements
if(playerCount == 5){
  fill(0, 0, 0);
  rect(0, 0, 1000, 600);
  fill(255);
  textSize(100);
  text("YOU WIN!", 265, 325);
  println("YOU WIN!");
  println(" ");
  fill(255, 255, 255);
  rect(300, 450, 400, 50);
  fill(0, 0, 0);
  textSize(30);
  text("RESTART", 440, 485);
  fill(255, 255, 255);
  rect(300, 520, 400, 50);
  fill(0, 0, 0);
  textSize(30);
  text("EXIT", 465, 555);
  //restart and exit button codes
    if(mouseX > 300 && mouseX < 700 && mouseY > 450 && mouseY < 500){
 setup();
 if(playerCount > -1){
   playerCount = playerCount + 1;
 }
 else if(enemyCount > -1){
   enemyCount = enemyCount + 1;
 }
 playerCount = (playerCount / playerCount) - 1;
 enemyCount = (enemyCount / enemyCount) - 1;
    }

  if(mouseX > 300 && mouseX < 700 && mouseY > 520 && mouseY < 570){
    exit();
  }
}

// codes for if enemy wins
if(enemyCount == 5){
  fill(0, 0, 0);
  rect(0, 0, 1000, 600);
  fill(255);
  textSize(100);
  text("YOU LOSE!", 265, 325);
  println("YOU LOSE!");
  println(" ");
  fill(255, 255, 255);
  rect(300, 450, 400, 50);
  textSize(30);
  fill(0, 0, 0);
  text("RESTART", 440, 485);
  fill(255, 255, 255);
  rect(300, 520, 400, 50);
  fill(0, 0, 0);
  textSize(30);
  text("EXIT", 465, 555);
  //restart and exit button codes
    if(mouseX > 300 && mouseX < 700 && mouseY > 450 && mouseY < 500){
 setup();
 if(playerCount > -1){
   playerCount = playerCount + 1;
 }
 else if(enemyCount > -1){
   enemyCount = enemyCount + 1;
 }
 playerCount = (playerCount / playerCount) - 1;
 enemyCount = (enemyCount / enemyCount) - 1;
    }

  if(mouseX > 300 && mouseX < 700 && mouseY > 520 && mouseY < 570){
    exit();
  }
}

}
