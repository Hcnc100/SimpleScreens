import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AnimationScreen extends StatefulWidget {
  const AnimationScreen({Key? key}) : super(key: key);

  @override
  State<AnimationScreen> createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen> {
  double _width = 50;
  double _heigth = 50;
  Color _color = Colors.red;
  BorderRadiusGeometry _borderRadiusGeometry = BorderRadius.circular(10);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Animation container")),
      body: AnimationBody(
          width: _width,
          heigth: _heigth,
          color: _color,
          borderRadiusGeometry: _borderRadiusGeometry),
      floatingActionButton: FloatingActionButton(
        onPressed: _changeShape,
        child: const Icon(Icons.play_arrow),
      ),
    );
  }

  void _changeShape() {
    setState(() {
      final ramdom = Random();
      _width = ramdom.nextInt(300).toDouble() + 70;
      _heigth = ramdom.nextInt(300).toDouble() + 70;
      _color = Color.fromRGBO(
          ramdom.nextInt(255), ramdom.nextInt(255), ramdom.nextInt(255), 1);
      _borderRadiusGeometry = BorderRadius.circular(ramdom.nextInt(100) + 10);
    });
  }
}

class AnimationBody extends StatelessWidget {
  const AnimationBody({
    Key? key,
    required double width,
    required double heigth,
    required Color color,
    required BorderRadiusGeometry borderRadiusGeometry,
  })  : _width = width,
        _heigth = heigth,
        _color = color,
        _borderRadiusGeometry = borderRadiusGeometry,
        super(key: key);

  final double _width;
  final double _heigth;
  final Color _color;
  final BorderRadiusGeometry _borderRadiusGeometry;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeOutCubic,
      width: _width,
      height: _heigth,
      decoration:
          BoxDecoration(color: _color, borderRadius: _borderRadiusGeometry),
    ));
  }
}
