import 'package:flutter/material.dart';

abstract class BaseViewModel extends ChangeNotifier {
  bool isLoading = false;
  String snackbarMessage = "";

  Future<dynamic> whileLoading(Future Function() future) {
    return Future.microtask(toLoading)
        .then((_) => future())
        .whenComplete(toIdle);
  }

  void toLoading() {
    if (isLoading) return;
    isLoading = true;
    notifyListeners();
  }

  void toIdle() {
    if (!isLoading) return;
    isLoading = false;
    notifyListeners();
  }

  void callSnackbar(String message) {
    snackbarMessage = message;
    notifyListeners();
    snackbarMessage = "";
    notifyListeners();
  }
}