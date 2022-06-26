import 'dart:convert';

class IbuKesehatan {
  int? id;
  int? pregnantWomenId;
  int? height;
  int? weight;
  int? stomachCircumference;
  String? monthDate;
  String? createdAt;
  String? updatedAt;

  IbuKesehatan({
    this.id,
    this.pregnantWomenId,
    this.height,
    this.weight,
    this.stomachCircumference,
    this.monthDate,
    this.createdAt,
    this.updatedAt,
  });

  @override
  String toString() {
    return 'IbuKesehatan(id: $id, pregnantWomenId: $pregnantWomenId, height: $height, weight: $weight, stomachCircumference: $stomachCircumference, monthDate: $monthDate, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  factory IbuKesehatan.fromMap(Map<String, dynamic> data) => IbuKesehatan(
        id: data['id'] as int?,
        pregnantWomenId: data['pregnant_women_id'] as int?,
        height: data['height'] as int?,
        weight: data['weight'] as int?,
        stomachCircumference: data['stomach_circumference'] as int?,
        monthDate: data['month_date'] as String?,
        createdAt: data['created_at'] as String?,
        updatedAt: data['updated_at'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'pregnant_women_id': pregnantWomenId,
        'height': height,
        'weight': weight,
        'stomach_circumference': stomachCircumference,
        'month_date': monthDate,
        'created_at': createdAt,
        'updated_at': updatedAt,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [IbuKesehatan].
  factory IbuKesehatan.fromJson(String data) {
    return IbuKesehatan.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [IbuKesehatan] to a JSON string.
  String toJson() => json.encode(toMap());
}
