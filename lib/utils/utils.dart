import 'package:flutter/material.dart';

showLoadingDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    },
  );
}
