class Snowflake {
  PVector pos;
  PVector vel;
  PVector acc;
  PImage img;
  float angle;
  float dir;
  float r;

  // wind
  float xOff;

  float getRandomSize() {
    // case 3
    float r = pow(random(0, 1), 2);
    return constrain(r * 36, 2, 36);

    // case 2
    //float r = randomGaussian() * 2;
    //return constrain(abs(r * r), 2, 36);

    // case 1
    //while (true) {
    //  float r1 = random(1);
    //  float r2 = random(1);
    //  if (r2> r1) {
    //    return r1 * 36;
    //  }
    //}
  }

  Snowflake(float sx, float sy, PImage simg) {
    float x = sx;
    float y = sy;
    img = simg;
    pos = new PVector(x, y);
    vel = new PVector(0, 0);
    acc = new PVector();
    angle = random(TWO_PI);
    dir = (random(1) > 0.5) ? 1 : -1;
    xOff = 0;
    r = getRandomSize();
  }

  void applyForce(PVector force) {
    // parallax effect hack
    PVector f= force.copy();
    f.mult(r);

    //PVector f = force.copy();
    //f.div(mass);
    acc.add(f);
  }

  void randomize() {
    float x = random(width);
    float y = random(-100, -10);
    pos = new PVector(x, y);
    vel = new PVector(0, 0);
    acc = new PVector();
    r = getRandomSize();
  }

  void update() {
    xOff = sin(angle * 2) * 2 * r;

    //acc = gravity;
    vel.add(acc);
    vel.limit(r * 0.2);

    if (vel.mag() < 1) {
      vel.normalize();
    }
    pos.add(vel);
    acc.mult(0);

    if (pos.y > height + r) {
      randomize();
    }

    if (pos.x < -r) {
      pos.x = width + r;
    }

    if (pos.x > width + r) {
      pos.x = -r;
    }

    angle += dir * vel.mag() / 200;
  }

  void render() {
    //stroke(255);
    //strokeWeight(r);
    //point(pos.x, pos.y);
    pushMatrix();
    translate(pos.x + xOff, pos.y);
    rotate(angle);
    imageMode(CENTER);
    image(img, 0, 0, r, r);
    popMatrix();
  }

  //boolean offScreen() {
  //  return (pos.y > height + r);
  //}
}
