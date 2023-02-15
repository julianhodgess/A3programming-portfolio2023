// Julian Hodges | 7 Sept 2022 | Shapes assignment

void setup() {
  size(650,550);
  background(127);
}

void draw() {
  background(127);
  line(1,100,width,100);
  line(100,0,100,height);
  line(200,0,200,height);
  line(300,0,300,height);
  line(400,0,400,height);
  line(500,0,500,height);
  line(600,0,600,height);
  line(1,200,width,200);
  line(1,300,width,300);
  line(1,400,width,400);
  line(1,500,width,500);
  fill(255,255,0);
  square(20,20,120);
  rect(180,20,120,120,10);
  rect(340,20,120,120,10,7,20,40);
  rect(500,40,130,60);
  fill(255,0,0);
  circle(80,250,120);
  ellipse(240,240,120,80);
  ellipse(400,250,80,120);
  fill(0,0,255);
  triangle(500,300,560,180,620,300);
  triangle(20,410,40,340,130,455);
  fill(2,247,241);
  quad(180,340,300,340,300,380,180,460);
  quad(400,350,430,400,400,450,370,400);
  quad(500,340,620,400,500,455,560,400);
 
  ellipse(mouseX,mouseY,20,20);
  fill(255);
  text("100",95,11);
  text("200",195,11);
  text("300",295,11);
  text("400",395,11);
  text("500",495,11);
  text("600",595,11);
  text("100",2, 105);
  text("200",2,205);
  text("300",2,305);
  text("400",2,405);
  text("500",2,505);
  
  
  
}
