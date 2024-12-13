import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class User extends Equatable {
  final int? id;
  final String? nickName;
  final String? description;
  final String? birthDay;
  final String? address;
  final String? gender;
  final int? age;
  final int? height;
  final List<dynamic>? images;
  final String? image;
  final String? personalInfo;
  final String? personality;
  final String? interest;
  final String? likePersonality;
  const User({
    this.id,
    this.nickName,
    this.description,
    this.birthDay,
    this.address,
    this.gender,
    this.age,
    this.height,
    this.images,
    this.image,
    this.personalInfo,
    this.personality,
    this.interest,
    this.likePersonality,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json["id"],
        nickName: json["nickName"],
        description: json["description"],
        birthDay: json["birthDay"],
        address: json["address"],
        gender: json["gender"],
        age: json["age"],
        height: json["height"],
        images: List<dynamic>.from(json["images"] ?? []),
        image: json["image"],
        personalInfo: json["personalInfo"],
        personality: json["personality"],
        interest: json["interest"],
        likePersonality: json["likePersonality"]);
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "nickName": nickName,
        "description": description,
        "birthDay": birthDay,
        "address": address,
        "gender": gender,
        "age": age,
        "height": height,
        "images": images,
        "image": image,
        "personalInfo": personalInfo,
        "personality": personality,
        "interest": interest,
        "likePersonality": likePersonality
      };

  @override
  List<Object?> get props => [
        id,
        nickName,
        description,
        birthDay,
        address,
        gender,
        age,
        height,
        images,
        image,
        personalInfo,
        personality,
        interest,
        likePersonality,
      ];

  User copyWith({
    String? id,
    String? nickName,
    String? description,
    String? birthDay,
    String? address,
    String? gender,
    int? age,
    int? height,
    List<String>? images,
    String? image,
    String? personalInfo,
    String? personality,
    String? interest,
    String? likePersonality,
  }) {
    return User(
      id: this.id,
      nickName: nickName ?? this.nickName,
      description: description ?? this.description,
      birthDay: birthDay ?? this.birthDay,
      address: address ?? this.address,
      gender: gender ?? this.gender,
      age: age ?? this.age,
      height: height ?? this.height,
      images: images ?? this.images,
      image: image ?? this.image,
      personalInfo: personalInfo ?? this.personalInfo,
      personality: personality ?? this.personality,
      interest: interest ?? this.interest,
      likePersonality: likePersonality ?? this.likePersonality,
    );
  }
}
