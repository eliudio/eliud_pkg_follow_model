/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 follow_request_list_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_follow_model/model/follow_request_model.dart';

abstract class FollowRequestListState extends Equatable {
  const FollowRequestListState();

  @override
  List<Object?> get props => [];
}

class FollowRequestListLoading extends FollowRequestListState {}

class FollowRequestListLoaded extends FollowRequestListState {
  final List<FollowRequestModel?>? values;
  final bool? mightHaveMore;

  const FollowRequestListLoaded({this.mightHaveMore, this.values = const []});

  @override
  List<Object?> get props => [values, mightHaveMore];

  @override
  String toString() => 'FollowRequestListLoaded { values: $values }';

  @override
  bool operator ==(Object other) =>
      other is FollowRequestListLoaded &&
      runtimeType == other.runtimeType &&
      ListEquality().equals(values, other.values) &&
      mightHaveMore == other.mightHaveMore;

  @override
  int get hashCode => values.hashCode ^ mightHaveMore.hashCode;
}

class FollowRequestNotLoaded extends FollowRequestListState {}
