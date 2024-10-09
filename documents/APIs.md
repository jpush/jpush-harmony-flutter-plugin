# API 说明

- 代码导入：可以参考example里的代码

```
import 'package:jpush_harmony_sdk/jpush_harmony_sdk.dart';

创建对象
final _jpushHarmonySdkPlugin = JpushHarmonySdk();
```

## 注册监听

### setCallBack(Function(String eventName, dynamic data) callBack)

集成了 sdk 回调的事件

#### 参数说明
  - eventName: 为事件类型
      - "onRegister":注册成功，内容类型为string，反回rid
      - "onConnected":长连接状态回调,内容类型为boolean，true为连接
      - "onTagOperatorResult":tag操作结果回调，内容为string JTagMessage json
      - "onAliasOperatorResult":Alias操作结果回调，内容为string JAliasMessage json
      - "onClickMessage":通知点击事件回调，内容为string JMessage json
      - "onCustomMessage":自定义消息回调，内容为string JCustomMessage json
      - "onJMessageExtra":通知扩展消息回调，内容为string JMessageExtra json
      - "onJMessageVoIP":通知扩展消息回调，内容为string JMessageVoIP json
      - "onCommandResult":交互事件回调，内容为string JCmdMessage json
  - data: 为对应内容
```
/**
* 操作 tag 接口回调
* @param jTagMessage
* export class JTagMessage {
* sequence?: number //对应操作id，全局不要重复
* code?: number //0成功，JTagMessage.CODE_TIME_OUT超时
* op?: string
* tags?: string[] //对应数据
* curr?: number //数据当前页数，页数从1开始
* total?: number //数据总页数
* msg?: string
* }
  */
```
```
/**
* 操作 Alias 接口回调
* @param jAliasMessage
* export class JAliasMessage {
* sequence?: number //对应操作id，全局不要重复
* code?: number //0成功，JAliasMessage.CODE_TIME_OUT超时
* op?: string
* alias?: string //对应数据
* curr?: number
* total?: number
* msg?: string
* }
  */
```
```
  /**
   * 通知点击事件回调
   * @param jMessage
   *
   * export class JMessage {
   * msgId?: string //通知id
   * title?: string //通知标题
   * content?: string//通知内容
   * extras?: string//自定义数据
   * }
   */
```
```
  /**
   * 自定义信息通知回调
   *  回调一：冷启动调用sdk初始化后回调之前还没有回调的信息
   *  回调二：app存活时会直接回调信息
   * @param jCustomMessage
   *
   * export class JCustomMessage {
   *  msgId?: string //通知id
   *  title?: string //通知标题
   *  content?: string //通知内容
   *  contentType?: string //通知内容类型
   *  extras?: Record<string, Object> //通知自定义键值对
   *  ttl?: number //后台下发的信息过期时间，单位秒
   *  stime?: number //后台下发时间，毫秒
   * }
   */
```
```
  /**
   * 通知扩展消息回调
   * @param jMessageExtra
   *
   * export class JMessageExtra {
   * msgId?: string //通知id
   * title?: string //通知标题
   * content?: string//通知内容
   * extras?: Record<string, Object>//自定义数据
   * extraData?: string//通知扩展消息的自定义数据
   * }
   */
```
```
/**
   * VoIP呼叫消息回调
   * export class JMessageVoIP {
   * msgId?: string //通知id
   * extraData?: string //VoIP自定义数据
   }
   * @param jmVoIP
   */
```
```
  /**
   * 交互事件回调
   * @param cmdMessage
   * export class JCmdMessage {
   * public static CMD_PUSH_STOP = 2007 //通知停止 设置回调
   * public static CMD_PUSH_RESUME = 2006 //  通知恢复 设置回调
   *
   * cmd?: number  //操作事件，2007通知停止，2006恢复通知
   * errorCode?: number //0表示成功，其他为错误
   * msg?: string //内容信息
   * extra?: Record<string, Object>
   * }
   */
```

#### 代码示例

```js
FlutterPluginEngagelab.addEventHandler(
        onMTCommonReceiver: (Map<String, dynamic> message) async {
  FlutterPluginEngagelab.printMy("flutter onMTCommonReceiver: $message");
  String event_name = message["event_name"];
  String event_data = message["event_data"];
});
```

## 初始化

初始化sdk

#### 接口定义

```js
init();
```

#### 代码示例

```js
_jpushHarmonySdkPlugin.init();
```

## 开启 Debug 模式

设置是否debug模式，debug模式会打印更对详细日志

#### 接口定义

```js
setDebug(bool enable)
```

#### 参数说明

- enable: 是否调试模式，true为调试模式，false不是

#### 代码示例

```js
_jpushHarmonySdkPlugin.setDebug(false);
```
## AppKey 设置

在init前设置appKey

#### 接口定义

```js
setAppKey(String appKey)
```

#### 参数说明

- appKey: 极光平台的appKey

#### 代码示例

```js
_jpushHarmonySdkPlugin.setAppKey("你的AppKey");
```
## Channel 设置

在init前设置Channel

#### 接口定义

```js
setChannel(String channel)
```

#### 参数说明

- channel: 可自定义channel

#### 代码示例

```js
_jpushHarmonySdkPlugin.channel("channel");
```
## Tags 设置

设置标签

#### 接口定义

```js
setTags(int sequence, List<String> tags)
```

#### 参数说明

- sequence: 用户自定义的操作序列号，同操作结果一起返回，用来标识一次操作的唯一性
- tags: 可自定义tags

#### 代码示例

```js
_jpushHarmonySdkPlugin.setTags(112，["a","b"]);
```
## Tags 添加

添加标签

#### 接口定义

```js
addTags(int sequence, List<String> tags)
```

#### 参数说明

- sequence: 用户自定义的操作序列号，同操作结果一起返回，用来标识一次操作的唯一性
- tags: 可自定义tags

#### 代码示例

```js
_jpushHarmonySdkPlugin.addTags(113，["a","b"]);
```
## Tags 删除

删除标签

#### 接口定义

```js
deleteTags(int sequence, List<String> tags)
```

#### 参数说明

- sequence: 用户自定义的操作序列号，同操作结果一起返回，用来标识一次操作的唯一性
- tags: 可自定义tags

#### 代码示例

```js
_jpushHarmonySdkPlugin.deleteTags(114，["a","b"]);
```
## Tags 清除

清除标签

#### 接口定义

```js
cleanTags(int sequence)
```

#### 参数说明

- sequence: 用户自定义的操作序列号，同操作结果一起返回，用来标识一次操作的唯一性

#### 代码示例

```js
_jpushHarmonySdkPlugin.cleanTags(115);
```
## Tags 获取

获取标签

#### 接口定义

```js
getTags(int sequence, int curr)
```

#### 参数说明

- sequence: 用户自定义的操作序列号，同操作结果一起返回，用来标识一次操作的唯一性
- curr: 当前分页数，下标1开始

#### 代码示例

```js
_jpushHarmonySdkPlugin.getTags(116，1);
```
## Tag 校验是否存在

校验标签是否存在

#### 接口定义

```js
checkTagBindState(int sequence, String tag)
```

#### 参数说明

- sequence: 用户自定义的操作序列号，同操作结果一起返回，用来标识一次操作的唯一性
- tag: 想要查的tag

#### 代码示例

```js
_jpushHarmonySdkPlugin.checkTagBindState(117，"a");
```
## Alias 设置

设置别名

#### 接口定义

```js
setAlias(int sequence, String alias) 
```

#### 参数说明

- sequence: 用户自定义的操作序列号，同操作结果一起返回，用来标识一次操作的唯一性
- alias: 自定义alias

#### 代码示例

```js
_jpushHarmonySdkPlugin.setAlias(118，"a");
```
## Alias 删除

删除别名

#### 接口定义

```js
deleteAlias(int sequence) 
```

#### 参数说明

- sequence: 用户自定义的操作序列号，同操作结果一起返回，用来标识一次操作的唯一性

#### 代码示例

```js
_jpushHarmonySdkPlugin.deleteAlias(119);
```
## Alias 获取

获取别名

#### 接口定义

```js
getAlias(int sequence) 
```

#### 参数说明

- sequence: 用户自定义的操作序列号，同操作结果一起返回，用来标识一次操作的唯一性

#### 代码示例

```js
_jpushHarmonySdkPlugin.getAlias(120);
```
## BadgeNumber 角标设置

角标设置

#### 接口定义

```js
setBadgeNumber(int badgeNumber) 
```

#### 参数说明

- badgeNumber: 角标数值

#### 代码示例

```js
_jpushHarmonySdkPlugin.setBadgeNumber(1);
```
## 停止通知

停止通知

#### 接口定义

```js
stopPush() 
```

#### 参数说明

#### 代码示例

```js
_jpushHarmonySdkPlugin.stopPush();
```
## 恢复通知

恢复通知

#### 接口定义

```js
resumePush() 
```

#### 参数说明

#### 代码示例

```js
_jpushHarmonySdkPlugin.resumePush();
```
## 查询通知状态

查询通知状态

#### 接口定义

```js
Future<bool?> isPushStopped()
```

#### 参数说明
#### 返回值
true 表示停止，false 表示可用

#### 代码示例

```js
 isPushStopped = await _jpushHarmonySdkPlugin.isPushStopped()??true;
```

## 获取 RegistrationID


RegistrationID 定义:
获取当前设备的registrationId

#### 接口定义

```js
Future<String?> getRegistrationId()
```

#### 返回值

调用此 API 来取得应用程序对应的 RegistrationID。 只有当应用程序成功注册到 JPush 的服务器时才返回对应的值，否则返回空字符串。

#### 代码示例

```js
 rid = await _jpushHarmonySdkPlugin.getRegistrationId()??"";
```
