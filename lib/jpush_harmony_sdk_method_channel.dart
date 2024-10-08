import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'jpush_harmony_sdk_platform_interface.dart';

/// An implementation of [JpushHarmonySdkPlatform] that uses method channels.
class MethodChannelJpushHarmonySdk extends JpushHarmonySdkPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('jpush_harmony_sdk');

  final String flutter_log = "| Harmony-Flutter | ";
  void Function(String eventName, dynamic data)? callBack = null;
  bool debug = true;

  @override
  void setCallBack(Function(String eventName, dynamic data) callBack) {
    this.callBack = callBack;
    methodChannel.setMethodCallHandler((call) async {
      if (null != call) {
        if (null != this.callBack) {
          printMy("callBack, call:" + call.toString());
          this.callBack?.call(call.method, call.arguments);
        } else {
          printMy("no has callBack, method:" + call.method);
        }
      } else {
        printMy("call null");
      }
    });
  }

  void setDebug(bool b) {
    this.debug = b;
    methodChannel.invokeMethod("setDebug", b);
  }

  setAppKey(String appKey) {
    methodChannel.invokeMethod("setAppKey", appKey);
  }

  setChannel(String channel) {
    methodChannel.invokeMethod("setChannel", channel);
  }

  init() {
    methodChannel.invokeMethod("init");
  }
  
  Future<String?> getRegistrationId() async {
    return await methodChannel.invokeMethod<String>("getRegistrationId");
  }

  setTags(int sequence, List<String> tags) {
    methodChannel.invokeMethod("setTags", {"sequence": sequence, "tags": tags});
  }

  addTags(int sequence, List<String> tags) {
    methodChannel.invokeMethod("addTags", {"sequence": sequence, "tags": tags});
  }

  deleteTags(int sequence, List<String> tags) {
    methodChannel.invokeMethod(
        "deleteTags", {"sequence": sequence, "tags": tags});
  }

  cleanTags(int sequence) {
    methodChannel.invokeMethod("cleanTags", sequence);
  }

  getTags(int sequence, int curr) {
    methodChannel.invokeMethod("getTags", {"sequence": sequence, "curr": curr});
  }

  checkTagBindState(int sequence, String tag) {
    methodChannel.invokeMethod(
        "checkTagBindState", {"sequence": sequence, "tag": tag});
  }

  setAlias(int sequence, String alias) {
    methodChannel.invokeMethod(
        "setAlias", {"sequence": sequence, "alias": alias});
  }

  deleteAlias(int sequence) {
    methodChannel.invokeMethod("deleteAlias", sequence);
  }

  getAlias(int sequence) {
    methodChannel.invokeMethod("getAlias", sequence);
  }

  stopPush() {
    methodChannel.invokeMethod("stopPush");
  }

  resumePush() {
    methodChannel.invokeMethod("resumePush");
  }

  Future<bool?> isPushStopped() async{
    return await methodChannel.invokeMethod<bool>('isPushStopped');
  }

  setBadgeNumber(int badgeNumber) {
    methodChannel.invokeMethod("setBadgeNumber", badgeNumber);
  }

  void printMy(msg) {
    if (debug) {
      print(flutter_log + "::" + msg);
    }
  }
}
