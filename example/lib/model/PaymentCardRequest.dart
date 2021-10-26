class PaymentCardRequest {
  Authorization? authorization;

  PaymentCardRequest({this.authorization});

  PaymentCardRequest.fromJson(Map<String, dynamic> json) {
    authorization = json['Authorization'] != null
        ? new Authorization.fromJson(json['Authorization'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.authorization != null) {
      data['Authorization'] = this.authorization!.toJson();
    }
    return data;
  }
}

class Authorization {
  String? customer;
  String? language;
  String? currency;
  String? orderName;
  String? orderID;
  String? channel;
  String? amount;
  String? transactionHint;
  String? cardNumber;
  String? expiryMonth;
  String? expiryYear;
  String? verifyCode;
  String? userName;
  String? password;

  Authorization(
      {this.customer,
      this.language,
      this.currency,
      this.orderName,
      this.orderID,
      this.channel,
      this.amount,
      this.transactionHint,
      this.cardNumber,
      this.expiryMonth,
      this.expiryYear,
      this.verifyCode,
      this.userName,
      this.password});

  Authorization.fromJson(Map<String, dynamic> json) {
    customer = json['Customer'];
    language = json['Language'];
    currency = json['Currency'];
    orderName = json['OrderName'];
    orderID = json['OrderID'];
    channel = json['Channel'];
    amount = json['Amount'];
    transactionHint = json['TransactionHint'];
    cardNumber = json['CardNumber'];
    expiryMonth = json['ExpiryMonth'];
    expiryYear = json['ExpiryYear'];
    verifyCode = json['VerifyCode'];
    userName = json['UserName'];
    password = json['Password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Customer'] = this.customer;
    data['Language'] = this.language;
    data['Currency'] = this.currency;
    data['OrderName'] = this.orderName;
    data['OrderID'] = this.orderID;
    data['Channel'] = this.channel;
    data['Amount'] = this.amount;
    data['TransactionHint'] = this.transactionHint;
    data['CardNumber'] = this.cardNumber;
    data['ExpiryMonth'] = this.expiryMonth;
    data['ExpiryYear'] = this.expiryYear;
    data['VerifyCode'] = this.verifyCode;
    data['UserName'] = this.userName;
    data['Password'] = this.password;
    return data;
  }
}
