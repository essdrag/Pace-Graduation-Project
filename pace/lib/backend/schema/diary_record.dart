import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'diary_record.g.dart';

abstract class DiaryRecord implements Built<DiaryRecord, DiaryRecordBuilder> {
  static Serializer<DiaryRecord> get serializer => _$diaryRecordSerializer;

  @nullable
  String get diaryContent;

  @nullable
  String get diaryTitle;

  @nullable
  DateTime get diaryTime;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(DiaryRecordBuilder builder) => builder
    ..diaryContent = ''
    ..diaryTitle = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Diary');

  static Stream<DiaryRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  DiaryRecord._();
  factory DiaryRecord([void Function(DiaryRecordBuilder) updates]) =
      _$DiaryRecord;

  static DiaryRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createDiaryRecordData({
  String diaryContent,
  String diaryTitle,
  DateTime diaryTime,
}) =>
    serializers.toFirestore(
        DiaryRecord.serializer,
        DiaryRecord((d) => d
          ..diaryContent = diaryContent
          ..diaryTitle = diaryTitle
          ..diaryTime = diaryTime));
