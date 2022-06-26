import 'dart:convert';

class IbuModel {
  int? id;
  String? name;
  int? age;
  String? husbandName;
  String? address;
  String? registerAt;
  String? createdAt;
  String? updatedAt;

  IbuModel({
    this.id,
    this.name,
    this.age,
    this.husbandName,
    this.address,
    this.registerAt,
    this.createdAt,
    this.updatedAt,
  });

  @override
  String toString() {
    return 'IbuModel(id: $id, name: $name, age: $age, husbandName: $husbandName, address: $address, registerAt: $registerAt, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  factory IbuModel.fromMap(Map<String, dynamic> data) => IbuModel(
        id: data['id'] as int?,
        name: data['name'] as String?,
        age: data['age'] as int?,
        husbandName: data['husband_name'] as String?,
        address: data['address'] as String?,
        registerAt: data['register_at'] as String?,
        createdAt: data['created_at'] as String?,
        updatedAt: data['updated_at'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'age': age,
        'husband_name': husbandName,
        'address': address,
        'register_at': registerAt,
        'created_at': createdAt,
        'updated_at': updatedAt,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [IbuModel].
  factory IbuModel.fromJson(String data) {
    return IbuModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [IbuModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
