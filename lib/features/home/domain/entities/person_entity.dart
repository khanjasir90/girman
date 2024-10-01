class PersonDataEntity {
  final String firstName;
  final String lastName;
  final String city;
  final String contactNumber;

  PersonDataEntity({
    required this.firstName,
    required this.lastName,
    required this.city,
    required this.contactNumber,
  });

  factory PersonDataEntity.fromJson(Map<String, dynamic> json) {
    return PersonDataEntity(
      firstName: json['first_name'],
      lastName: json['last_name'],
      city: json['city'],
      contactNumber: json['contact_number'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'city': city,
      'contact_number': contactNumber,
    };
  }
}