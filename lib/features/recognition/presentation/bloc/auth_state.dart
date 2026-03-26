part of 'auth_bloc.dart';

enum AuthStatus { initial, loading, authenticated, unauthenticated, error }

class AuthState extends Equatable {
  final AuthStatus status;
  final String? userId;
  final String? errorMessage;
  final String? userEmail;

  const AuthState({
    this.status = AuthStatus.initial,
    this.userId,
    this.errorMessage,
    this.userEmail,
  });

  AuthState copyWith({
    AuthStatus? status,
    String? userId,
    String? errorMessage,
    String? userEmail,
  }) {
    return AuthState(
      status: status ?? this.status,
      userId: userId ?? this.userId,
      errorMessage: errorMessage ?? this.errorMessage,
      userEmail: userEmail ?? this.userEmail,
    );
  }

  @override
  List<Object?> get props => [status, userId, errorMessage, userEmail];
}
