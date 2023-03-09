import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice41/bloc/animation_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AnimationScreen(),
    );
  }
}

class AnimationScreen extends StatelessWidget {
  const AnimationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Random random = Random();

    final AnimationBloc bloc = AnimationBloc();
    double height = random.nextInt(500).toDouble();
    double width = random.nextInt(400).toDouble();
    int color1 = random.nextInt(256);
    int color2 = random.nextInt(256);
    int color3 = random.nextInt(256);
    double size = random.nextInt(40).toDouble();

    return Scaffold(
      body: Center(
        child: BlocBuilder<AnimationBloc, AnimationState>(
          bloc: bloc,
          builder: (context, state) {
            if (state is LoadingAnimationState) {
              return const CircularProgressIndicator();
            }

            if (state is SuccessAnimationState) {
              return AnimatedContainer(
                alignment: Alignment.center,
                duration: const Duration(seconds: 3),
                height: state.height,
                width: state.width,
                color: Color.fromRGBO(
                  state.color1,
                  state.color2,
                  state.color3,
                  1,
                ),
                child: Text(
                  '123',
                  style: TextStyle(
                    fontSize: state.size,
                    color: Color.fromRGBO(
                      state.color2,
                      state.color3,
                      state.color1,
                      1,
                    ),
                  ),
                ),
              );
            }

            // if (state is LoadedAnimationState) {
            //   return AnimatedContainer(
            //     alignment: Alignment.center,
            //     duration: const Duration(seconds: 3),
            //     height: height,
            //     width: width,
            //     color: Color.fromRGBO(
            //       color1,
            //       color2,
            //       color3,
            //       1,
            //     ),
            //     child: Text(
            //       '123',
            //       style: TextStyle(
            //         fontSize: size,
            //         color: Color.fromRGBO(
            //           color1,
            //           color2,
            //           color3,
            //           1,
            //         ),
            //       ),
            //     ),
            //   );
            // }

            return AnimatedContainer(
              alignment: Alignment.center,
              duration: const Duration(seconds: 3),
              height: 300,
              width: 200,
              color: Color.fromRGBO(
                color2,
                color3,
                color1,
                1,
              ),
              child: Text(
                '123',
                style: TextStyle(
                  fontSize: size,
                  color: Color.fromRGBO(
                    color2,
                    color3,
                    color1,
                    1,
                  ),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          bloc.add(
            AnimationScreenEvent(
              height: height,
              width: width,
              color1: color1,
              color2: color2,
              color3: color3,
              size: size,
            ),
          );
        },
      ),
    );
  }
}
