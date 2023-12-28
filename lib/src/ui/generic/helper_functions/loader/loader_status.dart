import 'package:ahad_heyflutter_application/src/ui/generic/widgets/dialogs/elite_wholesale_customer_dialog_box.dart';
import 'package:flutter/material.dart';

import '../../widgets/loaders/circle_rounded_loader.dart';

class LoaderStatus {
  LoaderStatus._();
  static bool _isLoading = false;
  //ignore: prefer_final_fields
  static List<String> _keysForBlocs = [];

  static void setLoaderToLoading(
    BuildContext context, {
    String? keyForBloc,
  }) {
    if (keyForBloc != null && !_keysForBlocs.contains(keyForBloc)) {
      _keysForBlocs.add(keyForBloc);
    }

    if (!_isLoading) {
      _isLoading = true;
      genericDialogBoxWithWidgets(
        context: context,
        widgets: [
          const CircleRoundedLoader(),
        ],
      );
    }
  }

  static void dismissLoader(
    BuildContext context, {
    String? keyForBloc,
  }) {
    if (keyForBloc == 'all') {
      _keysForBlocs = [];
      Navigator.pop(context);
    }
    if (keyForBloc != null && _keysForBlocs.contains(keyForBloc)) {
      _keysForBlocs.remove(
        keyForBloc,
      );
    }
    if (_isLoading && _keysForBlocs.isEmpty) {
      _isLoading = false;
      Navigator.pop(context);
    }
  }
}
