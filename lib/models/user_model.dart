import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String firstName;
  final String lastName;
  final String city;
  final String country;
  final int zipCode;

  const User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.city,
    required this.country,
    required this.zipCode,
  });

  factory User.initial() {
    return const User(
      id: '',
      firstName: '',
      lastName: '',
      city: '',
      country: '',
      zipCode: 0,
    );
  }

  @override
  List<Object> get props {
    return [
      id,
      firstName,
      lastName,
      city,
      country,
      zipCode,
    ];
  }

  @override
  String toString() {
    return 'User(id: $id, firstName: $firstName, lastName: $lastName, city: $city, country: $country, zipCode: $zipCode)';
  }

  User copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? city,
    String? country,
    int? zipCode,
  }) {
    return User(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      city: city ?? this.city,
      country: country ?? this.country,
      zipCode: zipCode ?? this.zipCode,
    );
  }

  factory User.fromDoc(DocumentSnapshot doc) {
    final Map<String, dynamic> map = doc.data() as Map<String, dynamic>;

    return User(
      id: doc.id,
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      city: map['city'] ?? '',
      country: map['country'] ?? '',
      zipCode: map['zipCode']?.toInt() ?? 0,
    );
  }
}
