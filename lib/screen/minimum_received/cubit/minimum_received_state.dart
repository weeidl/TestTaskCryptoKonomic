part of 'minimum_received_cubit.dart';

@immutable
abstract class ShowAmountState {}

class ShowAmountInitial extends ShowAmountState {}

class ShowAmountLoading extends ShowAmountState {}

class ShowAmountLoaded extends ShowAmountState {
  final Token _selectedTokenA;
  final Token _selectedTokenB;
  final String _amount;
  final String _dateTime;

  ShowAmountLoaded({
    required Token selectedTokenA,
    required Token selectedTokenB,
    required String amount,
    required String dateTime,
  })  : _selectedTokenA = selectedTokenA,
        _selectedTokenB = selectedTokenB,
        _amount = amount,
        _dateTime = dateTime;

  Token get selectedTokenA => _selectedTokenA;

  Token get selectedTokenB => _selectedTokenB;

  String get amount => _amount;

  String get dateTime => _dateTime;

  ShowAmountLoaded copyWith({
    Token? selectedTokenA,
    Token? selectedTokenB,
    String? amount,
    String? dateTime,
  }) {
    return ShowAmountLoaded(
      selectedTokenA: selectedTokenA ?? _selectedTokenA,
      selectedTokenB: selectedTokenB ?? _selectedTokenB,
      amount: amount ?? _amount,
      dateTime: dateTime ?? _dateTime,
    );
  }
}
