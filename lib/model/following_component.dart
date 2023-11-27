/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 following_component.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_pkg_follow_model/model/following_component_bloc.dart';
import 'package:eliud_pkg_follow_model/model/following_component_event.dart';
import 'package:eliud_pkg_follow_model/model/following_model.dart';
import 'package:eliud_pkg_follow_model/model/following_component_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core_main/apis/style/style_registry.dart';
import 'abstract_repository_singleton.dart';
import 'package:eliud_core_main/widgets/alert_widget.dart';
import 'package:eliud_core_main/model/app_model.dart';

/*
 * AbstractFollowingComponent is the base class to extend / implement in case you need to implement a component
 */
abstract class AbstractFollowingComponent extends StatelessWidget {
  static String componentName = "followings";
  final AppModel app;
  final String followingId;

  /*
   * Construct AbstractFollowingComponent
   */
  AbstractFollowingComponent(
      {super.key, required this.app, required this.followingId});

  /*
   * build the component
   */
  @override
  Widget build(BuildContext context) {
    return BlocProvider<FollowingComponentBloc>(
      create: (context) => FollowingComponentBloc(
          followingRepository: followingRepository(appId: app.documentID)!)
        ..add(FetchFollowingComponent(id: followingId)),
      child: _followingBlockBuilder(context),
    );
  }

  Widget _followingBlockBuilder(BuildContext context) {
    return BlocBuilder<FollowingComponentBloc, FollowingComponentState>(
        builder: (context, state) {
      if (state is FollowingComponentLoaded) {
        return yourWidget(context, state.value);
      } else if (state is FollowingComponentPermissionDenied) {
        return Icon(
          Icons.highlight_off,
          color: Colors.red,
          size: 30.0,
        );
      } else if (state is FollowingComponentError) {
        return AlertWidget(app: app, title: 'Error', content: state.message);
      } else {
        return Center(
          child: StyleRegistry.registry()
              .styleWithApp(app)
              .frontEndStyle()
              .progressIndicatorStyle()
              .progressIndicator(app, context),
        );
      }
    });
  }

  /*
   * Implement this method to provide your widget
   */
  Widget yourWidget(BuildContext context, FollowingModel value);
}
