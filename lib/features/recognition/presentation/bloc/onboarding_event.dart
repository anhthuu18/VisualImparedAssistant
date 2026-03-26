part of 'onboarding_bloc.dart';

abstract class OnboardingEvent extends Equatable {
  const OnboardingEvent();

  @override
  List<Object> get props => [];
}

class OnboardingInitial extends OnboardingEvent {
  const OnboardingInitial();
}

class OnboardingNextPage extends OnboardingEvent {
  const OnboardingNextPage();
}

class OnboardingPreviousPage extends OnboardingEvent {
  const OnboardingPreviousPage();
}

class OnboardingNavigateToLogin extends OnboardingEvent {
  const OnboardingNavigateToLogin();
}

class OnboardingReset extends OnboardingEvent {
  const OnboardingReset();
}
