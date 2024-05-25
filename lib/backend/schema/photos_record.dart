import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class PhotosRecord extends FirestoreRecord {
  PhotosRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "images" field.
  String? _images;
  String get images => _images ?? '';
  bool hasImages() => _images != null;

  void _initializeFields() {
    _images = snapshotData['images'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('photos');

  static Stream<PhotosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PhotosRecord.fromSnapshot(s));

  static Future<PhotosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PhotosRecord.fromSnapshot(s));

  static PhotosRecord fromSnapshot(DocumentSnapshot snapshot) => PhotosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PhotosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PhotosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PhotosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PhotosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPhotosRecordData({
  String? images,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'images': images,
    }.withoutNulls,
  );

  return firestoreData;
}

class PhotosRecordDocumentEquality implements Equality<PhotosRecord> {
  const PhotosRecordDocumentEquality();

  @override
  bool equals(PhotosRecord? e1, PhotosRecord? e2) {
    return e1?.images == e2?.images;
  }

  @override
  int hash(PhotosRecord? e) => const ListEquality().hash([e?.images]);

  @override
  bool isValidKey(Object? o) => o is PhotosRecord;
}
