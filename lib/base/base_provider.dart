import 'dart:async';

import 'package:flutter/material.dart';
import 'package:invoice_web/base/mixin/subscription_mixin.dart';

class BaseProvider extends ChangeNotifier with StreamSubscriptionMixin {
  final BuildContext context;

  bool isClosed = false;

  BaseProvider(this.context) {
    Timer.run(onCreate);
  }

  @protected
  @mustCallSuper
  void onCreate() {}

  @override
  void dispose() {
    isClosed = true;
    cancelSubscriptions();
    super.dispose();
  }

  @override
  void showErrorMessage(String message) {
    ScaffoldMessenger?.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
