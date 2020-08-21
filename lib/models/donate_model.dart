import 'dart:io';

class Donate {
  final String name;
  final String title;
  final File image;
  final String description;
  final String address;
  final String addressMap;
  final DateTime date;

  Donate({
    this.name,
    this.title,
    this.address,
    this.image,
    this.addressMap,
    this.description,
    this.date
  });
}
