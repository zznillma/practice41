import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'animation_event.dart';
part 'animation_state.dart';

class AnimationBloc extends Bloc<AnimationEvent, AnimationState> {
  AnimationBloc() : super(AnimationInitial()) {
    on<AnimationEvent>((event, emit) {});

    on<AnimationScreenEvent>((event, emit) async {
      emit(LoadingAnimationState());

      try {
        // await Future.delayed(Duration(seconds: 3));
        Random random = Random();

        double height = event.height;
        double width = event.width;
        int color1 = event.color1;
        int color2 = event.color2;
        int color3 = event.color3;
        double size = event.size;

        height = random.nextInt(500).toDouble();
        width = random.nextInt(400).toDouble();
        color1 = random.nextInt(256);
        color2 = random.nextInt(256);
        color3 = random.nextInt(256);
        size = random.nextInt(40).toDouble();

        emit(SuccessAnimationState(
          height: height,
          width: width,
          color1: color1,
          color2: color2,
          color3: color3,
          size: size,
        ));
      } catch (e) {
        emit(ErrorAnimationState());
      }
    });
  }
}
