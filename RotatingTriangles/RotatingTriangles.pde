/*
 Wailinn Saw
 8-10-2019
 This sketch creates 90 triangles and have them all spin around a center point of the screen.
 Note for more interactiveness, try implemnting the mouse to add triangles as it moves around the screen*/

float degrees;
float numOfTri;

void drawTri(float size)
{

  /*  
   draws an equilateral triangle of given 
   length around the center of the triangle
   used vertices of the equilateral triangle to get the following points.
   */

  triangle(0, -size, //top point
    -size * sqrt(3)/2, size/2, //bottom left point
    size * sqrt(3)/2, size/2); //bottom right point
}

void setup()
{
  size(640, 640);
  degrees = 0;
  numOfTri = 90;
  noFill(); //if not used, you will see the stacked trangles instead.
  colorMode(HSB); //Hue Saturation Brightness instead of RGB
}

void draw()
{

  degrees %= 360;
  background(0);

  //point at which everything will spin around. 
  translate(width/2, height/2);

  //loops through each tirangle.
  for (int i = 0; i < numOfTri; i ++)
  {
    //rotating 90 degrees around the center 
    rotate(radians(360/numOfTri)); 

    pushMatrix(); //saves current coordinate system  so that the following changes will not affect the rest of the sketch.

    //moves the screen by 100 for each tirangle.
    translate(100, 0); 

    //gets rid of the gap in the right hand side by making the degrees add up to 360.
    float offset =  360/numOfTri; 

    //rotates triangle, offsets each triangles by a little bit behind the one before.
    //

    //magic happens when you change the fancyNumber.
    float fancyNumber = 1;
    rotate(radians(degrees +  fancyNumber * i * offset)); 

    //for each triangle, the stroke will have a hue from 0 - 90(num of triangles) and a saturation and brightness to max 255.
    stroke(3 * i, 255, 255); 

    //Draws a triangle of size 75
    drawTri(75);

    popMatrix(); //restores the corrdinate sytem.
  }
  degrees++;
}
