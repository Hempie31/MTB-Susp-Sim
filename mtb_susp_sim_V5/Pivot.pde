class pivot{
  float x;
  float y;
  int col;
  int size;
  boolean fixed;
  
  pivot(float X, float Y, int colour, int s, boolean fix){
    this.x = X;
    this.y = Y;
    this.col = colour;
    this.size = s;
    this.fixed = fix;  
  }
  
  void drawPivot(){
    fill(col);
    ellipse(x, y, size, size);
  }
}
