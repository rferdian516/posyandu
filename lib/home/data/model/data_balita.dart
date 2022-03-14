import 'dart:convert';

class DataBalita {
  int? id;
  String? name;
  String? gender;
  String? birthdate;
  int? registeredKia;
  int? birthWeight;
  int? birthHeight;
  int? birthCertificate;
  String? fatherName;
  String? motherName;
  dynamic address;
  dynamic deathDate;
  dynamic note;
  dynamic createdAt;
  dynamic updatedAt;

  DataBalita({
    this.id,
    this.name,
    this.gender,
    this.birthdate,
    this.registeredKia,
    this.birthWeight,
    this.birthHeight,
    this.birthCertificate,
    this.fatherName,
    this.motherName,
    this.address,
    this.deathDate,
    this.note,
    this.createdAt,
    this.updatedAt,
  });

  @override
  String toString() {
    return 'DataBalita(id: $id, name: $name, gender: $gender, birthdate: $birthdate, registeredKia: $registeredKia, birthWeight: $birthWeight, birthHeight: $birthHeight, birthCertificate: $birthCertificate, fatherName: $fatherName, motherName: $motherName, address: $address, deathDate: $deathDate, note: $note, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  factory DataBalita.fromMap(Map<String, dynamic> data) => DataBalita(
        id: data['id'] as int?,
        name: data['name'] as String?,
        gender: data['gender'] as String?,
        birthdate: data['birthdate'] as String?,
        registeredKia: data['registered_kia'] as int?,
        birthWeight: data['birth_weight'] as int?,
        birthHeight: data['birth_height'] as int?,
        birthCertificate: data['birth_certificate'] as int?,
        fatherName: data['father_name'] as String?,
        motherName: data['mother_name'] as String?,
        address: data['address'] as dynamic,
        deathDate: data['death_date'] as dynamic,
        note: data['note'] as dynamic,
        createdAt: data['created_at'] as dynamic,
        updatedAt: data['updated_at'] as dynamic,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'gender': gender,
        'birthdate': birthdate,
        'registered_kia': registeredKia,
        'birth_weight': birthWeight,
        'birth_height': birthHeight,
        'birth_certificate': birthCertificate,
        'father_name': fatherName,
        'mother_name': motherName,
        'address': address,
        'death_date': deathDate,
        'note': note,
        'created_at': createdAt,
        'updated_at': updatedAt,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [DataBalita].
  factory DataBalita.fromJson(String data) {
    return DataBalita.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [DataBalita] to a JSON string.
  String toJson() => json.encode(toMap());
}
