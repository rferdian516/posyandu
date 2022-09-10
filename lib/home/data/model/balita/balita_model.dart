import 'dart:convert';

class BalitaModel {
  int? id;
  String? name;
  String? gender;
  String? birthPlace;
  String? birthDate;
  int? childOrder;
  String? motherName;
  String? fatherName;
  String? address;
  String? createdAt;
  String? updatedAt;

  BalitaModel({
    this.id,
    this.name,
    this.gender,
    this.birthPlace,
    this.birthDate,
    this.childOrder,
    this.motherName,
    this.fatherName,
    this.address,
    this.createdAt,
    this.updatedAt,
  });

  @override
  String toString() {
    return 'BalitaModel(id: $id, name: $name, gender: $gender, birthPlace: $birthPlace, birthDate: $birthDate, childOrder: $childOrder, motherName: $motherName, fatherName: $fatherName, address: $address, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  factory BalitaModel.fromMap(Map<String, dynamic> data) => BalitaModel(
        id: data['id'] as int?,
        name: data['name'] as String?,
        gender: data['gender'] as String?,
        birthPlace: data['birth_place'] as String?,
        birthDate: data['birth_date'] as String?,
        childOrder: data['child_order'] as int?,
        motherName: data['mother_name'] as String?,
        fatherName: data['father_name'] as String?,
        address: data['address'] as String?,
        createdAt: data['created_at'] as String?,
        updatedAt: data['updated_at'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'gender': gender,
        'birth_place': birthPlace,
        'birth_date': birthDate,
        'child_order': childOrder,
        'mother_name': motherName,
        'fatger_name': fatherName,
        'address': address,
        'created_at': createdAt,
        'updated_at': updatedAt,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [BalitaModel].
  factory BalitaModel.fromJson(String data) {
    return BalitaModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [BalitaModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
