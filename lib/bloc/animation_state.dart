// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'animation_bloc.dart';

@immutable
abstract class AnimationState {}

class AnimationInitial extends AnimationState {}

class SuccessAnimationState extends AnimationState {
  final double height;
  final double width;
  final int color1;
  final int color2;
  final int color3;
  final double size;

  SuccessAnimationState({
    required this.height,
    required this.width,
    required this.color1,
    required this.color2,
    required this.color3,
    required this.size,
  });
}

class LoadingAnimationState extends AnimationState {}

class ErrorAnimationState extends AnimationState {}

class LoadedAnimationState extends AnimationState {}
