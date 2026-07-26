import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/auth_cubit.dart';
import 'cubit/auth_state.dart';

class VerificationScreen extends StatelessWidget {
  VerificationScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Verify Email')),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            context.go('/login');
          } else if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error), backgroundColor: Colors.red),
            );
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(labelText: 'Email Address'),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: codeController,
                  decoration: const InputDecoration(
                    labelText: 'Verification Code',
                  ),
                ),
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: state is AuthLoading
                        ? null
                        : () {
                            context.read<AuthCubit>().verifyEmail(
                              emailController.text,
                              codeController.text,
                            );
                          },
                    child: state is AuthLoading
                        ? const CircularProgressIndicator()
                        : const Text('Verify'),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
