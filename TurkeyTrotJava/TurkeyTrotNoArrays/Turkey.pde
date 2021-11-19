public class Turkey {
int x=0;
int y=0;
int size = 100;
int minSpeed = 1;
int maxSpeed = 5;

PImage turkey = loadImage("turkey.png");


public Turkey(int x, int y) {
  this.x = x;
  this.y = y;
  turkey.resize(size,size);
}

public void draw() {
  image (turkey, x, y);
}

public void move() {
  x+=random(minSpeed,maxSpeed);
}

}
