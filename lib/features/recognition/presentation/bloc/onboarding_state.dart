part of 'onboarding_bloc.dart';

class OnboardingState extends Equatable {
  final int currentPage;
  final int totalPages;
  final bool isLastPage;
  final bool shouldNavigateToLogin;

  const OnboardingState({
    this.currentPage = 0,
    this.totalPages = 3,
    this.isLastPage = false,
    this.shouldNavigateToLogin = false,
  });

  OnboardingState copyWith({
    int? currentPage,
    int? totalPages,
    bool? isLastPage,
    bool? shouldNavigateToLogin,
  }) {
    return OnboardingState(
      currentPage: currentPage ?? this.currentPage,
      totalPages: totalPages ?? this.totalPages,
      isLastPage: isLastPage ?? this.isLastPage,
      shouldNavigateToLogin:
          shouldNavigateToLogin ?? this.shouldNavigateToLogin,
    );
  }

  @override
  List<Object> get props => [
    currentPage,
    totalPages,
    isLastPage,
    shouldNavigateToLogin,
  ];
}
