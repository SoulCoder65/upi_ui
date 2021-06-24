import 'package:flutter/material.dart';
class UserData {
  int age;
  String dateAdded;
  String filename;
  String gender;
  String imageUrl;
  String lastServed;
  String source;

  UserData(
      {this.age,
        this.dateAdded,
        this.filename,
        this.gender,
        this.imageUrl,
        this.lastServed,
        this.source});

  UserData.fromJson(Map<String, dynamic> json) {
    age = json['age'];
    dateAdded = json['date_added'];
    filename = json['filename'];
    gender = json['gender'];
    imageUrl = json['image_url'];
    lastServed = json['last_served'];
    source = json['source'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['age'] = this.age;
    data['date_added'] = this.dateAdded;
    data['filename'] = this.filename;
    data['gender'] = this.gender;
    data['image_url'] = this.imageUrl;
    data['last_served'] = this.lastServed;
    data['source'] = this.source;
    return data;
  }
}