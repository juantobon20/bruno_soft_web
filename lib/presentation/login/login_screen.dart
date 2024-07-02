import 'package:bruno_soft_web/presentation/dialogs/dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/widgets.dart';
import 'login.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController userController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginScreenBloc, LoginState>(
      listener: (context, state) {
        if (state.errorData != null) {
          ErrorDialogProvider(
            context: context, 
            errorData: state.errorData!
          );
        }
      },
      builder: (context, state) {
        return Background(
          body: Scaffold(
            body: Container(
              decoration: _customBoxDecoration,
              height: double.infinity,
              child: Center(
                child: SingleChildScrollView(
                  physics: const ClampingScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _logo,
                      _container(
                        context,
                        state,
                        userController, 
                        passwordController
                      )
                    ],
                  )
                ),
              ),
            )
          )
        );
      },
    );
  }

  final Widget _logo = Image.asset(
    'assets/logos/logo.png',
    width: 240,
    height: 240,
  );

  Widget _container(
    BuildContext context,
    LoginState state,
    TextEditingController userController,
    TextEditingController password
  ) {
    final size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      constraints: _customConstraint(size),
      child: Card(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextField(
                  labelText: 'Usuario',
                  icon: const Icon(Icons.person),
                  controller: userController,
                  errorText: state.loginErrorState.userName,
                  onChanged: context.read<LoginScreenBloc>().onUserNameChanged,
                ),
                CustomPasswordTextField(
                  labelText: 'Contraseña',
                  icon: const Icon(Icons.lock),
                  padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
                  controller: passwordController,
                  errorText: state.loginErrorState.password,
                  onChanged: context.read<LoginScreenBloc>().onPasswordChanged,
                ),
                PrimaryButton(
                  text: 'Iniciar Sesión',
                  radius: 10,
                  width: 170,
                  padding: const EdgeInsets.only(top: 20),
                  isLoading: false,
                  onPressedCallback: context.read<LoginScreenBloc>().onErrors
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  final BoxDecoration _customBoxDecoration = const BoxDecoration(
      gradient: RadialGradient(
          radius: 0.9, colors: [Color(0x78FF0A1A), Color(0xFFFF0B0B)]));

  BoxConstraints? _customConstraint(Size size) {
    if (size.width >= 480) {
      return const BoxConstraints(maxWidth: 480);
    } else {
      return null;
    }
  }
}
