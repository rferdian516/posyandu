import 'dart:convert';

class BalitaKesehatan {
  int? height;
  int? weight;
  int? headCircumference;
  int? stomachCircumference;
  int? monthAge;
  String? monthDate;
  int? babyId;
  String? updatedAt;
  String? createdAt;
  int? id;

  BalitaKesehatan({
    this.height,
    this.weight,
    this.headCircumference,
    this.stomachCircumference,
    this.monthAge,
    this.monthDate,
    this.babyId,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  @override
  String toString() {
    return 'BalitaKesehatan(height: $height, weight: $weight, headCircumference: $headCircumference, stomachCircumference: $stomachCircumference, monthAge: $monthAge, monthDate: $monthDate, babyId: $babyId, updatedAt: $updatedAt, createdAt: $createdAt, id: $id)';
  }

  factory BalitaKesehatan.fromMap(Map<String, dynamic> data) {
    return BalitaKesehatan(
      height: data['height'] as int?,
      weight: data['weight'] as int?,
      headCircumference: data['head_circumference'] as int?,
      stomachCircumference: data['stomach_circumference'] as int?,
      monthAge: data['month_age'] as int?,
      monthDate: data['month_date'] as String?,
      babyId: data['baby_id'] as int?,
      updatedAt: data['updated_at'] as String?,
      createdAt: data['created_at'] as String?,
      id: data['id'] as int?,
    );
  }

  Map<String, dynamic> toMap() => {
        'height': height,
        'weight': weight,
        'head_circumference': headCircumference,
        'stomach_circumference': stomachCircumference,
        'month_age': monthAge,
        'month_date': monthDate,
        'baby_id': babyId,
        'updated_at': updatedAt,
        'created_at': createdAt,
        'id': id,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [BalitaKesehatan].
  factory BalitaKesehatan.fromJson(String data) {
    return BalitaKesehatan.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [BalitaKesehatan] to a JSON string.
  String toJson() => json.encode(toMap());
}
