import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'completed_conversion_widget.dart' show CompletedConversionWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CompletedConversionModel
    extends FlutterFlowModel<CompletedConversionWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for conversionName widget.
  FocusNode? conversionNameFocusNode;
  TextEditingController? conversionNameController;
  String? Function(BuildContext, String?)? conversionNameControllerValidator;
  // State field(s) for conversionDescription widget.
  FocusNode? conversionDescriptionFocusNode;
  TextEditingController? conversionDescriptionController;
  String? Function(BuildContext, String?)?
      conversionDescriptionControllerValidator;
  // State field(s) for ModelSizeDropdown widget.
  String? modelSizeDropdownValue;
  FormFieldController<String>? modelSizeDropdownValueController;
  // State field(s) for ResolutionDropdown widget.
  String? resolutionDropdownValue;
  FormFieldController<String>? resolutionDropdownValueController;
  // State field(s) for Slider widget.
  double? sliderValue;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    conversionNameFocusNode?.dispose();
    conversionNameController?.dispose();

    conversionDescriptionFocusNode?.dispose();
    conversionDescriptionController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
