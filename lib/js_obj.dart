import 'dart:convert' as convert;

class JsRequest {
  late String callbackId;
  late String data;
  late String handlerName;

  String toJson() {
    return convert.jsonEncode({
      "callbackId": callbackId == null ? "" : callbackId,
      "data": data == null ? "" : data,
      "handlerName": handlerName == null ? "" : handlerName
    });
  }
}

class JsMsg {
  late String callbackId; //callbackId
  late String responseId; //responseId
  late String responseData; //responseData
  late String data; //data of message
  late String handlerName;

  JsMsg();

  static List<JsMsg> fromList(List list) {
    List<JsMsg> msgList = [];
    for (Map json in list) {
      JsMsg msg = JsMsg();
      msg.callbackId = json["callbackId"];
      msg.responseId = json["responseId"];
      msg.responseData = convert.jsonEncode(json["responseData"]);
      msg.data = convert.jsonEncode(json["data"]);
      msg.handlerName = json["handlerName"];
      msgList.add(msg);
    }
    return msgList;
  }

  factory JsMsg.formJson(Map json) {
    JsMsg msg = JsMsg();
    msg.callbackId = json["callbackId"];
    msg.responseId = json["responseId"];
    msg.responseData = convert.jsonEncode(json["responseData"]);
    msg.data = convert.jsonEncode(json["data"]);
    msg.handlerName = json["handlerName"];
    return msg;
  }

  String toJson() {
    return convert.jsonEncode({
      "callbackId": callbackId == null ? "" : callbackId,
      "responseId": responseId == null ? "" : responseId,
      "responseData": responseData == null ? "" : responseData,
      "data": data == null ? "" : data,
      "handlerName": handlerName == null ? "" : handlerName
    });
  }
}
