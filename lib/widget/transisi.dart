import 'package:flutter/material.dart';

class Geser extends PageRouteBuilder {
  final Widget child;

  Geser({required this.child})
      : super(
      pageBuilder: (context, animation, secondaryAnimation) => child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) => SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(-1.0, -1.0),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      ));
}