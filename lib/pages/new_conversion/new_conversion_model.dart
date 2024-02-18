import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/puchase_credits/puchase_credits_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'new_conversion_widget.dart' show NewConversionWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NewConversionModel extends FlutterFlowModel<NewConversionWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

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
