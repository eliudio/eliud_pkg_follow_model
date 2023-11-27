/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 invite_dashboard_form_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:eliud_core_main/model/model_export.dart';
import 'package:eliud_pkg_etc_model/model/model_export.dart';
import 'package:eliud_pkg_follow_model/model/model_export.dart';

@immutable
abstract class InviteDashboardFormEvent extends Equatable {
  const InviteDashboardFormEvent();

  @override
  List<Object?> get props => [];
}

class InitialiseNewInviteDashboardFormEvent extends InviteDashboardFormEvent {}

class InitialiseInviteDashboardFormEvent extends InviteDashboardFormEvent {
  final InviteDashboardModel? value;

  @override
  List<Object?> get props => [value];

  InitialiseInviteDashboardFormEvent({this.value});
}

class InitialiseInviteDashboardFormNoLoadEvent
    extends InviteDashboardFormEvent {
  final InviteDashboardModel? value;

  @override
  List<Object?> get props => [value];

  InitialiseInviteDashboardFormNoLoadEvent({this.value});
}

class ChangedInviteDashboardDocumentID extends InviteDashboardFormEvent {
  final String? value;

  ChangedInviteDashboardDocumentID({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedInviteDashboardDocumentID{ value: $value }';
}

class ChangedInviteDashboardAppId extends InviteDashboardFormEvent {
  final String? value;

  ChangedInviteDashboardAppId({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedInviteDashboardAppId{ value: $value }';
}

class ChangedInviteDashboardDescription extends InviteDashboardFormEvent {
  final String? value;

  ChangedInviteDashboardDescription({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedInviteDashboardDescription{ value: $value }';
}

class ChangedInviteDashboardMemberActions extends InviteDashboardFormEvent {
  final List<MemberActionModel>? value;

  ChangedInviteDashboardMemberActions({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedInviteDashboardMemberActions{ value: $value }';
}

class ChangedInviteDashboardConditions extends InviteDashboardFormEvent {
  final StorageConditionsModel? value;

  ChangedInviteDashboardConditions({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedInviteDashboardConditions{ value: $value }';
}
