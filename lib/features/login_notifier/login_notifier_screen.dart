import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_playground/core/extensions/context_theme_extensions.dart';
import 'package:riverpod_playground/features/login_notifier/login_notifier.dart';
import 'package:riverpod_playground/shared/widgets/code_view.dart';

class LoginNotifierScreen extends HookConsumerWidget {
  static const name = 'login_notifier';
  static const path = '/login/notifier';

  static const assetPath = 'assets/markdown/login_page_notifier.md';

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
        title: const Text('Login Page (Notifier)'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push<void>(
                context,
                MaterialPageRoute(
                  builder: (context) => const CodeView(
                    assetPath: assetPath,
                  ),
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
