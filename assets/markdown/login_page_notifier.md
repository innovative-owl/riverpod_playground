# Login Page (Notifier)

This is an example of a simple login page using a `Notifier`

### UI State

We can use `freezed` to store our UI in an immutable state.
We use an immutable state becasue our UI is a 1:1 representation of our state, meaning when the `LoginUIState` is in it's default state, the UI will look the same every time.

```dart
@freezed
class LoginUIState with _$LoginUIState {
  const factory LoginUIState({
    @Default(false) bool isLoading,
    @Default(true) bool obscureText,
    @Default(false) bool shouldError,
    String? errorMessage,
  }) = _LoginUIState;
}
```

### Notifier

```dart
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
```

### Login

Our login method is no deferred to the Notifer

```dart
Future<void> login() async {
  ref.read(loginNotifierProvider.notifier).login();
}
```

### Pros



### Cons




### Full Source Code

```dart
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_playground/core/extensions/context_theme_extensions.dart';
import 'package:riverpod_playground/features/login_notifier/login_notifier.dart';
import 'package:riverpod_playground/shared/widgets/code_view.dart';

class LoginNotifierScreen extends HookConsumerWidget {
  static const name = 'login_notifier';
  static const path = '/login/notifier';

  const LoginNotifierScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// Use `ref.watch` to listen to the provider
    /// Safe to use in the build method, as it will rebuild the widget when the provider changes
    final uiState = ref.watch(loginNotifierProvider);

    /// TextEditControllers
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    /// Validation
    final emailValid = useListenableSelector(
        emailController, () => emailController.text.isNotEmpty);
    final passwordValid = useListenableSelector(
        passwordController, () => passwordController.text.isNotEmpty);
    final isValid = emailValid && passwordValid;

    Future<void> login() async {
      /// Use `ref.read` in order to read the provider without listening to it
      /// This is normally done in `initState` or an `onTap` event
      /// Not safe to use in a build method
      ref.read(loginNotifierProvider.notifier).login();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page (Hooks)'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push<void>(
                context,
                MaterialPageRoute(
                  builder: (context) => const CodeView(),
                  fullscreenDialog: true,
                ),
              );
            },
            icon: const Icon(Icons.code),
          ),
        ],
      ),
      body: AutofillGroup(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                autofillHints: const [AutofillHints.email],
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: passwordController,
                keyboardType: TextInputType.visiblePassword,
                autofillHints: const [AutofillHints.password],
                obscureText: uiState.obscureText,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'Password',
                  suffixIcon: IconButton(
                    onPressed: ref
                        .read(loginNotifierProvider.notifier)
                        .togglePasswordVisibility,
                    icon: uiState.obscureText
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off),
                  ),
                ),
              ),
              Visibility(
                visible: uiState.errorMessage != null,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '${uiState.errorMessage}',
                      style:
                          context.labelMedium?.copyWith(color: context.error),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24.0),
              SwitchListTile(
                value: uiState.shouldError,
                title: const Text('Should Error'),
                onChanged:
                    ref.read(loginNotifierProvider.notifier).setShouldError,
              ),
              const SizedBox(height: 24.0),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: isValid ? login : null,
                  child: uiState.isLoading
                      ? const SizedBox(
                          height: 16.0,
                          width: 16.0,
                          child: CircularProgressIndicator(
                            strokeWidth: 2.0,
                          ),
                        )
                      : const Text('Login'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```