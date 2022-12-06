part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final AuthStatus status;
  final fb_auth.User? user;

  const AuthState({
    required this.status,
    this.user,
  });

  factory AuthState.initial() {
    return const AuthState(
      status: AuthStatus.unknown,
    );
  }

  @override
  List<Object?> get props => [status, user];

  @override
  String toString() => 'AuthState(status: $status, user: $user)';

  AuthState copyWith({
    AuthStatus? status,
    fb_auth.User? user,
  }) {
    return AuthState(
      status: status ?? this.status,
      user: user ?? this.user,
    );
  }
}

enum AuthStatus {
  unknown,
  authenticated,
  unauthenticated,
}
