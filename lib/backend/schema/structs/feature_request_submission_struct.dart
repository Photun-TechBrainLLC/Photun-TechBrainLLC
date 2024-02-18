// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FeatureRequestSubmissionStruct extends FFFirebaseStruct {
  FeatureRequestSubmissionStruct({
    String? uid,
    String? featureName,
    String? featureDescription,
    String? ticketId,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _uid = uid,
        _featureName = featureName,
        _featureDescription = featureDescription,
        _ticketId = ticketId,
        super(firestoreUtilData);

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  set uid(String? val) => _uid = val;
  bool hasUid() => _uid != null;

  // "feature_name" field.
  String? _featureName;
  String get featureName => _featureName ?? '';
  set featureName(String? val) => _featureName = val;
  bool hasFeatureName() => _featureName != null;

  // "feature_description" field.
  String? _featureDescription;
  String get featureDescription => _featureDescription ?? '';
  set featureDescription(String? val) => _featureDescription = val;
  bool hasFeatureDescription() => _featureDescription != null;

  // "ticket_id" field.
  String? _ticketId;
  String get ticketId => _ticketId ?? '';
  set ticketId(String? val) => _ticketId = val;
  bool hasTicketId() => _ticketId != null;

  static FeatureRequestSubmissionStruct fromMap(Map<String, dynamic> data) =>
      FeatureRequestSubmissionStruct(
        uid: data['uid'] as String?,
        featureName: data['feature_name'] as String?,
        featureDescription: data['feature_description'] as String?,
        ticketId: data['ticket_id'] as String?,
      );

  static FeatureRequestSubmissionStruct? maybeFromMap(dynamic data) =>
      data is Map
          ? FeatureRequestSubmissionStruct.fromMap(data.cast<String, dynamic>())
          : null;

  Map<String, dynamic> toMap() => {
        'uid': _uid,
        'feature_name': _featureName,
        'feature_description': _featureDescription,
        'ticket_id': _ticketId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'uid': serializeParam(
          _uid,
          ParamType.String,
        ),
        'feature_name': serializeParam(
          _featureName,
          ParamType.String,
        ),
        'feature_description': serializeParam(
          _featureDescription,
          ParamType.String,
        ),
        'ticket_id': serializeParam(
          _ticketId,
          ParamType.String,
        ),
      }.withoutNulls;

  static FeatureRequestSubmissionStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      FeatureRequestSubmissionStruct(
        uid: deserializeParam(
          data['uid'],
          ParamType.String,
          false,
        ),
        featureName: deserializeParam(
          data['feature_name'],
          ParamType.String,
          false,
        ),
        featureDescription: deserializeParam(
          data['feature_description'],
          ParamType.String,
          false,
        ),
        ticketId: deserializeParam(
          data['ticket_id'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'FeatureRequestSubmissionStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FeatureRequestSubmissionStruct &&
        uid == other.uid &&
        featureName == other.featureName &&
        featureDescription == other.featureDescription &&
        ticketId == other.ticketId;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([uid, featureName, featureDescription, ticketId]);
}

FeatureRequestSubmissionStruct createFeatureRequestSubmissionStruct({
  String? uid,
  String? featureName,
  String? featureDescription,
  String? ticketId,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    FeatureRequestSubmissionStruct(
      uid: uid,
      featureName: featureName,
      featureDescription: featureDescription,
      ticketId: ticketId,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

FeatureRequestSubmissionStruct? updateFeatureRequestSubmissionStruct(
  FeatureRequestSubmissionStruct? featureRequestSubmission, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    featureRequestSubmission
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addFeatureRequestSubmissionStructData(
  Map<String, dynamic> firestoreData,
  FeatureRequestSubmissionStruct? featureRequestSubmission,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (featureRequestSubmission == null) {
    return;
  }
  if (featureRequestSubmission.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      featureRequestSubmission.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final featureRequestSubmissionData = getFeatureRequestSubmissionFirestoreData(
      featureRequestSubmission, forFieldValue);
  final nestedData =
      featureRequestSubmissionData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      featureRequestSubmission.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getFeatureRequestSubmissionFirestoreData(
  FeatureRequestSubmissionStruct? featureRequestSubmission, [
  bool forFieldValue = false,
]) {
  if (featureRequestSubmission == null) {
    return {};
  }
  final firestoreData = mapToFirestore(featureRequestSubmission.toMap());

  // Add any Firestore field values
  featureRequestSubmission.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getFeatureRequestSubmissionListFirestoreData(
  List<FeatureRequestSubmissionStruct>? featureRequestSubmissions,
) =>
    featureRequestSubmissions
        ?.map((e) => getFeatureRequestSubmissionFirestoreData(e, true))
        .toList() ??
    [];
