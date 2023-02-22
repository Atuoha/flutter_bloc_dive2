part of 'temp_settings_cubit.dart';

class TempSettingsState extends Equatable {
  final bool isCelsius;

  const TempSettingsState({required this.isCelsius});

  factory TempSettingsState.initial() =>
      const TempSettingsState(isCelsius: true);

  @override
  List<Object> get props => [isCelsius];

  @override
  String toString() => 'TempSettingsState{isCelsius: $isCelsius}';

  TempSettingsState copyWith({
    bool? isCelsius,
  }) {
    return TempSettingsState(
      isCelsius: isCelsius ?? this.isCelsius,
    );
  }
}
