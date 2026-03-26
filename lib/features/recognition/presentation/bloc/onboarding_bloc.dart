import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc() : super(const OnboardingState()) {
    on<OnboardingInitial>(_onInitial);
    on<OnboardingNextPage>(_onNextPage);
    on<OnboardingPreviousPage>(_onPreviousPage);
    on<OnboardingNavigateToLogin>(_onNavigateToLogin);
    on<OnboardingReset>(_onReset);
  }

  Future<void> _onInitial(
    OnboardingInitial event,
    Emitter<OnboardingState> emit,
  ) async {
    emit(
      const OnboardingState(
        currentPage: 0,
        totalPages: 3,
        isLastPage: false,
        shouldNavigateToLogin: false,
      ),
    );
  }

  Future<void> _onNextPage(
    OnboardingNextPage event,
    Emitter<OnboardingState> emit,
  ) async {
    final currentPage = state.currentPage;
    final nextPage = currentPage + 1;

    if (nextPage < state.totalPages) {
      emit(
        state.copyWith(
          currentPage: nextPage,
          isLastPage: nextPage == state.totalPages - 1,
        ),
      );
    }
  }

  Future<void> _onPreviousPage(
    OnboardingPreviousPage event,
    Emitter<OnboardingState> emit,
  ) async {
    final currentPage = state.currentPage;
    final previousPage = currentPage - 1;

    if (previousPage >= 0) {
      emit(state.copyWith(currentPage: previousPage, isLastPage: false));
    }
  }

  Future<void> _onNavigateToLogin(
    OnboardingNavigateToLogin event,
    Emitter<OnboardingState> emit,
  ) async {
    emit(state.copyWith(shouldNavigateToLogin: true));
  }

  Future<void> _onReset(
    OnboardingReset event,
    Emitter<OnboardingState> emit,
  ) async {
    emit(
      const OnboardingState(
        currentPage: 0,
        totalPages: 3,
        isLastPage: false,
        shouldNavigateToLogin: false,
      ),
    );
  }
}
