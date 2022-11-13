import 'dart:async';

import 'package:invoice_web/base/lazy.dart';


mixin StreamSubscriptionMixin {
  final Lazy<List<StreamSubscription>> _listSubscription = Lazy(() => []);

  List<StreamSubscription> get listSubscription => _listSubscription();

  Future<void> cancelSubscriptions() {
    if (_listSubscription.isCreated) {
      return Future.wait(_listSubscription().map((e) => e.cancel()));
    }
    return Future.value();
  }
}
