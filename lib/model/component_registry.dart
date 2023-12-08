/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 model/component_registry.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import '../model/internal_component.dart';
import 'package:eliud_core_main/apis/registryapi/component/component_spec.dart';
import 'abstract_repository_singleton.dart';
import 'package:eliud_core_main/apis/registryapi/component/component_constructor.dart';
import 'package:eliud_core_main/apis/apis.dart';

import 'following_dashboard_component_selector.dart';
import 'follow_requests_dashboard_component_selector.dart';
import 'invite_dashboard_component_selector.dart';

/* 
 * Component registry contains a list of components
 */
class ComponentRegistry {
  /* 
   * Initialise the component registry
   */
  init(
    ComponentConstructor followingDashboardComponentConstructorDefault,
    ComponentEditorConstructor followingDashboardComponentEditorConstructor,
    ComponentConstructor followRequestsDashboardComponentConstructorDefault,
    ComponentEditorConstructor
        followRequestsDashboardComponentEditorConstructor,
    ComponentConstructor inviteDashboardComponentConstructorDefault,
    ComponentEditorConstructor inviteDashboardComponentEditorConstructor,
  ) {
    Apis.apis()
        .getRegistryApi()
        .addInternalComponents('eliud_pkg_follow_model', [
      "followings",
      "followingDashboards",
      "followRequests",
      "followRequestsDashboards",
      "inviteDashboards",
    ]);

    Apis.apis().getRegistryApi().addDropDownSupporter(
        "followingDashboards", DropdownButtonComponentFactory());
    Apis.apis().getRegistryApi().register(
        componentName: "followingDashboards",
        componentConstructor: followingDashboardComponentConstructorDefault);
    Apis.apis().getRegistryApi().addDropDownSupporter(
        "followRequestsDashboards", DropdownButtonComponentFactory());
    Apis.apis().getRegistryApi().register(
        componentName: "followRequestsDashboards",
        componentConstructor:
            followRequestsDashboardComponentConstructorDefault);
    Apis.apis().getRegistryApi().addDropDownSupporter(
        "inviteDashboards", DropdownButtonComponentFactory());
    Apis.apis().getRegistryApi().register(
        componentName: "inviteDashboards",
        componentConstructor: inviteDashboardComponentConstructorDefault);
    Apis.apis()
        .getRegistryApi()
        .addComponentSpec('eliud_pkg_follow_model', 'follow', [
      ComponentSpec(
          'followingDashboards',
          followingDashboardComponentConstructorDefault,
          FollowingDashboardComponentSelector(),
          followingDashboardComponentEditorConstructor,
          ({String? appId}) => followingDashboardRepository(appId: appId)!),
      ComponentSpec(
          'followRequestsDashboards',
          followRequestsDashboardComponentConstructorDefault,
          FollowRequestsDashboardComponentSelector(),
          followRequestsDashboardComponentEditorConstructor,
          ({String? appId}) =>
              followRequestsDashboardRepository(appId: appId)!),
      ComponentSpec(
          'inviteDashboards',
          inviteDashboardComponentConstructorDefault,
          InviteDashboardComponentSelector(),
          inviteDashboardComponentEditorConstructor,
          ({String? appId}) => inviteDashboardRepository(appId: appId)!),
    ]);
    Apis.apis().getRegistryApi().registerRetrieveRepository(
        'eliud_pkg_follow_model',
        'followings',
        ({String? appId}) => followingRepository(appId: appId)!);
    Apis.apis().getRegistryApi().registerRetrieveRepository(
        'eliud_pkg_follow_model',
        'followingDashboards',
        ({String? appId}) => followingDashboardRepository(appId: appId)!);
    Apis.apis().getRegistryApi().registerRetrieveRepository(
        'eliud_pkg_follow_model',
        'followRequests',
        ({String? appId}) => followRequestRepository(appId: appId)!);
    Apis.apis().getRegistryApi().registerRetrieveRepository(
        'eliud_pkg_follow_model',
        'followRequestsDashboards',
        ({String? appId}) => followRequestsDashboardRepository(appId: appId)!);
    Apis.apis().getRegistryApi().registerRetrieveRepository(
        'eliud_pkg_follow_model',
        'inviteDashboards',
        ({String? appId}) => inviteDashboardRepository(appId: appId)!);
  }
}
