class PersonDataModel {
  final String firstName;
  final String lastName;
  final String city;
  final String contactNumber;

  PersonDataModel({
    required this.firstName,
    required this.lastName,
    required this.city,
    required this.contactNumber,
  });

  factory PersonDataModel.fromJson(Map<String, dynamic> json) {
    return PersonDataModel(
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