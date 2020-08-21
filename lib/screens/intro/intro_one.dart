import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:iPenda/models/intro_model.dart';
import 'package:iPenda/provider/offsetNotifier.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

class IntroOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: double.infinity,
          height: 300,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Consumer<OffsetNotifier>(
                builder: (context, value, child) {
                  return Transform.scale(
                    scale: math.max(0, 1 - value.page),
                    child: Opacity(
                        opacity: math.max(0, math.max(0, 1 - value.page)),
                        child: child),
                  );
                },
                child: Container(
                  height: 30,
                  width: 350,
                  decoration: BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                ),
              ),
              Consumer<OffsetNotifier>(
                builder: (context, value, child) {
                  return Transform.rotate(
                    angle: math.max(0, (math.pi / 2) * 4 * value.page),
                    child: child,
                  );
                },
                child: Image.asset(
                  intros[0].image,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Consumer<OffsetNotifier>(
          builder: (context, value, child) {
            return Opacity(
              opacity: math.max(0, 1 - 4 * value.page),
              child: child,
            );
          },
          child: Column(
            children: [
              Text(
                intros[0].title,
                style: GoogleFonts.quicksand(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    letterSpacing: 2),
              ),
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  intros[0].subtitile,
                  style: GoogleFonts.quicksand(
                      fontSize: 16, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
