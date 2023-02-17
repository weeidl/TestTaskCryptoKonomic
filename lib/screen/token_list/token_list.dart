import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_crypto_konomic/screen/home/cubit/token_selection_main_cubit.dart';
import 'package:test_task_crypto_konomic/screen/token_list/cubit/token_list_cubit.dart';
import 'package:test_task_crypto_konomic/screen/token_list/widgets/token_list_widget.dart';
import 'package:test_task_crypto_konomic/theme/colors.dart';
import 'package:test_task_crypto_konomic/theme/text_style.dart';

class TokenList extends StatelessWidget {
  final BuildContext buildContext;
  final bool isTokenA;
  const TokenList({
    Key? key,
    required this.buildContext,
    required this.isTokenA,
  }) : super(key: key);

  static void show({
    required BuildContext buildContext,
    bool isTokenA = true,
  }) async {
    return showModalBottomSheet(
      backgroundColor: CryptoColor.background,
      isScrollControlled: true,
      barrierColor: CryptoColor.black.withOpacity(0.7),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(12),
        ),
      ),
      context: buildContext,
      builder: (context) => BlocProvider(
        create: (_) => TokenListCubit(),
        child: TokenList(
          buildContext: buildContext,
          isTokenA: isTokenA,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.8,
      child: BlocBuilder<TokenListCubit, TokenListState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
            child: Column(
              children: [
                Text(
                  'Select token',
                  style: CryptoTextStyle.title2(CryptoColor.white),
                ),
                const SizedBox(height: 16),
                ListView.builder(
                  padding: const EdgeInsets.only(top: 20.0),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.items.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        buildContext.read<TokenSelectionMainCubit>().selection(
                            tokenModals: state.items[index],
                            isTokenA: isTokenA);
                        Navigator.pop(context);
                      },
                      child: TokenListWidget(
                        token: state.items[index],
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
