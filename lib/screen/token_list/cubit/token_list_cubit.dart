import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_crypto_konomic/models/token.dart';

part 'token_list_state.dart';

class TokenListCubit extends Cubit<TokenListState> {
  TokenListCubit() : super(const TokenListState(items: tokens));
}
