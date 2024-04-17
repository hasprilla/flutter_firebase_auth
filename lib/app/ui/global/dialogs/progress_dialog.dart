import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class ProgressDialog {
  static void show(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder: (context) => PopScope(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.black12,
          alignment: Alignment.center,
          child: CircularProgressIndicator(
            strokeWidth: 1,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}
