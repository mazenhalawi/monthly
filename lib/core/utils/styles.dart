// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:mobile_recruitment_test/core/utils/colors.dart';

final LButtonStyle = ButtonStyle(
  foregroundColor: WidgetStateColor.fromMap({
    WidgetState.pressed: LColors.grey,
    WidgetState.any: LColors.shade85,
  }),
  textStyle: WidgetStateProperty.fromMap({
    WidgetState.any: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
  }),
  padding: WidgetStatePropertyAll(
    EdgeInsets.symmetric(vertical: 20, horizontal: 16),
  ),
  backgroundColor: WidgetStateColor.fromMap({
    WidgetState.pressed: LColors.background,
    WidgetState.any: LColors.brand,
  }),
  shape: WidgetStatePropertyAll(
    RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
  ),
);
