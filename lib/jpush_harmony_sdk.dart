import 'jpush_harmony_sdk_platform_interface.dart';

class JpushHarmonySdk {

  void setCallBack(Function(String eventName, dynamic data) callBack) {
    JpushHarmonySdkPlatform.instance.setCallBack(callBack);
  }

  void setDebug(bool b) {
    JpushHarmonySdkPlatform.instance.setDebug(b);
  }

  setAppKey(String appKey) {
    JpushHarmonySdkPlatform.instance.setAppKey(appKey);
  }

  setChannel(String channel) {
    JpushHarmonySdkPlatform.instance.setChannel(channel);
  }

  init() {
    JpushHarmonySdkPlatform.instance.init();
  }
  
  Future<String?> getRegistrationId() {
    return JpushHarmonySdkPlatform.instance.getRegistrationId();
  }

  setTags(int sequence, List<String> tags) {
    JpushHarmonySdkPlatform.instance.setTags(sequence, tags);
  }

  addTags(int sequence, List<String> tags) {
    JpushHarmonySdkPlatform.instance.addTags(sequence, tags);
  }

  deleteTags(int sequence, List<String> tags) {
    JpushHarmonySdkPlatform.instance.deleteTags(sequence, tags);
  }

  cleanTags(int sequence) {
    JpushHarmonySdkPlatform.instance.cleanTags(sequence);
  }

  getTags(int sequence, int curr) {
    JpushHarmonySdkPlatform.instance.getTags(sequence, curr);
  }

  checkTagBindState(int sequence, String tag) {
    JpushHarmonySdkPlatform.instance.checkTagBindState(sequence, tag);
  }

  setAlias(int sequence, String alias) {
    JpushHarmonySdkPlatform.instance.setAlias(sequence, alias);
  }

  deleteAlias(int sequence) {
    JpushHarmonySdkPlatform.instance.deleteAlias(sequence);
  }

  getAlias(int sequence) {
    JpushHarmonySdkPlatform.instance.getAlias(sequence);
  }

  stopPush() {
    JpushHarmonySdkPlatform.instance.stopPush();
  }

  resumePush() {
    JpushHarmonySdkPlatform.instance.resumePush();
  }

  Future<bool?> isPushStopped() {
    return JpushHarmonySdkPlatform.instance.isPushStopped();
  }

  setBadgeNumber(int badgeNumber) {
    JpushHarmonySdkPlatform.instance.setBadgeNumber(badgeNumber);
  }

}
