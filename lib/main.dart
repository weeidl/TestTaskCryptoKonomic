import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_crypto_konomic/screen/home/cubit/token_selection_main_cubit.dart';
import 'package:test_task_crypto_konomic/screen/home/token_selection_main_screen.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => TokenSelectionMainCubit(),
          ),
        ],
        child: const TokenSelectionMainScreen(),
      ),
    );
  }
}
