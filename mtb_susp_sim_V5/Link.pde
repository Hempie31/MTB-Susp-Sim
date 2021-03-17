class link{
  float x1;
  float y1;
  float x2;
  float y2;
  int col;
  
  link(float X1, float Y1, float X2, float Y2, int colour){
    this.x1 = X1;
    this.y1 = Y1;
    this.x2 = X2;
    this.y2 = Y2;  
    this.col = colour;
  }
  
  void drawLink(){
    stroke(col);
    strokeWeight(3);
    line(this.x1, this.y1, this.x2, this.y2);
    noStroke();
  }
  
  float getLength(){
    float L = sqrt(pow(this.x2-this.x1,2) + pow(this.y2- this.y1,2));
    return L;
  }
}
