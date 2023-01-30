part of 'color_cubit.dart';

@immutable
class ColorState extends Equatable {
  final Color color;

  const ColorState({required this.color});

  factory ColorState.initial() => const ColorState(color: Colors.white);

  @override
  List<Object?> get props => [color];

  @override
  String toString() => 'ColorState()';

  ColorState copyWith({Color? color}) {
    return ColorState(color: color ?? this.color);
  }
}
