PImage farmyard;

boolean gameOver = false;

 // Declare and initialize a variable (numberOfTurkeys) to store how many turkeys are in the race (2-8)
 int nt = 8;
 // Declare an array (turkeys) that is big enough to hold all the turkeys 
 Turkey[] turkeys = new Turkey[nt];

void setup() {
  // This sets the size of the text used for the lane labels.
  textSize(20);
  
  // Set the size of the race course (make the width bigger for a longer race).
  size(800,600);
 
  // Use the loadImage method to ;oad a picture into the farmyard to be used as
  // the race background (grass.jpg has been provided for you)
  farmyard = loadImage("grass.jpg");

  // Resize the farmyard so it will fill the sketch
  farmyard.resize(width, height);
 
  // Create the turkeys and put them in the array. 
  // Example:     turkeys[0] = new Turkey(0, y-value);
  // NOTE: Each turkey will need a unique y value to place it in a different racing lane
  for( int i = 0; i < turkeys.length; i++ ){
    turkeys[i] = new Turkey(0, 100 + (50*i), "dinnerRolls.png");
  }
}

void draw() {
  // Draw the background (farmyard)
  background(farmyard);
  
  if (!gameOver) {
 
    drawLaneMarkers();   // This method draws the lines between each racing lane
    drawTurkeys();       // This method draws each turkey
    moveTurkeys();       // This method moves the turkeys during the race 
    checkForWinner();    // This method checks to see if any of the turkeys have crossed the finishing line

    // See if you can figure out how to change the speed of the turkeys by changing the Turkey class. 

    // Option: Draw the turkeys so they fill the racing lanes (fewer turkeys mean bigger size)

  }

  // This code only runs when the game is over
  // You do not have to change this code unless you want to
  if( gameOver ) {
    textSize(50);
    text ("RACE OVER", width/4, height/2);
    drawConfetti();
  }
}

void drawTurkeys() {
  //  Put code in here to tell each turkey to draw itself
  for( Turkey t : turkeys ){
    t.draw(); 
  }
}
void moveTurkeys() {
  //  Put code in here to tell each turkey to move itself
  for( Turkey t : turkeys ){
    t.move(); 
  }
}

void checkForWinner() {
  //  Put code in here to check each turkey's x location to see if it crossed the finish line
  //  If a turkey has crossed the line, set     gameOver = true; 
  //  Also write the text "WINNER" in the winning turkey's race lane, so you can see who won.
  //  NOTE: There might be a tie!
  for(Turkey t : turkeys){
    if( t.x > width - 50){
      gameOver = true;
      break;
    }
  }
}

void drawLaneMarkers() {
   // Put code here to draw lines to show the lanes of the racing course
   // Add text in each lane to show which turkey # is racing in it
}

class Confetti {
  int x;
  int y;

  public Confetti(int x, int y) {
    this.x = x;
    this.y = y;
  }
}

ArrayList<Confetti> confettis = new ArrayList<Confetti>(500);

public void drawConfetti() {
  // Add 3 new confettis
  for (int i = 0; i < 3; i++) {
    confettis.add( new Confetti( int(random(width)), int(random(height) ) ) );
  }

  // Draw the confettis. Loop backwards as quick way to remove in loop.
  for (int i = confettis.size() - 1; i >= 0; i--) {
    Confetti eachConfetti = confettis.get(i);

    // Draw a single confetti
    noStroke();
    fill(random(255), random(150), random(50));
    ellipse(eachConfetti.x, eachConfetti.y, 8, 8);

    // Move confetti down the screen
    eachConfetti.y += 2;

    // Remove confettis that go below the bottom of the screen
    if (eachConfetti.y > height) {
      confettis.remove(i);
    }
  }
}
