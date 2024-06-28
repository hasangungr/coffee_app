import '../utilities/base/base_model.dart';

class VersionModel extends BaseFirebaseModel<VersionModel> {
  String? number;
  VersionModel({this.number});

  @override
  Map<String, dynamic> get toJson => {'number': number};

  @override
  VersionModel fromJson(Map<String, dynamic> json) =>
      VersionModel(number: json['number']);
}
