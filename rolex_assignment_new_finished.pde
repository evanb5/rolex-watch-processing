/*
 Description: Assignment 1
 Author: Evan Bai
 Date of last edit: Oct 27, 2019
 */

float seconds,minutes,hours;
float diameter;
int ax,by;
color backgroundColour = color(255,255,255);

void setup() {
  size(668, 987);
  int radius = min(200,200);
  seconds = radius * 0.72;
  minutes = radius * 0.60;
  hours = radius * 0.50;
  diameter = 300;
  ax = 320;
  by = 425;
}

void draw() {
  background(backgroundColour); 
  drawWatchBand();
  
  //watch dial
  stroke(155,159,154);
  strokeWeight(9);
  fill(3, 115, 72);
  
  //change dial colour every 15 seconds
  if (second() <15){
   fill(29,30,34);
  }
  else if (second() <30){
   fill(0,73,152);
  }
  else if (second() <45){
   fill(75,2,115);
  }
  else{
   fill (29,115,72);
  }
   
   ellipse(ax,by,diameter,diameter);
  
   //dial markers
   stroke(182,197,190);
   strokeWeight(2);
   fill(238,234,231);
   triangle(320,330,305,290,335,290);
   ellipse(385,315,20,20);
   ellipse(430,360,20,20);
   rect(185,420,30,10);
   rect(425,420,30,10);
   ellipse(430,490,20,20);
   ellipse(385,535,20,20);
   rect(315,530,10,30);
   ellipse(260,535,20,20);
   ellipse(215,490,20,20);
   ellipse(260,315,20,20);
   ellipse(210,360,20,20);
  
  //draw instructions
  if (backgroundColour==color(255)){ 
    fill(0);
  }
  else{
    fill(255);
  }
  textSize(25);
  text("Press any key to change background colour",40,40);
  
  //draw watch hands
  // Angles for sin() and cos() start at 3 o'clock;
  // subtract HALF_PI to make them start at the top
  float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
  float m = map(minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI) - HALF_PI; 
  float h = map(hour() + norm(minute(), 0, 60), 0, 24, 0, TWO_PI * 2) - HALF_PI;
  stroke(255);
  //seconds hand
  strokeWeight(1);
  line(ax, by, ax + cos(s) * seconds, by + sin(s) * seconds);
  
  //minutes hand
  strokeWeight(9);
  line(ax, by, ax + cos(m) * minutes, by + sin(m) * minutes);
  
  //hours hand
  strokeWeight(10);
  line(ax, by, ax + cos(h) * hours, by + sin(h) * hours);
  
  //draw small markers
  strokeWeight(2);
  beginShape(POINTS);
  for (int a = 0; a < 360; a+=6) {
    float angle = radians(a);
    float x = ax + cos(angle) * seconds;
    float y = by + sin(angle) * seconds;
    vertex(x, y);
   }
   endShape();
  
   //draw bezel
   //every 15 seconds colour changes
   strokeWeight(51);
   noFill();
   if (second() <15){
     stroke(29,29,29);
   }
   else if (second() <30){
     stroke(33,66,152);
   }
   else if (second() <45){
     stroke(40,14,97);
   }
   else{
     stroke (29,97,71);
   }
   ellipse(320,425,360,360);
   
   //draw bezel markers
   noStroke();
   fill(218,216,217);
   triangle(320,260,300,230,340,230);
   stroke(201,206,206);
   strokeWeight(2);
   fill(244,244,246);
   ellipse(320,240,21,21);
   strokeCap(PROJECT);
   strokeWeight(10);
   line(415,260,406,275);
   noStroke();
   rect(485,420,30,10);
   stroke(244,244,246);
   strokeCap(PROJECT);
   strokeWeight(10);
   line(416,590,405,570);
   line(225,592,238,572);
   line(230,260,240,275);
   noStroke();
   rect(125,420,30,10);
   
   //draw outer bezel
   stroke(241,240,246);
   strokeWeight(10);
   noFill();
   ellipse(320,425,410,415); 
}
  
void keyPressed(){
   backgroundColour = color(random(255),random(255),random(255));
}
  
void drawWatchBand(){
   //watch band top middle
   noStroke();
   fill(212,213,215);
   rect(271,90,92,60);
   fill(78,79,81);
   rect(271,104,92,60);
   fill(198,199,201);
   rect(271,108,92,60);
   fill(138,139,141);
   rect(271,117,92,60);
   fill(48,49,51);
   rect(271,121,92,60);
   fill(222,223,225);
   rect(271,128,92,60);
   fill(104,106,106);
   rect(271,170,92,60);
   fill(160,162,164);
   rect(271,175,92,60);
   fill(154,156,158);
   rect(271,177,92,60);
   fill(133,136,138);
   rect(271,180,92,60);
   fill(117,118,120);
   rect(271,182,92,60);
   fill(33,34,36);
   rect(271,185,92,60);
   fill(198,199,201);
   rect(271,190,92,60);
   
   //watch band top left 
   fill(170,171,173);
   quad(230,90,223,120,271,120,271,90);
   fill(201,202,204);
   rect(223,120,48,12);
   fill(216,217,219);
   quad(221,130,213,194,271,194,271,130);
   fill(104,106,108);
   quad(213,194,213,205,271,205,271,194);
   fill(212,213,215);
   quad(212,205,212,300,271,300,271,205);
   fill(199,203,206);
   quad(177,200,137,320,213,250,213,194);
  
   //watch band top right 
   fill(170,171,173);
   quad(363,90,363,120,411,120,402,90);
   fill(201,202,204);
   rect(363,120,48,10);
   fill(216,217,219);
   quad(363,130,363,194,420,194,412,130);
   fill(104,106,108);
   quad(363,194,363,205,420,205,420,194);
   fill(212,213,215);
   quad(363,205,363,300,420,300,420,205);
   fill(199,203,206);
   quad(420,194,420,250,496,320,458,200);
   
   //watch band bottom left 
   fill(216,217,219);
   quad(248,899,248,901,280,901,280,899);
   fill(207,211,214);
   quad(123,500,182,680,280,690,281,500);
   fill(154,155,157);
   quad(237,860,248,899,280,899,280,860);
   fill(208,209,211);
   quad(236,855,237,860,280,860,280,855);
   fill(0);
   quad(236,850,236,855,280,855,280,850);
   fill(211,212,214);
   quad(227,779,236,850,280,850,280,779);
   fill(124,125,127);
   quad(227,772,227,779,280,779,280,772);
   fill(0);
   quad(227,765,227,772,280,772,280,765);
   fill(220,221,223);
   quad(218,680,227,765,280,765,280,680);
   fill(216,217,219);
   rect(218,600,58,85);
   fill(0);
   quad(218,678,218,682,280,682,280,678);
   fill(94,95,97);
   quad(218,673,218,678,280,678,280,673);
   fill(0);
   quad(218,670,218,673,280,673,280,670);
   
    //watch band bottom right
   fill(207,211,214);
   quad(410,526,427,683,463,678,508,526);
   fill(208,209,211);
   quad(365,899,365,901,397,901,397,899);
   fill(154,155,157);
   quad(365,862,365,899,397,899,406,862);
   fill(208,209,211);
   quad(368,857,368,862,406,862,408,857);
   fill(0);
   quad(368,852,368,857,408,857,408,852);
   fill(211,212,214);
   quad(368,781,368,852,408,852,418,781);
   fill(124,125,127);
   quad(368,774,368,781,418,781,418,774);
   fill(0);
   quad(368,767,368,774,418,774,418,767);
   fill(220,221,223);
   quad(368,682,368,767,418,767,427,682);
   fill(0);
   quad(368,678,368,682,427,682,427,678);
   fill(94,95,97);
   quad(368,673,368,678,427,678,427,673);
   fill(0);
   quad(368,670,368,673,427,673,427,670);
   fill(216,217,219);
   quad(368,500,368,670,427,670,427,500);
   
   //watch band bottom middle
   fill(168,169,171);
   rect(279,828,86,72);
   fill(185,186,188);
   rect(276,804,92,72);
   fill(134,135,137);
   rect(276,734,92,72);
   fill(0);
   rect(276,727,92,72);
   fill(72,73,75);
   rect(276,722,92,72);
   fill(0);
   rect(276,720,92,72);
   fill(210,211,213);
   rect(276,715,92,72);
   fill(199,200,202);
   rect(276,658,92,60);
   fill(130,131,133);
   rect(276,653,92,60);
   fill(0);
   rect(276,648,92,60);
   fill(78,79,81);
   rect(276,643,92,60);
   fill(0);
   rect(276,637,92,60);
   fill(212,213,215);
   rect(276,630,92,60);
}
