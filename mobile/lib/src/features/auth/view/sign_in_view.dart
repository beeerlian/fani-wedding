import 'package:arx/config/constants/constants.dart';
import 'package:arx/widgets/button/button.dart';
import 'package:arx/widgets/button/outlined_button.dart';
import 'package:arx/widgets/froms/input.dart';
import 'package:fani_wedding/src/dialogs/widget/x_alert_dialog.dart';
import 'package:fani_wedding/src/features/auth/bloc/auth_bloc.dart';
import 'package:fani_wedding/src/features/auth/view/sign_up_view.dart';
import 'package:fani_wedding/src/utils/fetch_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/auth_header.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthBloc()),
      ],
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(Constants.kPaddingL),
            child: ListView(
              children: [
                const AuthHeader(
                  title: 'Masuk Sekarang',
                ),
                const SizedBox(height: Constants.kPaddingL),
                const SizedBox(height: Constants.kPaddingL),
                XInputCustom(
                  labelText: 'Email',
                  prefixIcon: Icons.email,
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(
                  height: Constants.kPaddingL,
                ),
                XInputCustom(
                  labelText: 'Kata Sandi',
                  prefixIcon: Icons.password_rounded,
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                ),
                const SizedBox(height: Constants.kPaddingXL),
                const SizedBox(height: Constants.kPaddingXL),
                BlocConsumer<AuthBloc, AuthState>(
                  listener: (context, state) {
                    if (state.login.status == FetchingStatus.success) {
                      int count = 0;
                      Navigator.of(context).popUntil((_) => count++ >= 1);
                    } else if (state.login.status == FetchingStatus.failed) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return XAlertDialog(
                            title: "Login Failed",
                            content: state.login.error,
                          );
                        },
                      );
                    }
                  },
                  builder: (context, state) {
                    return XButton(
                      busy: state.login.status == FetchingStatus.loading,
                      onPressed: () {
                        context.read<AuthBloc>().add(LoginEvent(
                            email: emailController.text,
                            password: passwordController.text));
                      },
                      title: 'Masuk',
                    );
                  },
                ),
                const SizedBox(height: Constants.kPaddingM),
                XOutlinedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => const SignUpView(),
                      ),
                    );
                  },
                  title: 'Daftar ',
                ),
                const SizedBox(height: Constants.kPaddingL),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
