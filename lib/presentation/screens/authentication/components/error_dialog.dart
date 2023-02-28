import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

import '../../../../data/models/auth/custom_error.dart';

void errorDialog({required BuildContext context, required CustomError error}) {
  if (Platform.isIOS) {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title:  Text(error.code),
        content: Text('${error.plugin}\n${error.errMsg}'),
        actions: [
          CupertinoDialogAction(
            child: const Text('Dismiss'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  } else {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
          title:  Text(error.code),
          content: Text('${error.plugin}\n${error.errMsg}'),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Dismiss'),
            ),
          ]),
    );
  }
}
