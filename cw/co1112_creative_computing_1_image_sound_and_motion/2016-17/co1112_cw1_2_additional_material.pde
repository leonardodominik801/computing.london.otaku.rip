// L-System to generate the quadratic Koch island
//
// This code is a modified version of that shown in Figure 6.4 (p.134)
// of Volume 2 of the Creative Computing 1 subject guide. In this
// modified version we build up the fractal outline between the calls 
// to beginShape() and endShape() in the draw() function. This allows
// us to fill the resulting shape with a fill colour.

float d = 256;                 // turtle line length
float x = 256+128, y = 128;    // current position of turtle
float dir = HALF_PI;           // current direction of turtle
String state="F-F-F-F";        // initial state
String ruleF="F-F+F+FF-F-F+F"; // substitution rule
float ang = HALF_PI;           // angle of rotation for each + and - symbol
float sf = 4;                  // scaling factor applied each time substitute called
int L = 1;                     // number of times to substitute

void setup() {
  size(512,512);
  background(225,225,25);
  noStroke();
  noLoop();
  // Perform L rounds of substitutions on the initial state
  for (int k=0; k < L; k++) {
    state = substitute(state, ruleF);
    d /= sf; // reduce turtle line length each time we increase level of detail
  }
  // The variable "state" now contains the final state of the L-system,
  // which will be drawn to the display window in the draw() method.
}

void draw() {
  // Define the fill colour for the fractal
  fill(50,50,200);
  // Create the outline shape of the fractal
  beginShape();
  for (int i=0; i < state.length(); i++)
    turtle(state.charAt(i)); // adds a vertex for each corner of the fractal
  endShape(); // the shape gets drawn and filled when endShape() is called
}

// Turtle command definitions for each character in our alphabet
// Each time the turtle position is moved, create a new vertex
void turtle(char c) {
  switch(c) {
  case 'F':
    x += d*cos(dir);
    y += d*sin(dir);
    vertex(x,y);
    break;
  case '-':
    dir += ang;
    break;
  case '+':
    dir -= ang;
    break;
  }
}

// Apply substitution rule r to string s and return the resulting string
String substitute(String s, String r) {
  String s2 = new String();
  for (int j=0; j < s.length(); j++) {  
    if (s.charAt(j)=='F')
      s2 += r;
    else
      s2 += s.charAt(j);
  }
  return s2;
}