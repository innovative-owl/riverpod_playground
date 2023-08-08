import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_notifier.freezed.dart';
part 'login_notifier.g.dart';

@riverpod
class LoginNotifier extends _$LoginNotifier {
  @override
  LoginUIState build() {
    return const LoginUIState();
  }

  Future<void> login() async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    /// Simulate a network call
    await Future.delayed(const Duration(seconds: 3));

    /// Here you would add a try/catch around the network call
    /// If you were using AsyncValue, you could also use `AsyncValue.guard`

    state = state.copyWith(
      isLoading: false,
      errorMessage: state.shouldError ? 'Invalid email or password' : null,
    );
  }

  /// Create methods to update the state and expose them to the UI
  void togglePasswordVisibility() {
    state = state.copyWith(obscureText: !state.obscureText);
  }

  void setShouldError(bool value) {
    state = state.copyWith(shouldError: value);
  }
}

@freezed
class LoginUIState with _$LoginUIState {
  const factory LoginUIState({
    @Default(false) bool isLoading,
    @Default(true) bool obscureText,
    @Default(false) bool shouldError,
    String? errorMessage,
  }) = _LoginUIState;
}
