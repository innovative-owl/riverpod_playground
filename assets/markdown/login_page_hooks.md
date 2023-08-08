# Login Page (Hooks)

This is an example of a simple login page using `flutter_hooks`

### Setup

```dart
/// Setup our local state
final obscureIcon = useState(true);
final isLoading = useState(false);
final errorMessage = useState<String?>(null);

/// TextEditControllers
final emailController = useTextEditingController();
final passwordController = useTextEditingController();

/// Validation
final emailValid = useListenableSelector(
    emailController, () => emailController.text.isNotEmpty);
final passwordValid = useListenableSelector(
    passwordController, () => passwordController.text.isNotEmpty);
    final isValid = emailValid && passwordValid;
```

### Login

```dart
Future<void> login() async {
  /// Reset the error message
  errorMessage.value = null;
  isLoading.value = true;

  /// Simulate a network call
  await Future.delayed(const Duration(seconds: 3));

  /// Here you would add a try/catch around the network call
  /// This could be reading directly from the `authService`

  isLoading.value = false;

  if (shouldError.value) {
    errorMessage.value = 'Invalid email or password';
    return;
  }

  if (context.mounted) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Login Successful'),
      ),
    );
  }
}
```

### Pros

`flutter_hooks` is great for maintaining local widget state. They are designed as an alternative to `StatefulWidgets`, to make logic more reusable and composable. This makes sense in a simple login page where all of the logic is maintained in one place.

### Cons

While Hooks can be used for simple things such as toggling a boolean like `obscureText`, once you start to introduce other "ui state" you can end up managing many Hooks. 

Also, if your UI is more complex and you are using many smaller widgets (as you should be), then it can be annoying to pass around `ValueNotifiers` or callback methods. See [Login Page (Notifier)]('/login/notifier') to see how we can abstract the UI logic and reuse it in multiple components.


### Full Source Code

```dart
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_playground/core/extensions/context_theme_extensions.dart';
import 'package:riverpod_playground/shared/widgets/code_view.dart';

class LoginHooksScreen extends HookConsumerWidget {
  static const name = 'login_hooks';
  static const path = '/login/hooks';

  const LoginHooksScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// Setup our local state
    final obscureText = useState(true);
    final isLoading = useState(false);
    final errorMessage = useState<String?>(null);
    final shouldError = useState(false);

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
      /// Reset the error message
      errorMessage.value = null;
      isLoading.value = true;

      /// Simulate a network call
      await Future.delayed(const Duration(seconds: 3));

      /// Here you would add a try/catch around the network call
      /// This could be reading directly from the `authService`

      isLoading.value = false;

      if (shouldError.value) {
        errorMessage.value = 'Invalid email or password';
        return;
      }

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Login Successful'),
          ),
        );
      }
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
                obscureText: obscureText.value,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'Password',
                  suffixIcon: IconButton(
                    onPressed: () => obscureText.value = !obscureText.value,
                    icon: obscureText.value
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off),
                  ),
                ),
              ),
              Visibility(
                visible: errorMessage.value != null,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '${errorMessage.value}',
                      style:
                          context.labelMedium?.copyWith(color: context.error),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24.0),
              SwitchListTile(
                value: shouldError.value,
                title: const Text('Should Error'),
                onChanged: (value) => shouldError.value = value,
              ),
              const SizedBox(height: 24.0),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: isValid ? login : null,
                  child: isLoading.value
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