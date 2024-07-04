import 'package:flutter/material.dart';

import 'base_model.dart';

@immutable
class VersionModel extends BaseFirebaseModel<VersionModel> {
  final String? number;

  const VersionModel({
    this.number,
    String? id,
  }) : super(id);

  @override
  Map<String, dynamic> get toJson => {'number': number, 'id': id};

  @override
  VersionModel fromJson(Map<String, dynamic> json) => VersionModel(
        number: json['number'],
        id: json['id'],
      );
}
