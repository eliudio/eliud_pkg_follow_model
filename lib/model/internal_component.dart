/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 model/internal_component.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core_main/apis/registryapi/component/component_constructor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core_helpers/query/query_tools.dart';

import 'package:eliud_core_helpers/tools/has_fab.dart';

import 'package:eliud_pkg_follow_model/model/following_list_bloc.dart';
import 'package:eliud_pkg_follow_model/model/following_list.dart';
import 'package:eliud_pkg_follow_model/model/following_dropdown_button.dart';
import 'package:eliud_pkg_follow_model/model/following_list_event.dart';

import 'package:eliud_pkg_follow_model/model/abstract_repository_singleton.dart';
import 'package:eliud_core_main/model/model_export.dart';

import 'package:eliud_pkg_follow_model/model/following_dashboard_list_bloc.dart';
import 'package:eliud_pkg_follow_model/model/following_dashboard_list.dart';
import 'package:eliud_pkg_follow_model/model/following_dashboard_dropdown_button.dart';
import 'package:eliud_pkg_follow_model/model/following_dashboard_list_event.dart';

import 'package:eliud_pkg_follow_model/model/follow_request_list_bloc.dart';
import 'package:eliud_pkg_follow_model/model/follow_request_list.dart';
import 'package:eliud_pkg_follow_model/model/follow_request_dropdown_button.dart';
import 'package:eliud_pkg_follow_model/model/follow_request_list_event.dart';

import 'package:eliud_pkg_follow_model/model/follow_requests_dashboard_list_bloc.dart';
import 'package:eliud_pkg_follow_model/model/follow_requests_dashboard_list.dart';
import 'package:eliud_pkg_follow_model/model/follow_requests_dashboard_dropdown_button.dart';
import 'package:eliud_pkg_follow_model/model/follow_requests_dashboard_list_event.dart';

import 'package:eliud_pkg_follow_model/model/invite_dashboard_list_bloc.dart';
import 'package:eliud_pkg_follow_model/model/invite_dashboard_list.dart';
import 'package:eliud_pkg_follow_model/model/invite_dashboard_dropdown_button.dart';
import 'package:eliud_pkg_follow_model/model/invite_dashboard_list_event.dart';

class ListComponentFactory implements ComponentConstructor {
  @override
  Widget? createNew(
      {Key? key,
      required AppModel app,
      required String id,
      int? privilegeLevel,
      Map<String, dynamic>? parameters}) {
    return ListComponent(app: app, componentId: id);
  }

  @override
  dynamic getModel({required AppModel app, required String id}) {
    return null;
  }
}

typedef DropdownButtonChanged = Function(String? value, int? privilegeLevel);

class DropdownButtonComponentFactory implements ComponentDropDown {
  @override
  dynamic getModel({required AppModel app, required String id}) {
    return null;
  }

  @override
  bool supports(String id) {
    if (id == "followings") return true;
    if (id == "followingDashboards") return true;
    if (id == "followRequests") return true;
    if (id == "followRequestsDashboards") return true;
    if (id == "inviteDashboards") return true;
    return false;
  }

  @override
  Widget createNew(
      {Key? key,
      required AppModel app,
      required String id,
      int? privilegeLevel,
      Map<String, dynamic>? parameters,
      String? value,
      DropdownButtonChanged? trigger,
      bool? optional}) {
    if (id == "followings") {
      return DropdownButtonComponent(
          app: app,
          componentId: id,
          value: value,
          privilegeLevel: privilegeLevel,
          trigger: trigger,
          optional: optional);
    }

    if (id == "followingDashboards") {
      return DropdownButtonComponent(
          app: app,
          componentId: id,
          value: value,
          privilegeLevel: privilegeLevel,
          trigger: trigger,
          optional: optional);
    }

    if (id == "followRequests") {
      return DropdownButtonComponent(
          app: app,
          componentId: id,
          value: value,
          privilegeLevel: privilegeLevel,
          trigger: trigger,
          optional: optional);
    }

    if (id == "followRequestsDashboards") {
      return DropdownButtonComponent(
          app: app,
          componentId: id,
          value: value,
          privilegeLevel: privilegeLevel,
          trigger: trigger,
          optional: optional);
    }

    if (id == "inviteDashboards") {
      return DropdownButtonComponent(
          app: app,
          componentId: id,
          value: value,
          privilegeLevel: privilegeLevel,
          trigger: trigger,
          optional: optional);
    }

    return Text("Id $id not found");
  }
}

class ListComponent extends StatelessWidget with HasFab {
  final AppModel app;
  final String? componentId;
  final Widget? widget;
  final int? privilegeLevel;

  @override
  Widget? fab(BuildContext context) {
    if ((widget != null) && (widget is HasFab)) {
      HasFab hasFab = widget as HasFab;
      return hasFab.fab(context);
    }
    return null;
  }

  ListComponent({required this.app, this.privilegeLevel, this.componentId})
      : widget = getWidget(componentId, app);

  @override
  Widget build(BuildContext context) {
    if (componentId == 'followings') {
      return _followingBuild(context);
    }
    if (componentId == 'followingDashboards') {
      return _followingDashboardBuild(context);
    }
    if (componentId == 'followRequests') {
      return _followRequestBuild(context);
    }
    if (componentId == 'followRequestsDashboards') {
      return _followRequestsDashboardBuild(context);
    }
    if (componentId == 'inviteDashboards') {
      return _inviteDashboardBuild(context);
    }
    return Text('Component with componentId == $componentId not found');
  }

  static Widget getWidget(String? componentId, AppModel app) {
    if (componentId == 'followings') {
      return FollowingListWidget(app: app);
    }
    if (componentId == 'followingDashboards') {
      return FollowingDashboardListWidget(app: app);
    }
    if (componentId == 'followRequests') {
      return FollowRequestListWidget(app: app);
    }
    if (componentId == 'followRequestsDashboards') {
      return FollowRequestsDashboardListWidget(app: app);
    }
    if (componentId == 'inviteDashboards') {
      return InviteDashboardListWidget(app: app);
    }
    return Container();
  }

  Widget _followingBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FollowingListBloc>(
          create: (context) => FollowingListBloc(
            eliudQuery: EliudQuery(theConditions: [
              EliudQueryCondition('conditions.privilegeLevelRequired',
                  isEqualTo: privilegeLevel ?? 0),
              EliudQueryCondition('appId', isEqualTo: app.documentID),
            ]),
            followingRepository: followingRepository(appId: app.documentID)!,
          )..add(LoadFollowingList()),
        )
      ],
      child: widget!,
    );
  }

  Widget _followingDashboardBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FollowingDashboardListBloc>(
          create: (context) => FollowingDashboardListBloc(
            eliudQuery: EliudQuery(theConditions: [
              EliudQueryCondition('conditions.privilegeLevelRequired',
                  isEqualTo: privilegeLevel ?? 0),
              EliudQueryCondition('appId', isEqualTo: app.documentID),
            ]),
            followingDashboardRepository:
                followingDashboardRepository(appId: app.documentID)!,
          )..add(LoadFollowingDashboardList()),
        )
      ],
      child: widget!,
    );
  }

  Widget _followRequestBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FollowRequestListBloc>(
          create: (context) => FollowRequestListBloc(
            eliudQuery: EliudQuery(theConditions: [
              EliudQueryCondition('conditions.privilegeLevelRequired',
                  isEqualTo: privilegeLevel ?? 0),
              EliudQueryCondition('appId', isEqualTo: app.documentID),
            ]),
            followRequestRepository:
                followRequestRepository(appId: app.documentID)!,
          )..add(LoadFollowRequestList()),
        )
      ],
      child: widget!,
    );
  }

  Widget _followRequestsDashboardBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FollowRequestsDashboardListBloc>(
          create: (context) => FollowRequestsDashboardListBloc(
            eliudQuery: EliudQuery(theConditions: [
              EliudQueryCondition('conditions.privilegeLevelRequired',
                  isEqualTo: privilegeLevel ?? 0),
              EliudQueryCondition('appId', isEqualTo: app.documentID),
            ]),
            followRequestsDashboardRepository:
                followRequestsDashboardRepository(appId: app.documentID)!,
          )..add(LoadFollowRequestsDashboardList()),
        )
      ],
      child: widget!,
    );
  }

  Widget _inviteDashboardBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InviteDashboardListBloc>(
          create: (context) => InviteDashboardListBloc(
            eliudQuery: EliudQuery(theConditions: [
              EliudQueryCondition('conditions.privilegeLevelRequired',
                  isEqualTo: privilegeLevel ?? 0),
              EliudQueryCondition('appId', isEqualTo: app.documentID),
            ]),
            inviteDashboardRepository:
                inviteDashboardRepository(appId: app.documentID)!,
          )..add(LoadInviteDashboardList()),
        )
      ],
      child: widget!,
    );
  }
}

typedef Changed = Function(String? value, int? privilegeLevel);

class DropdownButtonComponent extends StatelessWidget {
  final AppModel app;
  final String? componentId;
  final String? value;
  final Changed? trigger;
  final bool? optional;
  final int? privilegeLevel;

  DropdownButtonComponent(
      {required this.app,
      this.componentId,
      this.privilegeLevel,
      this.value,
      this.trigger,
      this.optional});

  @override
  Widget build(BuildContext context) {
    if (componentId == 'followings') {
      return _followingBuild(context);
    }
    if (componentId == 'followingDashboards') {
      return _followingDashboardBuild(context);
    }
    if (componentId == 'followRequests') {
      return _followRequestBuild(context);
    }
    if (componentId == 'followRequestsDashboards') {
      return _followRequestsDashboardBuild(context);
    }
    if (componentId == 'inviteDashboards') {
      return _inviteDashboardBuild(context);
    }
    return Text('Component with componentId == $componentId not found');
  }

  Widget _followingBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FollowingListBloc>(
          create: (context) => FollowingListBloc(
            eliudQuery: EliudQuery(theConditions: [
              EliudQueryCondition('conditions.privilegeLevelRequired',
                  isEqualTo: privilegeLevel ?? 0),
              EliudQueryCondition('appId', isEqualTo: app.documentID),
            ]),
            followingRepository: followingRepository(appId: app.documentID)!,
          )..add(LoadFollowingList()),
        )
      ],
      child: FollowingDropdownButtonWidget(
          app: app,
          value: value,
          privilegeLevel: privilegeLevel,
          trigger: trigger,
          optional: optional),
    );
  }

  Widget _followingDashboardBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FollowingDashboardListBloc>(
          create: (context) => FollowingDashboardListBloc(
            eliudQuery: EliudQuery(theConditions: [
              EliudQueryCondition('conditions.privilegeLevelRequired',
                  isEqualTo: privilegeLevel ?? 0),
              EliudQueryCondition('appId', isEqualTo: app.documentID),
            ]),
            followingDashboardRepository:
                followingDashboardRepository(appId: app.documentID)!,
          )..add(LoadFollowingDashboardList()),
        )
      ],
      child: FollowingDashboardDropdownButtonWidget(
          app: app,
          value: value,
          privilegeLevel: privilegeLevel,
          trigger: trigger,
          optional: optional),
    );
  }

  Widget _followRequestBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FollowRequestListBloc>(
          create: (context) => FollowRequestListBloc(
            eliudQuery: EliudQuery(theConditions: [
              EliudQueryCondition('conditions.privilegeLevelRequired',
                  isEqualTo: privilegeLevel ?? 0),
              EliudQueryCondition('appId', isEqualTo: app.documentID),
            ]),
            followRequestRepository:
                followRequestRepository(appId: app.documentID)!,
          )..add(LoadFollowRequestList()),
        )
      ],
      child: FollowRequestDropdownButtonWidget(
          app: app,
          value: value,
          privilegeLevel: privilegeLevel,
          trigger: trigger,
          optional: optional),
    );
  }

  Widget _followRequestsDashboardBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FollowRequestsDashboardListBloc>(
          create: (context) => FollowRequestsDashboardListBloc(
            eliudQuery: EliudQuery(theConditions: [
              EliudQueryCondition('conditions.privilegeLevelRequired',
                  isEqualTo: privilegeLevel ?? 0),
              EliudQueryCondition('appId', isEqualTo: app.documentID),
            ]),
            followRequestsDashboardRepository:
                followRequestsDashboardRepository(appId: app.documentID)!,
          )..add(LoadFollowRequestsDashboardList()),
        )
      ],
      child: FollowRequestsDashboardDropdownButtonWidget(
          app: app,
          value: value,
          privilegeLevel: privilegeLevel,
          trigger: trigger,
          optional: optional),
    );
  }

  Widget _inviteDashboardBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InviteDashboardListBloc>(
          create: (context) => InviteDashboardListBloc(
            eliudQuery: EliudQuery(theConditions: [
              EliudQueryCondition('conditions.privilegeLevelRequired',
                  isEqualTo: privilegeLevel ?? 0),
              EliudQueryCondition('appId', isEqualTo: app.documentID),
            ]),
            inviteDashboardRepository:
                inviteDashboardRepository(appId: app.documentID)!,
          )..add(LoadInviteDashboardList()),
        )
      ],
      child: InviteDashboardDropdownButtonWidget(
          app: app,
          value: value,
          privilegeLevel: privilegeLevel,
          trigger: trigger,
          optional: optional),
    );
  }
}
