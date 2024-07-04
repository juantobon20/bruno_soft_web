import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void showLoadingDialog(
  BuildContext context,
  { String? message }
) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    showDialog(
      context: context, 
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        content: _LoadingDialog(message: message),
      )
    );
  });
}

class _LoadingDialog extends StatelessWidget {

  final String? message;
  const _LoadingDialog({
    this.message
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 150,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Lottie.asset(
              'assets/lottie/loading.json',
              width: 100,
              height: 100
            ),
      
            if (message != null)
              Text(message!, style: const TextStyle(fontSize: 16)),
          ]
        ),
      ),
    );
  }
}