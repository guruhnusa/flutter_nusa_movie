import 'package:freezed_annotation/freezed_annotation.dart';

part 'actor_model.freezed.dart';
part 'actor_model.g.dart';

@freezed
class ActorModel with _$ActorModel {
  factory ActorModel({
    required String name,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'profile_path') String? profilePath,
  }) = _ActorModel;

  factory ActorModel.fromJson(Map<String, dynamic> json) =>
      _$ActorModelFromJson(json);
}
