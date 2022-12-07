import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../repositories/repositories.dart';
import '../../models/models.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final AuthRepository authRepository;

  SignUpCubit({
    required this.authRepository,
  }) : super(SignUpState.initial());

  void signUp({
    required String firstName,
    required String lastName,
    required String city,
    required String country,
    required int zipCode,
    required String email,
    required String password,
  }) async {
    emit(state.copyWith(status: SignUpStatus.submitting));

    try {
      await authRepository.signUp(
        firstName: firstName,
        lastName: lastName,
        city: city,
        country: country,
        zipCode: zipCode,
        email: email,
        password: password,
      );

      emit(state.copyWith(status: SignUpStatus.success));
    } on CustomError catch (err) {
      emit(state.copyWith(
        status: SignUpStatus.error,
        error: err,
      ));

      debugPrint(state.toString());
    }
  }
}
