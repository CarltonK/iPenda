import 'package:flutter/material.dart';
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
                      opacity: math.max(
                        0,
                        math.max(
                          0,
                          1 - value.page,
                        ),
                      ),
                      child: child,
                    ),
                  );
                },
                child: Container(),
              ),
              Consumer<OffsetNotifier>(
                builder: (context, value, child) {
                  return Transform.rotate(
                    angle: math.max(0, (math.pi / 2) * 4 * value.page),
                    child: child,
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Image.asset(
                    intros[0].image,
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
            return Opacity(
              opacity: math.max(0, 1 - 4 * value.page),
              child: child,
            );
          },
          child: Column(
            children: [
              Text(
                intros[0].title,
                style: Theme.of(context).textTheme.headline1,
              ),
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  intros[0].subtitile,
                  style: Theme.of(context).textTheme.bodyText1,
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
