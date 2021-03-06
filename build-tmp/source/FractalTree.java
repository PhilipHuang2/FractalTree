import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class FractalTree extends PApplet {

public double fractionLength = .8f; 
public int smallestBranch = 10; 
public double branchAngle = .2f;  
public void setup() 
{ 
	size(640,480);    
	noLoop(); 
} 
public void draw() 
{   
	background(0);   
	stroke(0,255,0);   
	line(320,480,320,380);   
	drawBranches(320,380,100,3*Math.PI/2);  //will add later
	textSize(12);
	stroke(255,0,0);
	fill(255,0,0);
	text("fractionLength", 20, 42);
	text("smallestBranch", 250,42);
	text("branchAngle",480,42);
	textSize(10);
	fill(255,255,255);
	text((float)(fractionLength),105, 42);
	text((float)(smallestBranch),335, 42);
	text((float)(branchAngle),565, 42);
	noStroke();
	fill(23,248,255);
	triangle(110, 30, 135, 30, 122, 5);
	triangle(110, 45, 135, 45, 122, 70);
	triangle(340, 30, 365, 30, 352, 5);
	triangle(340, 45, 365, 45, 352, 70);
	triangle(570, 30, 595, 30, 582, 5);
	triangle(570, 45, 595, 45, 582, 70);
} 
public void drawBranches(int x,int y, double branchLength, double angle) 
{   
	double angle1, angle2;
	int endX1, endY1, endX2, endY2;
	// math Stuff
 	angle1 = angle + branchLength;
	angle2 = angle - branchLength;
    branchLength = fractionLength* branchLength;
 	endX1 = (int)(branchLength*Math.cos(angle1) + x);
 	endY1 = (int)(branchLength*Math.sin(angle1) + y);
 	endX2 = (int)(branchLength*Math.cos(angle2) + x);
 	endY2 = (int)(branchLength*Math.sin(angle2) + y);
    //Actual Drawing
    line(x,y,endX1,endY1);
    line(x,y,endX2,endY2);

    if(branchLength >= smallestBranch)
    {
    	drawBranches(endX1,endY1,branchLength,angle1);
     	drawBranches(endX2,endY2,branchLength,angle2);
    }
} 

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "FractalTree" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
