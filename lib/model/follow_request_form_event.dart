/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 follow_request_form_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:eliud_pkg_follow_model/model/model_export.dart';

@immutable
abstract class FollowRequestFormEvent extends Equatable {
  const FollowRequestFormEvent();

  @override
  List<Object?> get props => [];
}

class InitialiseNewFollowRequestFormEvent extends FollowRequestFormEvent {}

class InitialiseFollowRequestFormEvent extends FollowRequestFormEvent {
  final FollowRequestModel? value;

  @override
  List<Object?> get props => [value];

  InitialiseFollowRequestFormEvent({this.value});
}

class InitialiseFollowRequestFormNoLoadEvent extends FollowRequestFormEvent {
  final FollowRequestModel? value;

  @override
  List<Object?> get props => [value];

  InitialiseFollowRequestFormNoLoadEvent({this.value});
}

class ChangedFollowRequestDocumentID extends FollowRequestFormEvent {
  final String? value;

  ChangedFollowRequestDocumentID({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedFollowRequestDocumentID{ value: $value }';
}

class ChangedFollowRequestAppId extends FollowRequestFormEvent {
  final String? value;

  ChangedFollowRequestAppId({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedFollowRequestAppId{ value: $value }';
}

class ChangedFollowRequestFollower extends FollowRequestFormEvent {
  final String? value;

  ChangedFollowRequestFollower({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedFollowRequestFollower{ value: $value }';
}

class ChangedFollowRequestFollowed extends FollowRequestFormEvent {
  final String? value;

  ChangedFollowRequestFollowed({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedFollowRequestFollowed{ value: $value }';
}

class ChangedFollowRequestStatus extends FollowRequestFormEvent {
  final FollowRequestStatus? value;

  ChangedFollowRequestStatus({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedFollowRequestStatus{ value: $value }';
}
