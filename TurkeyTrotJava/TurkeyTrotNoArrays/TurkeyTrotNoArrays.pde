PImage farmyard;
int laneWidth;
boolean gameOver = false;


// Set the numberOfTurkeys variable to how many turkeys will race (2-8)
int numberOfTurkeys;

// Declare a Turkey variable for each of the turkeys who will race. 
// For example:  Turkey gobbler;


void setup() {
  // This sets the size of the text used for the lane labels.
  textSize(20);

  // Set the size of the race course (make the width bigger for a longer race).


  // Load a picture into the farmyard to be used as the race background (grass.jpg has been provided for you),


  // Resize the farmyard so it will fill the sketch


  // Set the width of each racing lane in the laneWidth variable. All turkeys use the same lane width.
  // (NOTE: you need to know how many turkeys are racing to calculate this) 


  // Create the turkeys here. You will need to create a new turkey for each race participant.
  // Example:     gobbler = new Turkey(0, yValue);
  // NOTE: Each turkey will need a unique y value to place it in a different racing lane
}


void draw() {

  if (!gameOver) {
    // Draw the background (farmyard)
    if ( farmyard != null ) {
      background(farmyard);
    }

    drawLaneMarkers();   // This method draws the lines between each racing lane
    drawTurkeys();       // This method draws each turkey
    moveTurkeys();       // This method moves the turkeys during the race 
    checkForWinner();    // This method checks to see if any of the turkeys have crossed the finishing line

    // See if you can figure out how to change the speed of the turkeys by changing the Turkey class. 

    // Option: Draw the turkeys so they fill the racing lanes (fewer turkeys mean bigger size)
  }

  // This code only runs when the game is over
  // You do not have to change this code unless you want to
  if (gameOver) {
    fill(0);
    textSize(50);
    text("RACE OVER", width/4, height/2);

    confetti();
  }
}

void drawTurkeys() {
  // Put code in here to tell each turkey to draw itself
}
void moveTurkeys() {
  // Put code in here to tell each turkey to move itself
}

void checkForWinner() {
  //  Put code in here to check each turkey's x location to see if it crossed the finish line
  //  If a turkey has crossed the line, set gameOver = true; 
  //  Also write the text "WINNER" in the winning turkey's race lane, so you can see who won.
  //  NOTE: There might be a tie!
} 
void drawLaneMarkers() {
  // The following code draws the lanes and lane numbers
  // You do not have to change this code unless you want to
  fill(0);
  for (int i = 1; i <= numberOfTurkeys; i++ ) {
    rect(0, laneWidth*i, width, 2);
    textSize(30);
    text("" + i, width - 50, (laneWidth * i) - 30);
  }
}

color[] savedPixels;

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

void confetti() {
  if ( savedPixels == null ) {
    savedPixels = new color[width * height];

    loadPixels();
    for (int i = 0; i < savedPixels.length; i++) {
      savedPixels[i] = pixels[i];
    }
  }

  for (int i = 0; i < savedPixels.length; i++) {
    pixels[i] = savedPixels[i];
  }
  updatePixels();

  drawConfetti();
}
