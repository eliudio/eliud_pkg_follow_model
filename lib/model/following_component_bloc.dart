/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 following_component_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:eliud_pkg_follow_model/model/following_component_event.dart';
import 'package:eliud_pkg_follow_model/model/following_component_state.dart';
import 'package:eliud_pkg_follow_model/model/following_repository.dart';

class FollowingComponentBloc
    extends Bloc<FollowingComponentEvent, FollowingComponentState> {
  final FollowingRepository? followingRepository;
  StreamSubscription? _followingSubscription;

  void _mapLoadFollowingComponentUpdateToState(String documentId) {
    _followingSubscription?.cancel();
    _followingSubscription = followingRepository!.listenTo(documentId, (value) {
      if (value != null) {
        add(FollowingComponentUpdated(value: value));
      }
    });
  }

  /*
   * Construct FollowingComponentBloc
   */
  FollowingComponentBloc({this.followingRepository})
      : super(FollowingComponentUninitialized()) {
    on<FetchFollowingComponent>((event, emit) {
      _mapLoadFollowingComponentUpdateToState(event.id!);
    });
    on<FollowingComponentUpdated>((event, emit) {
      emit(FollowingComponentLoaded(value: event.value));
    });
  }

  /*
   * Close the FollowingComponentBloc
   */
  @override
  Future<void> close() {
    _followingSubscription?.cancel();
    return super.close();
  }
}
