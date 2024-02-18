// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BugSubmissionStruct extends FFFirebaseStruct {
  BugSubmissionStruct({
    String? uid,
    String? bugName,
    String? bugDescription,
    String? bugImage,
    String? ticketId,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _uid = uid,
        _bugName = bugName,
        _bugDescription = bugDescription,
        _bugImage = bugImage,
        _ticketId = ticketId,
        super(firestoreUtilData);

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  set uid(String? val) => _uid = val;
  bool hasUid() => _uid != null;

  // "bug_name" field.
  String? _bugName;
  String get bugName => _bugName ?? '';
  set bugName(String? val) => _bugName = val;
  bool hasBugName() => _bugName != null;

  // "bug_description" field.
  String? _bugDescription;
  String get bugDescription => _bugDescription ?? '';
  set bugDescription(String? val) => _bugDescription = val;
  bool hasBugDescription() => _bugDescription != null;

  // "bug_image" field.
  String? _bugImage;
  String get bugImage => _bugImage ?? '';
  set bugImage(String? val) => _bugImage = val;
  bool hasBugImage() => _bugImage != null;

  // "ticket_id" field.
  String? _ticketId;
  String get ticketId => _ticketId ?? '';
  set ticketId(String? val) => _ticketId = val;
  bool hasTicketId() => _ticketId != null;

  static BugSubmissionStruct fromMap(Map<String, dynamic> data) =>
      BugSubmissionStruct(
        uid: data['uid'] as String?,
        bugName: data['bug_name'] as String?,
        bugDescription: data['bug_description'] as String?,
        bugImage: data['bug_image'] as String?,
        ticketId: data['ticket_id'] as String?,
      );

  static BugSubmissionStruct? maybeFromMap(dynamic data) => data is Map
      ? BugSubmissionStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'uid': _uid,
        'bug_name': _bugName,
        'bug_description': _bugDescription,
        'bug_image': _bugImage,
        'ticket_id': _ticketId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'uid': serializeParam(
          _uid,
          ParamType.String,
        ),
        'bug_name': serializeParam(
          _bugName,
          ParamType.String,
        ),
        'bug_description': serializeParam(
          _bugDescription,
          ParamType.String,
        ),
        'bug_image': serializeParam(
          _bugImage,
          ParamType.String,
        ),
        'ticket_id': serializeParam(
          _ticketId,
          ParamType.String,
        ),
      }.withoutNulls;

  static BugSubmissionStruct fromSerializableMap(Map<String, dynamic> data) =>
      BugSubmissionStruct(
        uid: deserializeParam(
          data['uid'],
          ParamType.String,
          false,
        ),
        bugName: deserializeParam(
          data['bug_name'],
          ParamType.String,
          false,
        ),
        bugDescription: deserializeParam(
          data['bug_description'],
          ParamType.String,
          false,
        ),
        bugImage: deserializeParam(
          data['bug_image'],
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
  String toString() => 'BugSubmissionStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BugSubmissionStruct &&
        uid == other.uid &&
        bugName == other.bugName &&
        bugDescription == other.bugDescription &&
        bugImage == other.bugImage &&
        ticketId == other.ticketId;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([uid, bugName, bugDescription, bugImage, ticketId]);
}

BugSubmissionStruct createBugSubmissionStruct({
  String? uid,
  String? bugName,
  String? bugDescription,
  String? bugImage,
  String? ticketId,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    BugSubmissionStruct(
      uid: uid,
      bugName: bugName,
      bugDescription: bugDescription,
      bugImage: bugImage,
      ticketId: ticketId,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

BugSubmissionStruct? updateBugSubmissionStruct(
  BugSubmissionStruct? bugSubmission, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    bugSubmission
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addBugSubmissionStructData(
  Map<String, dynamic> firestoreData,
  BugSubmissionStruct? bugSubmission,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (bugSubmission == null) {
    return;
  }
  if (bugSubmission.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && bugSubmission.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final bugSubmissionData =
      getBugSubmissionFirestoreData(bugSubmission, forFieldValue);
  final nestedData =
      bugSubmissionData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = bugSubmission.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getBugSubmissionFirestoreData(
  BugSubmissionStruct? bugSubmission, [
  bool forFieldValue = false,
]) {
  if (bugSubmission == null) {
    return {};
  }
  final firestoreData = mapToFirestore(bugSubmission.toMap());

  // Add any Firestore field values
  bugSubmission.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getBugSubmissionListFirestoreData(
  List<BugSubmissionStruct>? bugSubmissions,
) =>
    bugSubmissions
        ?.map((e) => getBugSubmissionFirestoreData(e, true))
        .toList() ??
    [];
