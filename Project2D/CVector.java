class CVector {

  // Data
  float x;
  float y;

  // Constructor
  CVector(float x_, float y_) {

    x = x_;
    y = y_;
  }

  void add(CVector v) {
    x = x + v.x;
    y = y + v.y;
  }

  static CVector add(CVector v1, CVector v2) {

    return new CVector( v1.x + v2.x, v1.y + v2.y);
  }

  void sub(CVector v) {
    x = x - v.x;
    y = y - v.y;
  }

  static CVector sub(CVector v1, CVector v2) {

    return new CVector( v1.x - v2.x, v1.y - v2.y);
  }

  // scale the vector with multiplication
  void mult(float n) {
    x = x * n;
    y = y * n;
  }

  static CVector mult(CVector v1, float n) {

    return new CVector( v1.x * n, v1.y * n);
  }

  // scale the vector with division
  void div(float n) {
    x = x / n;
    y = y / n;
  }

  static CVector div(CVector v1, float n) {

    return new CVector( v1.x / n, v1.y / n);
  }

  // vector magnitude – how long is the vector?
  float mag() {
    return (float) Math.sqrt(x*x + y*y);
  }

  // vector normalization – make the vector a unit vector
  void normalize() {

    float m = mag();  // get magnitude

    // Make sure we don't divide by zero
    if (m != 0) {
      div(m);  // normalize this vector instance using the magnitude
    }
  }

  static CVector normalize(CVector v) {

    float m = v.mag();

    // Make sure we don't divide by zero
    if (m != 0) {
      v.div(m);  // normalize this vector instance using the magnitude
    }

    return v;
  }

  // limit the magnitude of this vector
  void limit(float max) {
    if (mag() > max) {
      normalize();
      mult(max);
    }
  }

  // Return a 2D CVector with a max magnitude of 1 pointing in a random direction
  static CVector random2D() {

    CVector v = new CVector( (float) Math.random() * 2 - 1, (float) Math.random() * 2 - 1 );

    return v;
  }
}