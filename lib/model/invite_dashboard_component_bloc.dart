/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 invite_dashboard_component_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:eliud_pkg_follow_model/model/invite_dashboard_component_event.dart';
import 'package:eliud_pkg_follow_model/model/invite_dashboard_component_state.dart';
import 'package:eliud_pkg_follow_model/model/invite_dashboard_repository.dart';

class InviteDashboardComponentBloc
    extends Bloc<InviteDashboardComponentEvent, InviteDashboardComponentState> {
  final InviteDashboardRepository? inviteDashboardRepository;
  StreamSubscription? _inviteDashboardSubscription;

  void _mapLoadInviteDashboardComponentUpdateToState(String documentId) {
    _inviteDashboardSubscription?.cancel();
    _inviteDashboardSubscription =
        inviteDashboardRepository!.listenTo(documentId, (value) {
      if (value != null) {
        add(InviteDashboardComponentUpdated(value: value));
      }
    });
  }

  /*
   * Construct InviteDashboardComponentBloc
   */
  InviteDashboardComponentBloc({this.inviteDashboardRepository})
      : super(InviteDashboardComponentUninitialized()) {
    on<FetchInviteDashboardComponent>((event, emit) {
      _mapLoadInviteDashboardComponentUpdateToState(event.id!);
    });
    on<InviteDashboardComponentUpdated>((event, emit) {
      emit(InviteDashboardComponentLoaded(value: event.value));
    });
  }

  /*
   * Close the InviteDashboardComponentBloc
   */
  @override
  Future<void> close() {
    _inviteDashboardSubscription?.cancel();
    return super.close();
  }
}
