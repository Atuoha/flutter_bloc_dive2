part of 'theme_cubit.dart';

@immutable
 class CubitThemeState extends Equatable{
  final AppTheme theme;
  const CubitThemeState({required this.theme});

  factory CubitThemeState.initial()=> const CubitThemeState(theme: AppTheme.light);

  @override
  List<Object?> get props => [theme];

  @override
  String toString() => 'ThemeState(theme: $theme)';

  CubitThemeState copyWith({AppTheme? theme}){
   return CubitThemeState(theme: theme??this.theme);
  }

}

