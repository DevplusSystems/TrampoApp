class UserModel {
  final dynamic assignedDoctor;
  final int? associateBranches;
  final dynamic associatedClinic;
  final dynamic city;
  final dynamic country;
  final dynamic dateOfBirth;
  final dynamic disease;
  String? email;
  final bool emailAsUsername;
  final dynamic emergencyContactEmail;
  final dynamic emergencyContactMobileNumber;
  final dynamic emergencyContactName;
  final dynamic emergencyContactRelationship;
  final String? firstName;
  final dynamic gender;
  final dynamic house;
  final int? id;
  final String? image;
  final dynamic language;
  final dynamic lastName;
  String? mobileNumber;
  final bool mobileNumberAsUsername;
  final dynamic occupation;
  final String? otpVerificationType;
  final dynamic salutation;
  final dynamic startDate;
  final dynamic state;
  final String? status;
  final dynamic streetAddress;
  final String? username;
  final dynamic zipCode;

  final String? countryName;
  final String? cityName;
  final String? stateName;

  UserModel({
    this.assignedDoctor,
    this.associateBranches,
    this.associatedClinic,
    this.city,
    this.country,
    this.dateOfBirth,
    this.disease,
    this.email,
    this.emailAsUsername = false,
    this.emergencyContactEmail,
    this.emergencyContactMobileNumber,
    this.emergencyContactName,
    this.emergencyContactRelationship,
    this.firstName,
    this.gender,
    this.house,
    this.id,
    this.image,
    this.language,
    this.lastName,
    this.mobileNumber,
    this.mobileNumberAsUsername = false,
    this.occupation,
    this.otpVerificationType,
    this.salutation,
    this.startDate,
    this.state,
    this.status,
    this.streetAddress,
    this.username,
    this.zipCode,
    this.countryName,
    this.cityName,
    this.stateName,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      assignedDoctor: json['assigned_doctor'],
      associateBranches: json['associate_branches'],
      associatedClinic: json['associated_clinic'],
      city: json['city'],
      country: json['country'],
      dateOfBirth: json['date_of_birth'],
      disease: json['disease'],
      email: json['email'],
      emailAsUsername: json['email_as_username'] ?? false,
      emergencyContactEmail: json['emergency_contact_email'],
      emergencyContactMobileNumber: json['emergency_contact_mobile_number'],
      emergencyContactName: json['emergency_contact_name'],
      emergencyContactRelationship: json['emergency_contact_relationship'],
      firstName: json['first_name'],
      gender: json['gender'],
      house: json['house'],
      id: json['id'],
      image: json['image'],
      language: json['language'],
      lastName: json['last_name'],
      mobileNumber: json['mobile_number'],
      mobileNumberAsUsername: json['mobile_number_as_username'] ?? false,
      occupation: json['occupation'],
      otpVerificationType: json['otp_verification_type'],
      salutation: json['salutation'],
      startDate: json['start_date'],
      state: json['state'],
      status: json['status'],
      streetAddress: json['street_address'],
      username: json['username'],
      zipCode: json['zip_code'],
      countryName: json['country_name'],
      cityName: json['city_name'],
      stateName: json['state_name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'assigned_doctor': assignedDoctor,
      'associate_branches': associateBranches,
      'associated_clinic': associatedClinic,
      'city': city,
      'country': country,
      'date_of_birth': dateOfBirth,
      'disease': disease,
      'email': email,
      'email_as_username': emailAsUsername,
      'emergency_contact_email': emergencyContactEmail,
      'emergency_contact_mobile_number': emergencyContactMobileNumber,
      'emergency_contact_name': emergencyContactName,
      'emergency_contact_relationship': emergencyContactRelationship,
      'first_name': firstName,
      'gender': gender,
      'house': house,
      'id': id,
      'image': image,
      'language': language,
      'last_name': lastName,
      'mobile_number': mobileNumber,
      'mobile_number_as_username': mobileNumberAsUsername,
      'occupation': occupation,
      'otp_verification_type': otpVerificationType,
      'salutation': salutation,
      'start_date': startDate,
      'state': state,
      'status': status,
      'street_address': streetAddress,
      'username': username,
      'zip_code': zipCode,
      'country_name': countryName,
      'city_name': cityName,
      'state_name': stateName,
    };
  }
}
