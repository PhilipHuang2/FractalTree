public double fractionLength = .4; 
public int smallestBranch = 10; 
public double branchAngle = .2;  
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
        fill(102,0,19);
        text("7",119,25);
        text("1",119,58);
        text("8",349,25);
        text("2",349,58);
        text("9",579,25);
        text("3",579,58);
} 

public void keyPressed()
{
  
  if(key == '7' && fractionLength <.8)
    fractionLength += .05;
  if(key == '1' && fractionLength > 0)
    fractionLength -= .05;
  if(key == '8' && smallestBranch  < 81)
    smallestBranch +=1;
  if(key == '2' && smallestBranch > 4)
    smallestBranch -=1;
  if(key == '9' )
    branchAngle +=0.1;
  if(key == '3')
    branchAngle +=-0.1; 
    redraw();
}


public void drawBranches(int x,int y, double branchLength, double angle) 
{   
	double angle1, angle2;
	int endX1, endY1, endX2, endY2;
	// math Stuff
 	angle1 = angle + branchAngle;
	angle2 = angle - branchAngle;
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

