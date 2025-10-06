class Persona extends GameObject {
  constructor(x, y, textureData, juego) {
    super(textureData, x, y, juego);
  }
  
  evade(vehicle){
    let pursuit = this.pursue(vehicle);
    pursuit.mult(-1);
    return pursuit;
  }

  pursue(vehicle){
    let target = vehicle.pos.copy();
    let prediction = vehicle.velocity.copy();
    prediction.mult(10);
    Vector2D.add(velocity);
    Vector2D.add(vehicle.velocity.mult(10));
    fill(0, 255, 0);
    circle(target.x, target.y, 16);
    return this.seek(target);
  }
                
  arrive(target){
    return this.seek(target.true);
  }
                
  flee(target){
    return this.seek(target).mult(-1);
  }
                
  seek(target){
    let desired = p5.Vector.sub(target, this.position);
    let steering = p5.Vector.sub(desired, this.velocity);
    this.applyForce(steering);
  }

  applyForce(force){
    let f = p5.Vector.div(force, this.mass);
    this.acceleration.add(f);
  }

  update() {
    Vector2D.velocity.add(this.acceleration);
    Vector2D.position.add(this.velocity);
    this.acceleration.mult(0);
  }

  tick() {
    super.tick();
  }
  
  render() {
    super.render();
  }
}