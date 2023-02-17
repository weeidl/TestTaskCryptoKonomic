import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_crypto_konomic/models/token.dart';

part 'token_selection_main_state.dart';

class TokenSelectionMainCubit extends Cubit<TokenSelectionMainState> {
  TokenSelectionMainCubit() : super(const TokenSelectionMainState());

  void selection({
    required Token tokenModals,
    required bool isTokenA,
  }) {
    emit(
      state.copyWith(
        selectedTokenA: isTokenA ? tokenModals : null,
        selectedTokenB: !isTokenA ? tokenModals : null,
      ),
    );
  }
}
