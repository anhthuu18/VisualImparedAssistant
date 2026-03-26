part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class AuthGoogleSignInRequested extends AuthEvent {
  const AuthGoogleSignInRequested();
}

class AuthSignUpRequested extends AuthEvent {
  const AuthSignUpRequested();
}

class AuthSignOutRequested extends AuthEvent {
  const AuthSignOutRequested();
}

class AuthStatusChanged extends AuthEvent {
  final bool isAuthenticated;
  final String? userId;

  const AuthStatusChanged({required this.isAuthenticated, this.userId});

  @override
  List<Object?> get props => [isAuthenticated, userId];
}
