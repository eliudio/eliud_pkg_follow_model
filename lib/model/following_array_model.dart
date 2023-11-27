/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 following_array_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:collection/collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core_helpers/base/model_base.dart';

import 'package:eliud_pkg_follow_model/model/entity_export.dart';

import 'package:eliud_pkg_follow_model/model/following_array_entity.dart';

class FollowingArrayModel implements ModelBase, WithAppId {
  static const String packageName = 'eliud_pkg_follow_model';
  static const String id = 'followingArrays';

  // Member ID
  @override
  String documentID;

  // This is the identifier of the app to which this belongs
  @override
  String appId;
  List<String>? followers;

  FollowingArrayModel({
    required this.documentID,
    required this.appId,
    this.followers,
  });

  @override
  FollowingArrayModel copyWith({
    String? documentID,
    String? appId,
    List<String>? followers,
  }) {
    return FollowingArrayModel(
      documentID: documentID ?? this.documentID,
      appId: appId ?? this.appId,
      followers: followers ?? this.followers,
    );
  }

  @override
  int get hashCode => documentID.hashCode ^ appId.hashCode ^ followers.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FollowingArrayModel &&
          runtimeType == other.runtimeType &&
          documentID == other.documentID &&
          appId == other.appId &&
          ListEquality().equals(followers, other.followers);

  @override
  String toString() {
    String followersCsv = (followers == null) ? '' : followers!.join(', ');

    return 'FollowingArrayModel{documentID: $documentID, appId: $appId, followers: String[] { $followersCsv }}';
  }

  @override
  Future<List<ModelReference>> collectReferences({String? appId}) async {
    List<ModelReference> referencesCollector = [];
    return referencesCollector;
  }

  @override
  FollowingArrayEntity toEntity({String? appId}) {
    return FollowingArrayEntity(
      appId: appId,
      followers: (followers != null) ? followers : null,
    );
  }

  static Future<FollowingArrayModel?> fromEntity(
      String documentID, FollowingArrayEntity? entity) async {
    if (entity == null) return null;
    return FollowingArrayModel(
      documentID: documentID,
      appId: entity.appId ?? '',
      followers: entity.followers,
    );
  }

  static Future<FollowingArrayModel?> fromEntityPlus(
      String documentID, FollowingArrayEntity? entity,
      {String? appId}) async {
    if (entity == null) return null;

    return FollowingArrayModel(
      documentID: documentID,
      appId: entity.appId ?? '',
      followers: entity.followers,
    );
  }
}
