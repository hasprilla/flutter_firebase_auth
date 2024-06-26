import 'package:flutter/cupertino.dart';


abstract class Dialogs {
  static Future<void> alert(
    BuildContext context, {
    String? title,
    String? content,
    String? okText = 'OK',
  }) {
    return showCupertinoDialog(
      context: context,
      builder: (_) {
        return CupertinoAlertDialog(
          title: title != null
              ? Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                )
              : null,
          content: content != null ? Text(content) : null,
          actions: [
            CupertinoDialogAction(
              child: Text(
                okText!,
              ),
              onPressed: () {
                Navigator.pop(_);
              },
            ),
          ],
        );
      },
    );
  }
}
