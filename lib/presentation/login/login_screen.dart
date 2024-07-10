import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../configs/config.dart';
import '../../domain/domain.dart';
import '../dialogs/dialog.dart';
import '../widgets/widgets.dart';
import 'login.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController userController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobileDesign = context.isMobileDesign();

    return Background(
      body: BlocConsumer<LoginScreenBloc, LoginState>(
        listener: (context, state) {
          if (state.loading == LoadingEnum.show && isMobileDesign) {
            showLoadingDialog(context, message: "Iniciando sesión");
          } else if (state.loading == LoadingEnum.hide && isMobileDesign) {
            context.pop(context);
          }
      
          if (state.errorData != null) {
            ErrorDialogProvider(
              context: context, 
              errorData: state.errorData!
            );
          }
      
          if (state.navigateToHome) {
            context.push(RouterPath.homeView.path);
          }
        },
        builder: (context, state) {
          return Scaffold(
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
                        passwordController,
                        isMobileDesign
                      )
                    ],
                  )
                ),
              ),
            )
          );
        },
      ),
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
    TextEditingController password,
    bool isMobileDesign
  ) {
    final size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      constraints: _customConstraint(size),
      child: Card(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextField(
                    labelText: 'Usuario',
                    icon: const Icon(Icons.person),
                    controller: userController,
                    errorText: state.userName.error,
                    onChanged: context.read<LoginScreenBloc>().onUserNameChanged,
                  ),
                  CustomPasswordTextField(
                    labelText: 'Contraseña',
                    icon: const Icon(Icons.lock),
                    padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
                    controller: passwordController,
                    errorText: state.password.error,
                    onChanged: context.read<LoginScreenBloc>().onPasswordChanged,
                  ),
                  PrimaryButton(
                    text: 'Iniciar Sesión',
                    radius: 10,
                    width: 170,
                    padding: const EdgeInsets.only(top: 20),
                    isLoading: state.loading == LoadingEnum.show && !isMobileDesign,
                    onPressedCallback: context.read<LoginScreenBloc>().onSubmit
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  final BoxDecoration _customBoxDecoration = const BoxDecoration(
    gradient: RadialGradient(
      radius: 0.9, 
      colors: [Color(0x78FF0A1A), Color(0xFFFF0B0B)]
    )
  );

  BoxConstraints? _customConstraint(Size size) {
    if (size.width >= 480) {
      return const BoxConstraints(maxWidth: 480);
    } else {
      return null;
    }
  }
}
