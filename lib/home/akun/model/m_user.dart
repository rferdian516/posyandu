class UserModel {
  String? idUser;
  String? name;
  String? phoneNumber;
  String? provinsi;
  String? kabupaten;
  String? kecamatan;
  String? kelurahan;
  String? puskesmas;
  String? posyandu;
  String? birthDate;
  String? birthPlace;

  UserModel(
      {this.idUser,
      this.name,
      this.phoneNumber,
      this.provinsi,
      this.kabupaten,
      this.kecamatan,
      this.kelurahan,
      this.puskesmas,
      this.posyandu,
      this.birthDate,
      this.birthPlace});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        idUser: json['id'].toString(),
        name: json['name'].toString(),
        phoneNumber: json['phone_number'].toString(),
        provinsi: json['provinsi'].toString(),
        kabupaten: json['kabupaten'].toString(),
        kecamatan: json['kecamatan'].toString(),
        kelurahan: json['kelurahan'].toString(),
        puskesmas: json['puskesmas'].toString(),
        posyandu: json['posyandu'].toString(),
        birthDate: json['birthdate'].toString(),
        birthPlace: json['birthplace'].toString());
  }

  Map<String, dynamic> toJson() => {
        'id': idUser,
        'name': name,
        'phone_number ': phoneNumber,
        'provinsi': provinsi,
        'kabupaten': kabupaten,
        'kecamatan': kecamatan,
        'kelurahan': kelurahan,
        'puskesmas': puskesmas,
        'posyandu': posyandu,
        'birthdate': birthDate,
        'birthplace': birthPlace
      };
}
