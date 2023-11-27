/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 following_dashboard_form_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:eliud_core_helpers/etc/enums.dart';

import 'package:eliud_pkg_follow_model/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_follow_model/model/model_export.dart';

import 'package:eliud_pkg_follow_model/model/following_dashboard_form_event.dart';
import 'package:eliud_pkg_follow_model/model/following_dashboard_form_state.dart';

class FollowingDashboardFormBloc
    extends Bloc<FollowingDashboardFormEvent, FollowingDashboardFormState> {
  final FormAction? formAction;
  final String? appId;

  FollowingDashboardFormBloc(this.appId, {this.formAction})
      : super(FollowingDashboardFormUninitialized()) {
    on<InitialiseNewFollowingDashboardFormEvent>((event, emit) {
      FollowingDashboardFormLoaded loaded = FollowingDashboardFormLoaded(
          value: FollowingDashboardModel(
        documentID: "",
        appId: "",
        description: "",
        memberActions: [],
      ));
      emit(loaded);
    });

    on<InitialiseFollowingDashboardFormEvent>((event, emit) async {
      // Need to re-retrieve the document from the repository so that I get all associated types
      FollowingDashboardFormLoaded loaded = FollowingDashboardFormLoaded(
          value: await followingDashboardRepository(appId: appId)!
              .get(event.value!.documentID));
      emit(loaded);
    });
    on<InitialiseFollowingDashboardFormNoLoadEvent>((event, emit) async {
      FollowingDashboardFormLoaded loaded =
          FollowingDashboardFormLoaded(value: event.value);
      emit(loaded);
    });
    FollowingDashboardModel? newValue;
    on<ChangedFollowingDashboardDocumentID>((event, emit) async {
      if (state is FollowingDashboardFormInitialized) {
        final currentState = state as FollowingDashboardFormInitialized;
        newValue = currentState.value!.copyWith(documentID: event.value);
        if (formAction == FormAction.addAction) {
          emit(await _isDocumentIDValid(event.value, newValue!));
        } else {
          emit(SubmittableFollowingDashboardForm(value: newValue));
        }
      }
    });
    on<ChangedFollowingDashboardAppId>((event, emit) async {
      if (state is FollowingDashboardFormInitialized) {
        final currentState = state as FollowingDashboardFormInitialized;
        newValue = currentState.value!.copyWith(appId: event.value);
        emit(SubmittableFollowingDashboardForm(value: newValue));
      }
    });
    on<ChangedFollowingDashboardDescription>((event, emit) async {
      if (state is FollowingDashboardFormInitialized) {
        final currentState = state as FollowingDashboardFormInitialized;
        newValue = currentState.value!.copyWith(description: event.value);
        emit(SubmittableFollowingDashboardForm(value: newValue));
      }
    });
    on<ChangedFollowingDashboardView>((event, emit) async {
      if (state is FollowingDashboardFormInitialized) {
        final currentState = state as FollowingDashboardFormInitialized;
        newValue = currentState.value!.copyWith(view: event.value);
        emit(SubmittableFollowingDashboardForm(value: newValue));
      }
    });
    on<ChangedFollowingDashboardMemberActions>((event, emit) async {
      if (state is FollowingDashboardFormInitialized) {
        final currentState = state as FollowingDashboardFormInitialized;
        newValue = currentState.value!.copyWith(memberActions: event.value);
        emit(SubmittableFollowingDashboardForm(value: newValue));
      }
    });
    on<ChangedFollowingDashboardConditions>((event, emit) async {
      if (state is FollowingDashboardFormInitialized) {
        final currentState = state as FollowingDashboardFormInitialized;
        newValue = currentState.value!.copyWith(conditions: event.value);
        emit(SubmittableFollowingDashboardForm(value: newValue));
      }
    });
  }

  DocumentIDFollowingDashboardFormError error(
          String message, FollowingDashboardModel newValue) =>
      DocumentIDFollowingDashboardFormError(message: message, value: newValue);

  Future<FollowingDashboardFormState> _isDocumentIDValid(
      String? value, FollowingDashboardModel newValue) async {
    if (value == null) {
      return Future.value(error("Provide value for documentID", newValue));
    }
    if (value.isEmpty) {
      return Future.value(error("Provide value for documentID", newValue));
    }
    Future<FollowingDashboardModel?> findDocument =
        followingDashboardRepository(appId: appId)!.get(value);
    return await findDocument.then((documentFound) {
      if (documentFound == null) {
        return SubmittableFollowingDashboardForm(value: newValue);
      } else {
        return error("Invalid documentID: already exists", newValue);
      }
    });
  }
}
