// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'animation_bloc.dart';

@immutable
abstract class AnimationEvent {}

class AnimationScreenEvent extends AnimationEvent {
  final double height;
  final double width;
  final int color1;
  final int color2;
  final int color3;
  final double size;

  AnimationScreenEvent({
    required this.height,
    required this.width,
    required this.color1,
    required this.color2,
    required this.color3,
    required this.size,
  });
}
