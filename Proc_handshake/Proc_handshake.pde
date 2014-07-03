import processing.serial.*;

Serial myPort;
String val;
boolean firstContact = false;


void setup() {
  size(200, 200);

  myPort = new Serial(this, Serial.list()[2], 9600);
  myPort.bufferUntil('\n');
}

void draw() {
  //do nothing stub
}

void serialEvent(Serial myPort) {
  val = myPort.readStringUntil('\n');

  if (val != null) {
    val = trim(val);
    println(val);

    if (firstContact == false) {
      if (val.equals("Marco")) {
        firstContact = true;
        myPort.clear(); 
        myPort.write("Polo");
        println("contact made with Arduino");
      }
    } else {
      println(val);

      if (mousePressed == true) {
        myPort.write('1');
        println("1");
      } 

      myPort.write("Polo");
    }
  }
}
