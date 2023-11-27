/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 follow_request_form.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core_main/model/app_model.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_core_main/apis/action_api/action_model.dart';

import 'package:eliud_core_main/apis/apis.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core_main/apis/style/style_registry.dart';
import 'package:eliud_core_main/model/internal_component.dart';

import 'package:eliud_core_helpers/etc/enums.dart';

import 'package:eliud_core_main/model/model_export.dart';
import 'package:eliud_pkg_follow_model/model/model_export.dart';

import 'package:eliud_pkg_follow_model/model/follow_request_list_bloc.dart';
import 'package:eliud_pkg_follow_model/model/follow_request_list_event.dart';
import 'package:eliud_pkg_follow_model/model/follow_request_model.dart';
import 'package:eliud_pkg_follow_model/model/follow_request_form_bloc.dart';
import 'package:eliud_pkg_follow_model/model/follow_request_form_event.dart';
import 'package:eliud_pkg_follow_model/model/follow_request_form_state.dart';

class FollowRequestForm extends StatelessWidget {
  final AppModel app;
  final FormAction formAction;
  final FollowRequestModel? value;
  final ActionModel? submitAction;

  FollowRequestForm(
      {super.key,
      required this.app,
      required this.formAction,
      required this.value,
      this.submitAction});

  /// Build the FollowRequestForm
  @override
  Widget build(BuildContext context) {
    //var accessState = AccessBloc.getState(context);
    var appId = app.documentID;
    if (formAction == FormAction.showData) {
      return BlocProvider<FollowRequestFormBloc>(
        create: (context) => FollowRequestFormBloc(
          appId,
          formAction: formAction,
        )..add(InitialiseFollowRequestFormEvent(value: value)),
        child: _MyFollowRequestForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    }
    if (formAction == FormAction.showPreloadedData) {
      return BlocProvider<FollowRequestFormBloc>(
        create: (context) => FollowRequestFormBloc(
          appId,
          formAction: formAction,
        )..add(InitialiseFollowRequestFormNoLoadEvent(value: value)),
        child: _MyFollowRequestForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    } else {
      return Scaffold(
          appBar: StyleRegistry.registry()
              .styleWithApp(app)
              .adminFormStyle()
              .appBarWithString(app, context,
                  title: formAction == FormAction.updateAction
                      ? 'Update FollowRequest'
                      : 'Add FollowRequest'),
          body: BlocProvider<FollowRequestFormBloc>(
            create: (context) => FollowRequestFormBloc(
              appId,
              formAction: formAction,
            )..add((formAction == FormAction.updateAction
                ? InitialiseFollowRequestFormEvent(value: value)
                : InitialiseNewFollowRequestFormEvent())),
            child: _MyFollowRequestForm(
                app: app, submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}

class _MyFollowRequestForm extends StatefulWidget {
  final AppModel app;
  final FormAction? formAction;
  final ActionModel? submitAction;

  _MyFollowRequestForm({required this.app, this.formAction, this.submitAction});

  @override
  State<_MyFollowRequestForm> createState() =>
      _MyFollowRequestFormState(formAction);
}

class _MyFollowRequestFormState extends State<_MyFollowRequestForm> {
  final FormAction? formAction;
  late FollowRequestFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();
  String? _follower;
  String? _followed;
  int? _statusSelectedRadioTile;

  _MyFollowRequestFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<FollowRequestFormBloc>(context);
    _documentIDController.addListener(_onDocumentIDChanged);
    _statusSelectedRadioTile = 0;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FollowRequestFormBloc, FollowRequestFormState>(
        builder: (context, state) {
      if (state is FollowRequestFormUninitialized) {
        return Center(
          child: StyleRegistry.registry()
              .styleWithApp(widget.app)
              .adminListStyle()
              .progressIndicator(widget.app, context),
        );
      }

      if (state is FollowRequestFormLoaded) {
        _documentIDController.text = state.value!.documentID.toString();
        if (state.value!.follower != null) {
          _follower = state.value!.follower!.documentID;
        } else {
          _follower = "";
        }
        if (state.value!.followed != null) {
          _followed = state.value!.followed!.documentID;
        } else {
          _followed = "";
        }
        if (state.value!.status != null) {
          _statusSelectedRadioTile = state.value!.status!.index;
        } else {
          _statusSelectedRadioTile = 0;
        }
      }
      if (state is FollowRequestFormInitialized) {
        List<Widget> children = [];
        children.add(Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: StyleRegistry.registry()
                .styleWithApp(widget.app)
                .adminFormStyle()
                .groupTitle(widget.app, context, 'General')));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Document ID',
                icon: Icons.vpn_key,
                readOnly: (formAction == FormAction.updateAction),
                textEditingController: _documentIDController,
                keyboardType: TextInputType.text,
                validator: (_) => state is DocumentIDFollowRequestFormError
                    ? state.message
                    : null,
                hintText: 'field.remark'));

        children.add(
          DropdownButtonComponentFactory().createNew(
              app: widget.app,
              id: "memberPublicInfos",
              value: _follower,
              trigger: (value, privilegeLevel) => _onFollowerSelected(value),
              optional: false),
        );

        children.add(
          DropdownButtonComponentFactory().createNew(
              app: widget.app,
              id: "memberPublicInfos",
              value: _followed,
              trigger: (value, privilegeLevel) => _onFollowedSelected(value),
              optional: false),
        );

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .radioListTile(
                widget.app,
                context,
                0,
                _statusSelectedRadioTile,
                'followRequestPending',
                'followRequestPending',
                !Apis.apis()
                        .getCoreApi()
                        .memberIsOwner(context, widget.app.documentID)
                    ? null
                    : (dynamic val) => setSelectionStatus(val)));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .radioListTile(
                widget.app,
                context,
                0,
                _statusSelectedRadioTile,
                'followRequestAccepted',
                'followRequestAccepted',
                !Apis.apis()
                        .getCoreApi()
                        .memberIsOwner(context, widget.app.documentID)
                    ? null
                    : (dynamic val) => setSelectionStatus(val)));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .radioListTile(
                widget.app,
                context,
                0,
                _statusSelectedRadioTile,
                'followRequestDenied',
                'followRequestDenied',
                !Apis.apis()
                        .getCoreApi()
                        .memberIsOwner(context, widget.app.documentID)
                    ? null
                    : (dynamic val) => setSelectionStatus(val)));

        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .divider(widget.app, context));

        if ((formAction != FormAction.showData) &&
            (formAction != FormAction.showPreloadedData)) {
          children.add(StyleRegistry.registry()
              .styleWithApp(widget.app)
              .adminFormStyle()
              .button(
                widget.app,
                context,
                label: 'Submit',
                onPressed: _readOnly(context, state)
                    ? null
                    : () {
                        if (state is FollowRequestFormError) {
                          return;
                        } else {
                          if (formAction == FormAction.updateAction) {
                            BlocProvider.of<FollowRequestListBloc>(context)
                                .add(UpdateFollowRequestList(
                                    value: state.value!.copyWith(
                              documentID: state.value!.documentID,
                              appId: state.value!.appId,
                              follower: state.value!.follower,
                              followed: state.value!.followed,
                              status: state.value!.status,
                            )));
                          } else {
                            BlocProvider.of<FollowRequestListBloc>(context)
                                .add(AddFollowRequestList(
                                    value: FollowRequestModel(
                              documentID: state.value!.documentID,
                              appId: state.value!.appId,
                              follower: state.value!.follower,
                              followed: state.value!.followed,
                              status: state.value!.status,
                            )));
                          }
                          if (widget.submitAction != null) {
                            Apis.apis()
                                .getRouterApi()
                                .navigateTo(context, widget.submitAction!);
                          } else {
                            Navigator.pop(context);
                          }
                        }
                      },
              ));
        }

        return StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .container(
                widget.app,
                context,
                Form(
                  child: ListView(
                      padding: const EdgeInsets.all(8),
                      physics: ((formAction == FormAction.showData) ||
                              (formAction == FormAction.showPreloadedData))
                          ? NeverScrollableScrollPhysics()
                          : null,
                      shrinkWrap: ((formAction == FormAction.showData) ||
                          (formAction == FormAction.showPreloadedData)),
                      children: children),
                ),
                formAction!);
      } else {
        return StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminListStyle()
            .progressIndicator(widget.app, context);
      }
    });
  }

  void _onDocumentIDChanged() {
    _myFormBloc
        .add(ChangedFollowRequestDocumentID(value: _documentIDController.text));
  }

  void _onFollowerSelected(String? val) {
    setState(() {
      _follower = val;
    });
    _myFormBloc.add(ChangedFollowRequestFollower(value: val));
  }

  void _onFollowedSelected(String? val) {
    setState(() {
      _followed = val;
    });
    _myFormBloc.add(ChangedFollowRequestFollowed(value: val));
  }

  void setSelectionStatus(int? val) {
    setState(() {
      _statusSelectedRadioTile = val;
    });
    _myFormBloc
        .add(ChangedFollowRequestStatus(value: toFollowRequestStatus(val)));
  }

  @override
  void dispose() {
    _documentIDController.dispose();
    super.dispose();
  }

  /// Is the form read-only?
  bool _readOnly(BuildContext context, FollowRequestFormInitialized state) {
    return (formAction == FormAction.showData) ||
        (formAction == FormAction.showPreloadedData) ||
        (!Apis.apis()
            .getCoreApi()
            .memberIsOwner(context, widget.app.documentID));
  }
}
