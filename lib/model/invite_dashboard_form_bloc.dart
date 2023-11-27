/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 invite_dashboard_form_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:eliud_core_helpers/etc/enums.dart';

import 'package:eliud_pkg_follow_model/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_follow_model/model/model_export.dart';

import 'package:eliud_pkg_follow_model/model/invite_dashboard_form_event.dart';
import 'package:eliud_pkg_follow_model/model/invite_dashboard_form_state.dart';

class InviteDashboardFormBloc
    extends Bloc<InviteDashboardFormEvent, InviteDashboardFormState> {
  final FormAction? formAction;
  final String? appId;

  InviteDashboardFormBloc(this.appId, {this.formAction})
      : super(InviteDashboardFormUninitialized()) {
    on<InitialiseNewInviteDashboardFormEvent>((event, emit) {
      InviteDashboardFormLoaded loaded = InviteDashboardFormLoaded(
          value: InviteDashboardModel(
        documentID: "",
        appId: "",
        description: "",
        memberActions: [],
      ));
      emit(loaded);
    });

    on<InitialiseInviteDashboardFormEvent>((event, emit) async {
      // Need to re-retrieve the document from the repository so that I get all associated types
      InviteDashboardFormLoaded loaded = InviteDashboardFormLoaded(
          value: await inviteDashboardRepository(appId: appId)!
              .get(event.value!.documentID));
      emit(loaded);
    });
    on<InitialiseInviteDashboardFormNoLoadEvent>((event, emit) async {
      InviteDashboardFormLoaded loaded =
          InviteDashboardFormLoaded(value: event.value);
      emit(loaded);
    });
    InviteDashboardModel? newValue;
    on<ChangedInviteDashboardDocumentID>((event, emit) async {
      if (state is InviteDashboardFormInitialized) {
        final currentState = state as InviteDashboardFormInitialized;
        newValue = currentState.value!.copyWith(documentID: event.value);
        if (formAction == FormAction.addAction) {
          emit(await _isDocumentIDValid(event.value, newValue!));
        } else {
          emit(SubmittableInviteDashboardForm(value: newValue));
        }
      }
    });
    on<ChangedInviteDashboardAppId>((event, emit) async {
      if (state is InviteDashboardFormInitialized) {
        final currentState = state as InviteDashboardFormInitialized;
        newValue = currentState.value!.copyWith(appId: event.value);
        emit(SubmittableInviteDashboardForm(value: newValue));
      }
    });
    on<ChangedInviteDashboardDescription>((event, emit) async {
      if (state is InviteDashboardFormInitialized) {
        final currentState = state as InviteDashboardFormInitialized;
        newValue = currentState.value!.copyWith(description: event.value);
        emit(SubmittableInviteDashboardForm(value: newValue));
      }
    });
    on<ChangedInviteDashboardMemberActions>((event, emit) async {
      if (state is InviteDashboardFormInitialized) {
        final currentState = state as InviteDashboardFormInitialized;
        newValue = currentState.value!.copyWith(memberActions: event.value);
        emit(SubmittableInviteDashboardForm(value: newValue));
      }
    });
    on<ChangedInviteDashboardConditions>((event, emit) async {
      if (state is InviteDashboardFormInitialized) {
        final currentState = state as InviteDashboardFormInitialized;
        newValue = currentState.value!.copyWith(conditions: event.value);
        emit(SubmittableInviteDashboardForm(value: newValue));
      }
    });
  }

  DocumentIDInviteDashboardFormError error(
          String message, InviteDashboardModel newValue) =>
      DocumentIDInviteDashboardFormError(message: message, value: newValue);

  Future<InviteDashboardFormState> _isDocumentIDValid(
      String? value, InviteDashboardModel newValue) async {
    if (value == null) {
      return Future.value(error("Provide value for documentID", newValue));
    }
    if (value.isEmpty) {
      return Future.value(error("Provide value for documentID", newValue));
    }
    Future<InviteDashboardModel?> findDocument =
        inviteDashboardRepository(appId: appId)!.get(value);
    return await findDocument.then((documentFound) {
      if (documentFound == null) {
        return SubmittableInviteDashboardForm(value: newValue);
      } else {
        return error("Invalid documentID: already exists", newValue);
      }
    });
  }
}
