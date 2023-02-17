part of 'token_selection_main_cubit.dart';

@immutable
class TokenSelectionMainState {
  final Token? _selectedTokenA;
  final Token? _selectedTokenB;

  const TokenSelectionMainState({
    Token? selectedTokenA,
    Token? selectedTokenB,
  })  : _selectedTokenA = selectedTokenA,
        _selectedTokenB = selectedTokenB;

  Token? get selectedTokenA => _selectedTokenA;
  Token? get selectedTokenB => _selectedTokenB;

  TokenSelectionMainState copyWith({
    Token? selectedTokenA,
    Token? selectedTokenB,
  }) {
    return TokenSelectionMainState(
      selectedTokenA: selectedTokenA ?? _selectedTokenA,
      selectedTokenB: selectedTokenB ?? _selectedTokenB,
    );
  }
}
