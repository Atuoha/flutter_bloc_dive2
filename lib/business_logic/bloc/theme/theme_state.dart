part of 'theme_bloc.dart';

@immutable
class ThemeState extends Equatable {
  final AppTheme theme;

  const ThemeState({required this.theme});

  factory ThemeState.initial() => const ThemeState(theme: AppTheme.light);

  @override
  List<Object?> get props => [theme];

  @override
  String toString() =>  'ThemeState(theme: $theme)';

  ThemeState copyWith({AppTheme? theme}) {
    return ThemeState(theme: theme ?? this.theme);
  }
}
