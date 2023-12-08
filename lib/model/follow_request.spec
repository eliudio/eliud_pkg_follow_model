{
  "id": "FollowRequest",
  "packageName": "eliud_pkg_follow_model",
  "packageFriendlyName": "follow",
  "isAppModel": true,
  "generate": {
    "generateComponent": true,
    "generateRepository": true,
    "generateCache": true,
    "hasPersistentRepository": true,
    "generateFirestoreRepository": true,
    "generateRepositorySingleton": true,
    "generateModel": true,
    "generateEntity": true,
    "generateForm": false,
    "generateList": true,
    "generateDropDownButton": true,
    "generateInternalComponent": true,
    "generateEmbeddedComponent": false,
    "documentSubCollectionOf": "app"
  },
  "fields": [
    {
      "fieldName": "documentID",
      "required": true,
      "remark": "Member request ID - Member response ID",
      "displayName": "Document ID",
      "fieldType": "String",
      "iconName": "vpn_key",
      "group": "general"
    },
    {
      "fieldName": "appId",
      "required": true,
      "displayName": "App Identifier",
      "remark": "This is the identifier of the app to which this belongs",
      "fieldType": "String",
      "group": "general",
      "hidden": true
    },
    {
      "fieldName": "follower",
      "displayName": "The member (that wants to be) following another member",
      "fieldType": "MemberPublicInfo",
      "association": true,
      "group": "general"
    },
    {
      "fieldName": "followed",
      "displayName": "The member (that wants to be) being followed by another member",
      "fieldType": "MemberPublicInfo",
      "association": true,
      "group": "general"
    },
    {
      "fieldName": "status",
      "displayName": "Status",
      "fieldType": "FollowResponse",
      "group": "general",
      "fieldType": "enum",
      "enumName": "FollowRequestStatus",
      "enumValues" : [ "followRequestPending", "followRequestAccepted", "followRequestDenied" ]
    }
  ],
  "groups": [
    {
        "group": "general",
        "description": "General"
    }
  ],
  "listFields": {
    "title": "Center(child: StyleRegistry.registry().styleWithApp(app).frontEndStyle().textStyle().text(app, context, value.documentID))",
    "subTitle": "value.follower!.name != null ? Center(child: StyleRegistry.registry().styleWithApp(app).frontEndStyle().textStyle().text(app, context, value.follower!.name!)) : Container()"
  },
  "depends": ["eliud_core_main"]
}
