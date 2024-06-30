import '../utilities/base/base_model.dart';

class VersionModel extends BaseFirebaseModel<VersionModel> {
  String? number;

  VersionModel({
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
