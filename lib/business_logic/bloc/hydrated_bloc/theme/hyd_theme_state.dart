part of 'hyd_theme_bloc.dart';

enum AppThemed {
  light,
  dark;

  String toJson() => name;

  static AppThemed fromJson(String json) => values.byName(json);
}

@immutable
class HydThemeState extends Equatable {
  final AppThemed theme;

  const HydThemeState({required this.theme});

  factory HydThemeState.initial() =>
      const HydThemeState(theme: AppThemed.light);

  @override
  // TODO: implement props
  List<Object?> get props => [theme];

  @override
  String toString() => 'HydThemeState(theme: $theme)';

  HydThemeState copyWith({AppThemed? theme}) {
    return HydThemeState(theme: theme ?? this.theme);
  }

  Map<String, dynamic> toJson() {
    return {
      'theme': theme,
    };
  }

  factory HydThemeState.fromJson(Map<String, dynamic> json) {
    return HydThemeState(
      theme: json['theme'] as AppThemed,
    );
  }
}
