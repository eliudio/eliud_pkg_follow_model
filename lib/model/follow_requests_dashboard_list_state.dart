/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 follow_requests_dashboard_list_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_follow_model/model/follow_requests_dashboard_model.dart';

abstract class FollowRequestsDashboardListState extends Equatable {
  const FollowRequestsDashboardListState();

  @override
  List<Object?> get props => [];
}

class FollowRequestsDashboardListLoading
    extends FollowRequestsDashboardListState {}

class FollowRequestsDashboardListLoaded
    extends FollowRequestsDashboardListState {
  final List<FollowRequestsDashboardModel?>? values;
  final bool? mightHaveMore;

  const FollowRequestsDashboardListLoaded(
      {this.mightHaveMore, this.values = const []});

  @override
  List<Object?> get props => [values, mightHaveMore];

  @override
  String toString() => 'FollowRequestsDashboardListLoaded { values: $values }';

  @override
  bool operator ==(Object other) =>
      other is FollowRequestsDashboardListLoaded &&
      runtimeType == other.runtimeType &&
      ListEquality().equals(values, other.values) &&
      mightHaveMore == other.mightHaveMore;

  @override
  int get hashCode => values.hashCode ^ mightHaveMore.hashCode;
}

class FollowRequestsDashboardNotLoaded
    extends FollowRequestsDashboardListState {}
