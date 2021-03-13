library store_auth_data;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flireator/actions/redux_action.dart';
import 'package:flireator/models/auth/auth_data.dart';
import 'package:flireator/utils/serializers.dart';
import 'package:meta/meta.dart';

part 'store_auth_data.g.dart';

abstract class StoreAuthData extends Object
    with ReduxAction
    implements Built<StoreAuthData, StoreAuthDataBuilder> {
  @nullable
  AuthData get data;

  StoreAuthData._();

  factory StoreAuthData({@required AuthData data}) = _$StoreAuthData._;

  Object toJson() => serializers.serializeWith(StoreAuthData.serializer, this);

  static StoreAuthData fromJson(String jsonString) => serializers
      .deserializeWith(StoreAuthData.serializer, json.decode(jsonString));

  static Serializer<StoreAuthData> get serializer => _$storeAuthDataSerializer;

  @override
  String toString() {
    var dataSummary = '-';

    if (data == null) {
      dataSummary = 'null';
    } else if (data.isAnonymous) {
      dataSummary = 'anon-${data.uid.substring(0, 4)}...';
    } else {
      dataSummary = '${data.uid.substring(0, 4)}...';
    }

    return 'STORE_AUTH_DATA: $dataSummary';
  }
}
