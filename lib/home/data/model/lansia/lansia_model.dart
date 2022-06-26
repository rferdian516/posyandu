import 'dart:convert';

class LansiaModel {
  int? id;
  String? name;
  int? age;
  String? address;
  String? diseaseHistory;
  String? birthPlace;
  String? birthDate;
  String? createdAt;
  String? updatedAt;

  LansiaModel({
    this.id,
    this.name,
    this.age,
    this.address,
    this.diseaseHistory,
    this.birthPlace,
    this.birthDate,
    this.createdAt,
    this.updatedAt,
  });

  @override
  String toString() {
    return 'LansiaModel(id: $id, name: $name, age: $age, address: $address, diseaseHistory: $diseaseHistory, birthPlace: $birthPlace, birthDate: $birthDate, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  factory LansiaModel.fromMap(Map<String, dynamic> data) => LansiaModel(
        id: data['id'] as int?,
        name: data['name'] as String?,
        age: data['age'] as int?,
        address: data['address'] as String?,
        diseaseHistory: data['disease_history'] as String?,
        birthPlace: data['birth_place'] as String?,
        birthDate: data['birth_date'] as String?,
        createdAt: data['created_at'] as String?,
        updatedAt: data['updated_at'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'age': age,
        'address': address,
        'disease_history': diseaseHistory,
        'birth_place': birthPlace,
        'birth_date': birthDate,
        'created_at': createdAt,
        'updated_at': updatedAt,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [LansiaModel].
  factory LansiaModel.fromJson(String data) {
    return LansiaModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [LansiaModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
