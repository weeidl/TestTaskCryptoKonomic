part of 'token_list_cubit.dart';

@immutable
class TokenListState {
  final List<Token> _items;

  const TokenListState({
    required List<Token> items,
  }) : _items = items;

  List<Token> get items => _items;

  TokenListState copyWith({
    List<Token>? items,
  }) {
    return TokenListState(
      items: items ?? _items,
    );
  }
}
