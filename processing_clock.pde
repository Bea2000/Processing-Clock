int posx, posy;
float rs;
float rm;
float rh;
float reloj;
int radio;
int num = 1;
int pos = 1;

void setup() {
  size(700, 700);
  stroke(255);
  radio = 350;
  rs = 280;
  rm = 240;
  rh = 160;
  reloj = radio * 1.8;
  
  posx = width / 2;
  posy = height / 2;
}

void draw() {
  num = 1;
  background(255,255,255);
  
  // Draw the clock background
  fill(0);
  noStroke();
  ellipse(posx, posy, reloj, reloj);
  
  // Angles for sin() and cos() start at 3 o'clock;
  // subtract HALF_PI to make them start at the top
  float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
  float m = map(minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI) - HALF_PI; 
  float h = map(hour() + norm(minute(), 0, 60), 0, 24, 0, TWO_PI * 2) - HALF_PI;
  
  // Draw the hands of the clock
  stroke(255);
  strokeWeight(1);
  line(posx, posy, posx + cos(s) * rs, posy + sin(s) * rs);
  strokeWeight(2);
  line(posx, posy, posx + cos(m) * rm, posy + sin(m) * rm);
  strokeWeight(4);
  line(posx, posy, posx + cos(h) * rh, posy + sin(h) * rh);
  
  // Draw the minute ticks
  while (num < 12) {
    for (int a = 275; a < 635; a+=6) {
      float angle = radians(a);
      float x = posx + cos(angle) * rs;
      float y = posy + sin(angle) * rs;
      fill(255,255,255);
      if (pos%5==0){
        text(num, x, y);
        num += 1;
      }
      pos += 1;
    }
  }
}
