import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../domain/domain.dart';
import '../widgets/widgets.dart';

class ErrorDialogProvider {

  final BuildContext context;
  final ErrorData errorData;
  final Function? onRetryPressed;

  ErrorDialogProvider({
    required this.context,
    required this.errorData,
    this.onRetryPressed
  }) {
    switch (errorData.type) {
      case ErrorType.noInternet: 
        _showNoConnectionSheetDialog(context, onRetryPressed);
      case ErrorType.api:
        _showAlertDialog(
          context, 
          errorData.title, 
          errorData.message
        );
    }
  }
}

void _showNoConnectionSheetDialog(BuildContext context, Function? onRetryPressed) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    showModalBottomSheet(
      context: context, 
      isScrollControlled: true,
      isDismissible: false,
      builder: (BuildContext _)  {
        return _NoInternetConnectionWidget(onRetryPressed: onRetryPressed);
      }
    );
  });
}

class _NoInternetConnectionWidget extends StatelessWidget {

  final Function? _onRetryPressed;
  const _NoInternetConnectionWidget({
    Function? onRetryPressed
  }): _onRetryPressed = onRetryPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Lottie.asset('assets/lottie/no_internet.json'),
          ),
      
          PrimaryButton(
            text: 'Reintentar',
            onPressedCallback: () {
              Navigator.pop(context);

              if (_onRetryPressed != null) {
                _onRetryPressed();
              }
            },
          )
        ]
      ),
    );
  }
}

void _showAlertDialog(
  BuildContext context, 
  String title, 
  String message
) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    showDialog(context: context, builder:(context) => 
      AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          FilledButton(
            onPressed: () {
              Navigator.pop(context);
            }, 
            child: const Text('Aceptar'))
        ],
      )
    );
  });
}