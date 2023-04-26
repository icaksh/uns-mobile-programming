import 'dart:math';

class RectangleCalculator {
  RectangleCalculator({
    required this.length,
    required this.width,
  });
  final double length;
  final double width;

  double _area = 0.0;
  double _circumference = 0.0;

  double area() {
    _area = length * width;
    return _area;
  }

  double circumference() {
    _circumference = 2 * (length + width);
    return _circumference;
  }
}

class CircleCalculator {
  CircleCalculator({
    required this.radius,
  });
  double radius;

  double _area = 0.0;
  double _circumference = 0.0;

  double area() {
    _area = pi * pow(radius, 2);
    return _area;
  }

  double circumference() {
    _circumference = pi * (2 * radius);
    return _circumference;
  }
}

class TriangleCalculator {
  TriangleCalculator({
    required this.base,
    required this.height,
  });
  final double base;
  final double height;

  double _area = 0.0;

  double area() {
    _area = (base * height) / 2;
    return _area;
  }
}
