import 'package:flutter/material.dart';
import 'package:iPenda/models/intro_model.dart';
import 'package:iPenda/provider/offsetNotifier.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

class IntroThree extends StatelessWidget {
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
                    scale: math.max(0, 1 - (1 - (4 * value.page - 7))),
                    child: child,
                  );
                },
                child: Container(),
              ),
              Consumer<OffsetNotifier>(
                builder: (context, value, child) {
                  return Transform(
                    alignment: FractionalOffset.center,
                    transform: Matrix4.translationValues(
                        0, 100 * (1 - (4 * value.page - 7)), 0)
                      ..rotateZ((-math.pi / 2) * 2 * value.page),
                    child: child,
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Image.asset(
                    intros[2].image,
                  ),
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
            return Transform.translate(
              offset: Offset(0, -50 * (1 - (4 * value.page - 7))),
              child: child,
            );
          },
          child: Text(
            intros[2].title,
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Consumer<OffsetNotifier>(
          builder: (context, value, child) {
            return Opacity(
              opacity: math.max(0, 4 * value.page - 7),
              child: child,
            );
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              intros[2].subtitile,
              style: Theme.of(context).textTheme.bodyText1,
              textAlign: TextAlign.center,
            ),
          ),
        )
      ],
    );
  }
}
