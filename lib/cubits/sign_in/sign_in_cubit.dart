import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repositories/repositories.dart';
import '../../models/models.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final AuthRepository authRepository;

  SignInCubit({
    required this.authRepository,
  }) : super(SignInState.initial());

  void signIn({
    required String email,
    required String password,
  }) async {
    emit(state.copyWith(status: SignInStatus.submitting));

    try {
      await authRepository.signIn(email: email, password: password);

      emit(state.copyWith(status: SignInStatus.success));
    } on CustomError catch (err) {
      emit(state.copyWith(
        status: SignInStatus.error,
        error: err,
      ));

      debugPrint(state.toString());
    }
  }
}
