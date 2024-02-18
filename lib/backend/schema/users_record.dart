import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "bio" field.
  String? _bio;
  String get bio => _bio ?? '';
  bool hasBio() => _bio != null;

  // "password" field.
  String? _password;
  String get password => _password ?? '';
  bool hasPassword() => _password != null;

  // "conversions" field.
  List<ConversionStruct>? _conversions;
  List<ConversionStruct> get conversions => _conversions ?? const [];
  bool hasConversions() => _conversions != null;

  // "credits" field.
  int? _credits;
  int get credits => _credits ?? 0;
  bool hasCredits() => _credits != null;

  // "standard_subscription" field.
  bool? _standardSubscription;
  bool get standardSubscription => _standardSubscription ?? false;
  bool hasStandardSubscription() => _standardSubscription != null;

  // "pro_subscription" field.
  bool? _proSubscription;
  bool get proSubscription => _proSubscription ?? false;
  bool hasProSubscription() => _proSubscription != null;

  // "bug_submissions" field.
  List<BugSubmissionStruct>? _bugSubmissions;
  List<BugSubmissionStruct> get bugSubmissions => _bugSubmissions ?? const [];
  bool hasBugSubmissions() => _bugSubmissions != null;

  // "feature_submissions" field.
  List<FeatureRequestSubmissionStruct>? _featureSubmissions;
  List<FeatureRequestSubmissionStruct> get featureSubmissions =>
      _featureSubmissions ?? const [];
  bool hasFeatureSubmissions() => _featureSubmissions != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _bio = snapshotData['bio'] as String?;
    _password = snapshotData['password'] as String?;
    _conversions = getStructList(
      snapshotData['conversions'],
      ConversionStruct.fromMap,
    );
    _credits = castToType<int>(snapshotData['credits']);
    _standardSubscription = snapshotData['standard_subscription'] as bool?;
    _proSubscription = snapshotData['pro_subscription'] as bool?;
    _bugSubmissions = getStructList(
      snapshotData['bug_submissions'],
      BugSubmissionStruct.fromMap,
    );
    _featureSubmissions = getStructList(
      snapshotData['feature_submissions'],
      FeatureRequestSubmissionStruct.fromMap,
    );
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? bio,
  String? password,
  int? credits,
  bool? standardSubscription,
  bool? proSubscription,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'bio': bio,
      'password': password,
      'credits': credits,
      'standard_subscription': standardSubscription,
      'pro_subscription': proSubscription,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.bio == e2?.bio &&
        e1?.password == e2?.password &&
        listEquality.equals(e1?.conversions, e2?.conversions) &&
        e1?.credits == e2?.credits &&
        e1?.standardSubscription == e2?.standardSubscription &&
        e1?.proSubscription == e2?.proSubscription &&
        listEquality.equals(e1?.bugSubmissions, e2?.bugSubmissions) &&
        listEquality.equals(e1?.featureSubmissions, e2?.featureSubmissions);
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.bio,
        e?.password,
        e?.conversions,
        e?.credits,
        e?.standardSubscription,
        e?.proSubscription,
        e?.bugSubmissions,
        e?.featureSubmissions
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
