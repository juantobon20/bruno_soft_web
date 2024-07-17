import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../widgets/widgets.dart';

void showLoadingDialog(
  BuildContext context,
  { String? message }
) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    showDialog(
      context: context, 
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        content: LoadingDialog(message: message),
      )
    );
  });
}

class LoadingDialog extends StatelessWidget {

  final String? message;
  const LoadingDialog({
    super.key, 
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
              titleText(text: message!),
          ]
        ),
      ),
    );
  }
}

class CustomCircularProgressDialog extends StatelessWidget {
  const CustomCircularProgressDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Card(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: CircularProgressIndicator(strokeWidth: 3),
        ),
      ),
      decoration: BoxDecoration(
        shape: BoxShape.circle
      ),
    );
  }
}