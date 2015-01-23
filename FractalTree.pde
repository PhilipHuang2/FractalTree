public double fractionLength = .8; 
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

