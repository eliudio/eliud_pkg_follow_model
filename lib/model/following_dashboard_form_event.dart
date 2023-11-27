/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 following_dashboard_form_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:eliud_core_main/model/model_export.dart';
import 'package:eliud_pkg_etc_model/model/model_export.dart';
import 'package:eliud_pkg_follow_model/model/model_export.dart';

@immutable
abstract class FollowingDashboardFormEvent extends Equatable {
  const FollowingDashboardFormEvent();

  @override
  List<Object?> get props => [];
}

class InitialiseNewFollowingDashboardFormEvent
    extends FollowingDashboardFormEvent {}

class InitialiseFollowingDashboardFormEvent
    extends FollowingDashboardFormEvent {
  final FollowingDashboardModel? value;

  @override
  List<Object?> get props => [value];

  InitialiseFollowingDashboardFormEvent({this.value});
}

class InitialiseFollowingDashboardFormNoLoadEvent
    extends FollowingDashboardFormEvent {
  final FollowingDashboardModel? value;

  @override
  List<Object?> get props => [value];

  InitialiseFollowingDashboardFormNoLoadEvent({this.value});
}

class ChangedFollowingDashboardDocumentID extends FollowingDashboardFormEvent {
  final String? value;

  ChangedFollowingDashboardDocumentID({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedFollowingDashboardDocumentID{ value: $value }';
}

class ChangedFollowingDashboardAppId extends FollowingDashboardFormEvent {
  final String? value;

  ChangedFollowingDashboardAppId({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedFollowingDashboardAppId{ value: $value }';
}

class ChangedFollowingDashboardDescription extends FollowingDashboardFormEvent {
  final String? value;

  ChangedFollowingDashboardDescription({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedFollowingDashboardDescription{ value: $value }';
}

class ChangedFollowingDashboardView extends FollowingDashboardFormEvent {
  final FollowingView? value;

  ChangedFollowingDashboardView({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedFollowingDashboardView{ value: $value }';
}

class ChangedFollowingDashboardMemberActions
    extends FollowingDashboardFormEvent {
  final List<MemberActionModel>? value;

  ChangedFollowingDashboardMemberActions({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() =>
      'ChangedFollowingDashboardMemberActions{ value: $value }';
}

class ChangedFollowingDashboardConditions extends FollowingDashboardFormEvent {
  final StorageConditionsModel? value;

  ChangedFollowingDashboardConditions({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedFollowingDashboardConditions{ value: $value }';
}
