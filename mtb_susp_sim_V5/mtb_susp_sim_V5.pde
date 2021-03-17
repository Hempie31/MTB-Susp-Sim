import g4p_controls.*;

int yChange = 0;
boolean simulate = false;
int timeFalse = 0;
int delay = 50;

boolean wheelAxleButtonPressed = false;
boolean seatStayButtonPressed = false;
boolean SMUbuttonClicked = false;

//create the pivots (initial values)
//pivot chainstayPivot = new pivot(600, 500, color(255, 100, 0), 10, false);
//pivot wheelAxle = new pivot(183.45, 561.21, color(255, 100, 0), 10, false);
//pivot seatstayPivot = new pivot(531.64, 335.44, color(255, 100, 0), 10, false);
//pivot linkPivot = new pivot(615.9, 351.34, color(255, 100, 0), 10, false);
//pivot shockmountUpper = new pivot(668.37, 313.98, color(255, 100, 0), 10, false);
//pivot shockmountLower = new pivot(642.93, 496.82, color(255, 100, 0), 10, false);


//create pivots
pivot chainstayPivot = new pivot(600+100, 500-50, color(255, 100, 0), 10, false);
pivot wheelAxle = new pivot(183.45+100, 561.21-50, color(255, 100, 0), 10, false);
pivot seatstayPivot = new pivot(490+100, 335.44-50, color(255, 100, 0), 10, false);
pivot linkPivot = new pivot(615.9+100, 351.34-50, color(255, 100, 0), 10, false);
pivot shockmountUpper = new pivot(675.37+100, 290-50, color(255, 100, 0), 10, false);
pivot shockmountLower = new pivot(642.93+100, 498-50, color(255, 100, 0), 10, false);


//Setup the links
link chainstay = new link(chainstayPivot.x,  chainstayPivot.y,  wheelAxle.x,       wheelAxle.y,  color(50, 200, 0));
link seatstay = new link( wheelAxle.x,       wheelAxle.y,       seatstayPivot.x,   seatstayPivot.y, color(50, 200, 0));
link LSS = new link(      seatstayPivot.x,   seatstayPivot.y,   linkPivot.x,       linkPivot.y, color(50, 200, 0));
link LSM = new link(      linkPivot.x,       linkPivot.y,       shockmountUpper.x, shockmountUpper.y, color(50, 200, 0));
link SSSM = new link(     seatstayPivot.x,   seatstayPivot.y,   shockmountUpper.x, shockmountUpper.y, color(50, 200, 0));
link shock = new link(    shockmountUpper.x, shockmountUpper.y, shockmountLower.x, shockmountLower.y, color(50, 200, 0));

float shocklengthInit = shock.getLength();

float wheelAxleOrigX = wheelAxle.x;
float wheelAxleOrigY = wheelAxle.y;

float seatstayPivotOrigX = seatstayPivot.x;
float seatstayPivotOrigY = seatstayPivot.y;

//calculate angles between link pivot and seatstay as well as between the link pivot and shock mount upper
//these values will be important later on
float AA_LSS = asin( abs(linkPivot.y - seatstayPivot.y) / LSS.getLength());
float AA_LSM = asin( abs(shockmountUpper.y - linkPivot.y) / LSM.getLength());


int partial = 0;

void setup(){
  size(900, 900);
  createGUI();
  
  updateVisuals();
  
  chainstay.drawLink();
  seatstay.drawLink();
  LSS.drawLink();
  LSM.drawLink();
  SSSM.drawLink();
  shock.drawLink();
  
  chainstayPivot.drawPivot();
  wheelAxle.drawPivot();
  seatstayPivot.drawPivot();
  linkPivot.drawPivot();
  shockmountUpper.drawPivot();
  shockmountLower.drawPivot();
  
  
}

boolean cycle = true;


  void draw(){
  
  if (simulate == true){
    runSimulation();
    if(timeFalse != 0){
      timeFalse = 0;
    }
  }
  else{  
    background(200);
    updateVisuals();
    
    if (timeFalse == 0){
      println("INSIDE");
      
      wheelAxle.x = 183.45+100;
      wheelAxle.y = 561.21-50;
      seatstayPivot.x = 490+100;
      seatstayPivot.y = 335.44-50;
      shockmountUpper.x = 675+100;
      shockmountUpper.y = 290.98-50;
      
    }
      yChange = 0;
      
      
      
      
      
      
      link chainstay = new link(chainstayPivot.x,  chainstayPivot.y,  wheelAxle.x,       wheelAxle.y,  color(50, 200, 0));
      link seatstay = new link( wheelAxle.x,       wheelAxle.y,       seatstayPivot.x,   seatstayPivot.y, color(50, 200, 0));
      link LSS = new link(      seatstayPivot.x,   seatstayPivot.y,   linkPivot.x,       linkPivot.y, color(50, 200, 0));
      link LSM = new link(      linkPivot.x,       linkPivot.y,       shockmountUpper.x, shockmountUpper.y, color(50, 200, 0));
      link SSSM = new link(     seatstayPivot.x,   seatstayPivot.y,   shockmountUpper.x, shockmountUpper.y, color(50, 200, 0));
      link shock = new link(    shockmountUpper.x, shockmountUpper.y, shockmountLower.x, shockmountLower.y, color(50, 200, 0));


      
    
      chainstay.drawLink();
      seatstay.drawLink();
      LSS.drawLink();
      LSM.drawLink();
      SSSM.drawLink();
      shock.drawLink();
      
      chainstayPivot.drawPivot();
      wheelAxle.drawPivot();
      seatstayPivot.drawPivot();
      linkPivot.drawPivot();
      shockmountUpper.drawPivot();
      shockmountLower.drawPivot();
      
      timeFalse++;
    
    }
  
  }

void runSimulation(){

    background(200);
    
    updateVisuals();
            
    //wheelAxle.x = xChange;
    if(cycle == true){
      wheelAxle.y = wheelAxle.y - 1;
    }
    else{
      wheelAxle.y = wheelAxle.y +1;
    }
    
    //calculate the x value of the wheel axle based on the movement in y
    float xChange = chainstayPivot.x - sqrt(abs((pow(chainstay.getLength(),2)) - pow(((wheelAxle.y)-chainstayPivot.y),2))) ;
    wheelAxle.x = xChange;
    
    
    
    //float testVariable = sqrt(pow(seatstayPivot.x-wheelAxle.x,2) + pow(seatstayPivot.y-wheelAxle.y,2));
    
    
    float dWALP = sqrt(pow((linkPivot.x - wheelAxle.x),2) + pow((linkPivot.y - wheelAxle.y),2));
    
    float delta = sqrt((dWALP + seatstay.getLength() + LSS.getLength())*(dWALP + seatstay.getLength() - LSS.getLength())*(dWALP - seatstay.getLength() + LSS.getLength())*((-1*dWALP) + seatstay.getLength() + LSS.getLength()))/4;
    
    
    
    float xWALP = ((wheelAxle.x+linkPivot.x)/2) + (((linkPivot.x - wheelAxle.x)*(pow(seatstay.getLength(),2) - pow(LSS.getLength(),2)))/(2*pow(dWALP,2))) + 2*((wheelAxle.y - linkPivot.y)/(pow(dWALP, 2)))*delta;
    float yWALP = ((wheelAxle.y+linkPivot.y)/2) + (((linkPivot.y - wheelAxle.y)*(pow(seatstay.getLength(),2) - pow(LSS.getLength(),2)))/(2*pow(dWALP,2))) - 2*((wheelAxle.x - linkPivot.x)/(pow(dWALP, 2)))*delta;
    
    float xWALPprime = ((wheelAxle.x+linkPivot.x)/2) + (((linkPivot.x - wheelAxle.x)*(pow(seatstay.getLength(),2) - pow(LSS.getLength(),2)))/(2*pow(dWALP,2))) - 2*((wheelAxle.y - linkPivot.y)/(pow(dWALP, 2)))*delta;
    float yWALPprime = ((wheelAxle.y+linkPivot.y)/2) + (((linkPivot.y - wheelAxle.y)*(pow(seatstay.getLength(),2) - pow(LSS.getLength(),2)))/(2*pow(dWALP,2))) + 2*((wheelAxle.x - linkPivot.x)/(pow(dWALP, 2)))*delta;
    
    println(seatstay.getLength());
    
    if(yWALP < yWALPprime){
      seatstayPivot.y = yWALP;
      seatstayPivot.x = xWALP;
    }
    else{
      seatstayPivot.y = yWALPprime;
      seatstayPivot.x = xWALPprime;
    }
   
    println(seatstay.getLength());
     
    float CurrentAA_LSS = asin( abs(linkPivot.y - seatstayPivot.y) / LSS.getLength());
    
    float difference = CurrentAA_LSS - AA_LSS ;
    float CurrentAA_LSM = AA_LSM - difference;
    
    
    shockmountUpper.x = linkPivot.x + LSM.getLength()*cos(CurrentAA_LSM);
    shockmountUpper.y = linkPivot.y - LSM.getLength()*sin(CurrentAA_LSM);
     
     float col1;
     float col2;
     float compression = shocklengthInit - sqrt(pow(shockmountLower.x-shockmountUpper.x,2) + pow(shockmountLower.y-shockmountUpper.y,2));
     
     //println(compression);
     
     if(compression < 22){
       col1 = compression*9;
       col2 = 0;
     }
     else{
       col1 = 22*9;
       col2 = (compression - 22)*9;
     }
     
    
    //update the links
    link chainstay = new link(chainstayPivot.x,  chainstayPivot.y,  wheelAxle.x,       wheelAxle.y,  color(50, 200, 0));
    link seatstay = new link( wheelAxle.x,       wheelAxle.y,       seatstayPivot.x,   seatstayPivot.y, color(50, 200, 0));
    link LSS = new link(      seatstayPivot.x,   seatstayPivot.y,   linkPivot.x,       linkPivot.y, color(50, 200, 0));
    link LSM = new link(      linkPivot.x,       linkPivot.y,       shockmountUpper.x, shockmountUpper.y, color(50, 200, 0));
    link SSSM = new link(     seatstayPivot.x,   seatstayPivot.y,   shockmountUpper.x, shockmountUpper.y, color(50, 200, 0));
    link shock = new link(    shockmountUpper.x, shockmountUpper.y, shockmountLower.x, shockmountLower.y, color(50 + col1, 200 - col2 , 0));
    
  
    
    
    chainstay.drawLink();
    seatstay.drawLink();
    LSS.drawLink();
    LSM.drawLink();
    SSSM.drawLink();
    shock.drawLink();
    
    chainstayPivot.drawPivot();
    wheelAxle.drawPivot();
    seatstayPivot.drawPivot();
    linkPivot.drawPivot();
    shockmountUpper.drawPivot();
    shockmountLower.drawPivot();
      
     
    delay(delay);
    
    if (cycle == true){
        if(yChange > -120){
          yChange = yChange - 1;
        }
        else{
          cycle = false;
        }
      }
      
    else{
      if (yChange < 0){
        yChange = yChange + 1;
      }
      else{
        cycle = true;
      }
    }
}




void updateVisuals(){
  //For all the extra visuals
  stroke(140);
  fill(120, 120, 120, 100);
  ellipse(wheelAxle.x, wheelAxle.y, 410, 410);
  
  fill(200);
  ellipse(wheelAxle.x, wheelAxle.y, 370, 370);
  for (int i = 0; i < 13; i++){
    float angle = asin( abs((wheelAxle.y + i*20)-wheelAxle.y)/ 185);
    float newXN = wheelAxle.x - 185*cos(angle);
    float newXP = wheelAxle.x + 185*cos(angle);
    
    stroke(0,0,0, 50);
    if (i != 0){
    line(wheelAxle.x, wheelAxle.y, newXN, wheelAxle.y +(i*20));
    line(wheelAxle.x, wheelAxle.y, newXN, wheelAxle.y -(i*20));
    line(wheelAxle.x, wheelAxle.y, newXP, wheelAxle.y +(i*20));
    line(wheelAxle.x, wheelAxle.y, newXP, wheelAxle.y -(i*20));
    }
    
    if(i == 0){
      line(wheelAxle.x, wheelAxle.y, wheelAxle.x, wheelAxle.y + 185);
      line(wheelAxle.x, wheelAxle.y, wheelAxle.x, wheelAxle.y - 185);
      line(wheelAxle.x, wheelAxle.y, wheelAxle.x + 185, wheelAxle.y);
      line(wheelAxle.x, wheelAxle.y, wheelAxle.x - 185, wheelAxle.y);
    }
  } 
  makeGraphs();
}


void makeGraphs(){
  stroke(0);
  line(100, 850, 250, 850);
  line(100, 850, 100, 750);

}
