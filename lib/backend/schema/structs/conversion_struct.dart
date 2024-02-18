// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ConversionStruct extends FFFirebaseStruct {
  ConversionStruct({
    String? videoToConvert,
    String? convertedVideo,
    String? conversionName,
    String? conversionDescription,
    DateTime? conversionDate,
    int? id,
    int? priority,
    bool? ready,
    String? modelType,
    String? resultResolution,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _videoToConvert = videoToConvert,
        _convertedVideo = convertedVideo,
        _conversionName = conversionName,
        _conversionDescription = conversionDescription,
        _conversionDate = conversionDate,
        _id = id,
        _priority = priority,
        _ready = ready,
        _modelType = modelType,
        _resultResolution = resultResolution,
        super(firestoreUtilData);

  // "video_to_convert" field.
  String? _videoToConvert;
  String get videoToConvert => _videoToConvert ?? '';
  set videoToConvert(String? val) => _videoToConvert = val;
  bool hasVideoToConvert() => _videoToConvert != null;

  // "converted_video" field.
  String? _convertedVideo;
  String get convertedVideo => _convertedVideo ?? '';
  set convertedVideo(String? val) => _convertedVideo = val;
  bool hasConvertedVideo() => _convertedVideo != null;

  // "conversion_name" field.
  String? _conversionName;
  String get conversionName => _conversionName ?? '';
  set conversionName(String? val) => _conversionName = val;
  bool hasConversionName() => _conversionName != null;

  // "conversion_description" field.
  String? _conversionDescription;
  String get conversionDescription => _conversionDescription ?? '';
  set conversionDescription(String? val) => _conversionDescription = val;
  bool hasConversionDescription() => _conversionDescription != null;

  // "conversion_date" field.
  DateTime? _conversionDate;
  DateTime? get conversionDate => _conversionDate;
  set conversionDate(DateTime? val) => _conversionDate = val;
  bool hasConversionDate() => _conversionDate != null;

  // "ID" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;
  void incrementId(int amount) => _id = id + amount;
  bool hasId() => _id != null;

  // "priority" field.
  int? _priority;
  int get priority => _priority ?? 0;
  set priority(int? val) => _priority = val;
  void incrementPriority(int amount) => _priority = priority + amount;
  bool hasPriority() => _priority != null;

  // "ready" field.
  bool? _ready;
  bool get ready => _ready ?? false;
  set ready(bool? val) => _ready = val;
  bool hasReady() => _ready != null;

  // "model_type" field.
  String? _modelType;
  String get modelType => _modelType ?? 'small';
  set modelType(String? val) => _modelType = val;
  bool hasModelType() => _modelType != null;

  // "result_resolution" field.
  String? _resultResolution;
  String get resultResolution => _resultResolution ?? '';
  set resultResolution(String? val) => _resultResolution = val;
  bool hasResultResolution() => _resultResolution != null;

  static ConversionStruct fromMap(Map<String, dynamic> data) =>
      ConversionStruct(
        videoToConvert: data['video_to_convert'] as String?,
        convertedVideo: data['converted_video'] as String?,
        conversionName: data['conversion_name'] as String?,
        conversionDescription: data['conversion_description'] as String?,
        conversionDate: data['conversion_date'] as DateTime?,
        id: castToType<int>(data['ID']),
        priority: castToType<int>(data['priority']),
        ready: data['ready'] as bool?,
        modelType: data['model_type'] as String?,
        resultResolution: data['result_resolution'] as String?,
      );

  static ConversionStruct? maybeFromMap(dynamic data) => data is Map
      ? ConversionStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'video_to_convert': _videoToConvert,
        'converted_video': _convertedVideo,
        'conversion_name': _conversionName,
        'conversion_description': _conversionDescription,
        'conversion_date': _conversionDate,
        'ID': _id,
        'priority': _priority,
        'ready': _ready,
        'model_type': _modelType,
        'result_resolution': _resultResolution,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'video_to_convert': serializeParam(
          _videoToConvert,
          ParamType.String,
        ),
        'converted_video': serializeParam(
          _convertedVideo,
          ParamType.String,
        ),
        'conversion_name': serializeParam(
          _conversionName,
          ParamType.String,
        ),
        'conversion_description': serializeParam(
          _conversionDescription,
          ParamType.String,
        ),
        'conversion_date': serializeParam(
          _conversionDate,
          ParamType.DateTime,
        ),
        'ID': serializeParam(
          _id,
          ParamType.int,
        ),
        'priority': serializeParam(
          _priority,
          ParamType.int,
        ),
        'ready': serializeParam(
          _ready,
          ParamType.bool,
        ),
        'model_type': serializeParam(
          _modelType,
          ParamType.String,
        ),
        'result_resolution': serializeParam(
          _resultResolution,
          ParamType.String,
        ),
      }.withoutNulls;

  static ConversionStruct fromSerializableMap(Map<String, dynamic> data) =>
      ConversionStruct(
        videoToConvert: deserializeParam(
          data['video_to_convert'],
          ParamType.String,
          false,
        ),
        convertedVideo: deserializeParam(
          data['converted_video'],
          ParamType.String,
          false,
        ),
        conversionName: deserializeParam(
          data['conversion_name'],
          ParamType.String,
          false,
        ),
        conversionDescription: deserializeParam(
          data['conversion_description'],
          ParamType.String,
          false,
        ),
        conversionDate: deserializeParam(
          data['conversion_date'],
          ParamType.DateTime,
          false,
        ),
        id: deserializeParam(
          data['ID'],
          ParamType.int,
          false,
        ),
        priority: deserializeParam(
          data['priority'],
          ParamType.int,
          false,
        ),
        ready: deserializeParam(
          data['ready'],
          ParamType.bool,
          false,
        ),
        modelType: deserializeParam(
          data['model_type'],
          ParamType.String,
          false,
        ),
        resultResolution: deserializeParam(
          data['result_resolution'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ConversionStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ConversionStruct &&
        videoToConvert == other.videoToConvert &&
        convertedVideo == other.convertedVideo &&
        conversionName == other.conversionName &&
        conversionDescription == other.conversionDescription &&
        conversionDate == other.conversionDate &&
        id == other.id &&
        priority == other.priority &&
        ready == other.ready &&
        modelType == other.modelType &&
        resultResolution == other.resultResolution;
  }

  @override
  int get hashCode => const ListEquality().hash([
        videoToConvert,
        convertedVideo,
        conversionName,
        conversionDescription,
        conversionDate,
        id,
        priority,
        ready,
        modelType,
        resultResolution
      ]);
}

ConversionStruct createConversionStruct({
  String? videoToConvert,
  String? convertedVideo,
  String? conversionName,
  String? conversionDescription,
  DateTime? conversionDate,
  int? id,
  int? priority,
  bool? ready,
  String? modelType,
  String? resultResolution,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ConversionStruct(
      videoToConvert: videoToConvert,
      convertedVideo: convertedVideo,
      conversionName: conversionName,
      conversionDescription: conversionDescription,
      conversionDate: conversionDate,
      id: id,
      priority: priority,
      ready: ready,
      modelType: modelType,
      resultResolution: resultResolution,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ConversionStruct? updateConversionStruct(
  ConversionStruct? conversion, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    conversion
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addConversionStructData(
  Map<String, dynamic> firestoreData,
  ConversionStruct? conversion,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (conversion == null) {
    return;
  }
  if (conversion.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && conversion.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final conversionData = getConversionFirestoreData(conversion, forFieldValue);
  final nestedData = conversionData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = conversion.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getConversionFirestoreData(
  ConversionStruct? conversion, [
  bool forFieldValue = false,
]) {
  if (conversion == null) {
    return {};
  }
  final firestoreData = mapToFirestore(conversion.toMap());

  // Add any Firestore field values
  conversion.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getConversionListFirestoreData(
  List<ConversionStruct>? conversions,
) =>
    conversions?.map((e) => getConversionFirestoreData(e, true)).toList() ?? [];
