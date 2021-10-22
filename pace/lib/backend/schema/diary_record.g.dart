// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diary_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DiaryRecord> _$diaryRecordSerializer = new _$DiaryRecordSerializer();

class _$DiaryRecordSerializer implements StructuredSerializer<DiaryRecord> {
  @override
  final Iterable<Type> types = const [DiaryRecord, _$DiaryRecord];
  @override
  final String wireName = 'DiaryRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, DiaryRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.diaryContent;
    if (value != null) {
      result
        ..add('diaryContent')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.diaryTitle;
    if (value != null) {
      result
        ..add('diaryTitle')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.diaryTime;
    if (value != null) {
      result
        ..add('diaryTime')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.reference;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    return result;
  }

  @override
  DiaryRecord deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DiaryRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'diaryContent':
          result.diaryContent = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'diaryTitle':
          result.diaryTitle = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'diaryTime':
          result.diaryTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'Document__Reference__Field':
          result.reference = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
      }
    }

    return result.build();
  }
}

class _$DiaryRecord extends DiaryRecord {
  @override
  final String diaryContent;
  @override
  final String diaryTitle;
  @override
  final DateTime diaryTime;
  @override
  final DocumentReference<Object> reference;

  factory _$DiaryRecord([void Function(DiaryRecordBuilder) updates]) =>
      (new DiaryRecordBuilder()..update(updates)).build();

  _$DiaryRecord._(
      {this.diaryContent, this.diaryTitle, this.diaryTime, this.reference})
      : super._();

  @override
  DiaryRecord rebuild(void Function(DiaryRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DiaryRecordBuilder toBuilder() => new DiaryRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DiaryRecord &&
        diaryContent == other.diaryContent &&
        diaryTitle == other.diaryTitle &&
        diaryTime == other.diaryTime &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, diaryContent.hashCode), diaryTitle.hashCode),
            diaryTime.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('DiaryRecord')
          ..add('diaryContent', diaryContent)
          ..add('diaryTitle', diaryTitle)
          ..add('diaryTime', diaryTime)
          ..add('reference', reference))
        .toString();
  }
}

class DiaryRecordBuilder implements Builder<DiaryRecord, DiaryRecordBuilder> {
  _$DiaryRecord _$v;

  String _diaryContent;
  String get diaryContent => _$this._diaryContent;
  set diaryContent(String diaryContent) => _$this._diaryContent = diaryContent;

  String _diaryTitle;
  String get diaryTitle => _$this._diaryTitle;
  set diaryTitle(String diaryTitle) => _$this._diaryTitle = diaryTitle;

  DateTime _diaryTime;
  DateTime get diaryTime => _$this._diaryTime;
  set diaryTime(DateTime diaryTime) => _$this._diaryTime = diaryTime;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  DiaryRecordBuilder() {
    DiaryRecord._initializeBuilder(this);
  }

  DiaryRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _diaryContent = $v.diaryContent;
      _diaryTitle = $v.diaryTitle;
      _diaryTime = $v.diaryTime;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DiaryRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DiaryRecord;
  }

  @override
  void update(void Function(DiaryRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$DiaryRecord build() {
    final _$result = _$v ??
        new _$DiaryRecord._(
            diaryContent: diaryContent,
            diaryTitle: diaryTitle,
            diaryTime: diaryTime,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
