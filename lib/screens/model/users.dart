class Users {
  final String? fullName;
  final String? lastName;
  final String? gender;
  final String? country;
  final String? hobby;
  Users(
      {required this.fullName,
      required this.lastName,
      required this.gender,
      required this.country,
      required this.hobby});

  Users copyWith({
    String? fullName,
    String? lastName,
    String? gender,
    String? country,
    String? hobby,
  }) {
    return Users(
      fullName: fullName ?? this.fullName,
      lastName: lastName ?? this.lastName,
      gender: gender ?? this.gender,
      country: country ?? this.country,
      hobby: hobby ?? this.hobby,
    );
  }
}
