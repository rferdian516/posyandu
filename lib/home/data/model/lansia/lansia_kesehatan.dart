import 'dart:convert';

class LansiaKesehatan {
  int? id;
  int? elderlyId;
  int? height;
  int? weight;
  int? headCircumference;
  int? stomachCircumference;
  String? monthDate;
  String? createdAt;
  String? updatedAt;

  LansiaKesehatan({
    this.id,
    this.elderlyId,
    this.height,
    this.weight,
    this.headCircumference,
    this.stomachCircumference,
    this.monthDate,
    this.createdAt,
    this.updatedAt,
  });

  @override
  String toString() {
    return 'LansiaKesehatan(id: $id, elderlyId: $elderlyId, height: $height, weight: $weight, headCircumference: $headCircumference, stomachCircumference: $stomachCircumference, monthDate: $monthDate, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  factory LansiaKesehatan.fromMap(Map<String, dynamic> data) {
    return LansiaKesehatan(
      id: data['id'] as int?,
      elderlyId: data['elderly_id'] as int?,
      height: data['height'] as int?,
      weight: data['weight'] as int?,
      headCircumference: data['head_circumference'] as int?,
      stomachCircumference: data['stomach_circumference'] as int?,
      monthDate: data['month_date'] as String?,
      createdAt: data['created_at'] as String?,
      updatedAt: data['updated_at'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'elderly_id': elderlyId,
        'height': height,
        'weight': weight,
        'head_circumference': headCircumference,
        'stomach_circumference': stomachCircumference,
        'month_date': monthDate,
        'created_at': createdAt,
        'updated_at': updatedAt,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [LansiaKesehatan].
  factory LansiaKesehatan.fromJson(String data) {
    return LansiaKesehatan.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [LansiaKesehatan] to a JSON string.
  String toJson() => json.encode(toMap());
}
