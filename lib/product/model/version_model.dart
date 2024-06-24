import '../utilities/base/base_model.dart';

class VersionModel extends BaseFirebaseModel<VersionModel> implements IdModel {
  String? number;
  VersionModel({this.number});

  Map<String, dynamic> toJson() => {'number': number};

  @override
  VersionModel fromJson(Map<String, dynamic> json) =>
      VersionModel(number: json['number']);

  @override
  String? get id => '';
}
