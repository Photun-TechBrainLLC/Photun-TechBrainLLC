import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/stripe/payment_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'puchase_credits_widget.dart' show PuchaseCreditsWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PuchaseCreditsModel extends FlutterFlowModel<PuchaseCreditsWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Stripe Payment] action in Button widget.
  String? standardPaymentId;
  // Stores action output result for [Stripe Payment] action in Button widget.
  String? proPaymentId;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
