import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DishesRecord extends FirestoreRecord {
  DishesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "desc" field.
  String? _desc;
  String get desc => _desc ?? '';
  bool hasDesc() => _desc != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "img" field.
  String? _img;
  String get img => _img ?? '';
  bool hasImg() => _img != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _desc = snapshotData['desc'] as String?;
    _price = castToType<double>(snapshotData['price']);
    _img = snapshotData['img'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('dishes')
          : FirebaseFirestore.instance.collectionGroup('dishes');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('dishes').doc();

  static Stream<DishesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DishesRecord.fromSnapshot(s));

  static Future<DishesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DishesRecord.fromSnapshot(s));

  static DishesRecord fromSnapshot(DocumentSnapshot snapshot) => DishesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DishesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DishesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DishesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DishesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDishesRecordData({
  String? name,
  String? desc,
  double? price,
  String? img,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'desc': desc,
      'price': price,
      'img': img,
    }.withoutNulls,
  );

  return firestoreData;
}

class DishesRecordDocumentEquality implements Equality<DishesRecord> {
  const DishesRecordDocumentEquality();

  @override
  bool equals(DishesRecord? e1, DishesRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.desc == e2?.desc &&
        e1?.price == e2?.price &&
        e1?.img == e2?.img;
  }

  @override
  int hash(DishesRecord? e) =>
      const ListEquality().hash([e?.name, e?.desc, e?.price, e?.img]);

  @override
  bool isValidKey(Object? o) => o is DishesRecord;
}
