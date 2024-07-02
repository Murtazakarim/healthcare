class Appointment {
  final DateTime dateOfConsultation;
  final double serviceCharges;
  final double tax;
  final double fees;
  final String paymentMethod;
  final String genderName;
  final String gender;
  final int number;

  Appointment({
    required this.dateOfConsultation,
    required this.serviceCharges,
    required this.tax,
    required this.fees,
    required this.paymentMethod,
    required this.genderName,
    required this.gender,
    required this.number,
  });

  // Convert Appointment object to a Map
  Map<String, dynamic> toMap() {
    return {
      'dateOfConsultation': dateOfConsultation.toIso8601String(),
      'serviceCharges': serviceCharges,
      'tax': tax,
      'fees': fees,
      'paymentMethod': paymentMethod,
      'genderName': genderName,
      'gender': gender,
      'number': number,
    };
  }

  // Create Appointment object from a Map
  factory Appointment.fromMap(Map<String, dynamic> map) {
    return Appointment(
      dateOfConsultation: DateTime.parse(map['dateOfConsultation']),
      serviceCharges: map['serviceCharges'],
      tax: map['tax'],
      fees: map['fees'],
      paymentMethod: map['paymentMethod'],
      genderName: map['genderName'],
      gender: map['gender'],
      number: map['number'],
    );
  }
}
