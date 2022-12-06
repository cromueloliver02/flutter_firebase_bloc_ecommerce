import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb_auth;

import '../../repositories/repositories.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc({
    required this.authRepository,
  }) : super(AuthState.initial()) {
    on<InitializeAuthEvent>(_onInitializeAuth);
    on<UserStateChangedEvent>(_onUserStateChanged);
    on<SignOutRequestedEvent>(_onSignOutRequestedChanged);
  }

  void _onInitializeAuth(
    InitializeAuthEvent event,
    Emitter<AuthState> emit,
  ) {
    authRepository.user.listen((fb_auth.User? user) {
      add(UserStateChangedEvent(user: user));
    });
  }

  void _onUserStateChanged(
    UserStateChangedEvent event,
    Emitter<AuthState> emit,
  ) {
    final fb_auth.User? user = event.user;

    if (user == null) {
      emit(state.copyWith(
        status: AuthStatus.unauthenticated,
        user: null,
      ));
    }

    if (user != null) {
      emit(state.copyWith(
        status: AuthStatus.authenticated,
        user: user,
      ));
    }
  }

  void _onSignOutRequestedChanged(
    SignOutRequestedEvent event,
    Emitter<AuthState> emit,
  ) {
    authRepository.signOut();
  }
}
