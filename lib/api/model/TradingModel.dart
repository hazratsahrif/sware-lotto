class TradingModel {
  TradingModel({
      this.status,});

  TradingModel.fromJson(dynamic json) {
    status = json['status'] != null ? Status.fromJson(json['status']) : null;
  }
  Status? status;
TradingModel copyWith({  Status? status,
}) => TradingModel(  status: status ?? this.status,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (status != null) {
      map['status'] = status?.toJson();
    }
    return map;
  }

}

class Status {
  Status({
      this.code, 
      this.message, 
      this.data,});

  Status.fromJson(dynamic json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  int? code;
  String? message;
  List<Data>? data;
Status copyWith({  int? code,
  String? message,
  List<Data>? data,
}) => Status(  code: code ?? this.code,
  message: message ?? this.message,
  data: data ?? this.data,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Data {
  Data({
      this.tradeDate, 
      this.tradeType, 
      this.name, 
      this.remarks, 
      this.targetPrice, 
      this.actionPrice, 
      this.result,});

  Data.fromJson(dynamic json) {
    tradeDate = json['Trade Date'];
    tradeType = json['Trade Type'];
    name = json['Name'];
    remarks = json['Remarks'];
    targetPrice = json['Target Price'];
    actionPrice = json['Action Price'];
    result = json['Result'];
  }
  String? tradeDate;
  String? tradeType;
  String? name;
  String? remarks;
  String? targetPrice;
  String? actionPrice;
  String? result;
Data copyWith({  String? tradeDate,
  String? tradeType,
  String? name,
  String? remarks,
  String? targetPrice,
  String? actionPrice,
  String? result,
}) => Data(  tradeDate: tradeDate ?? this.tradeDate,
  tradeType: tradeType ?? this.tradeType,
  name: name ?? this.name,
  remarks: remarks ?? this.remarks,
  targetPrice: targetPrice ?? this.targetPrice,
  actionPrice: actionPrice ?? this.actionPrice,
  result: result ?? this.result,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Trade Date'] = tradeDate;
    map['Trade Type'] = tradeType;
    map['Name'] = name;
    map['Remarks'] = remarks;
    map['Target Price'] = targetPrice;
    map['Action Price'] = actionPrice;
    map['Result'] = result;
    return map;
  }

}