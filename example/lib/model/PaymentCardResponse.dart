class PaymentCardResponse {
  Transaction? transaction;

  PaymentCardResponse({this.transaction});

  PaymentCardResponse.fromJson(Map<String, dynamic> json) {
    transaction = json['Transaction'] != null
        ? new Transaction.fromJson(json['Transaction'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.transaction != null) {
      data['Transaction'] = this.transaction!.toJson();
    }
    return data;
  }
}

class Transaction {
  String? responseCode;
  String? responseClass;
  String? responseDescription;
  String? responseClassDescription;

  //String language;
//  String transactionID;
//  String approvalCode;
//  String account;
//  Balance balance;
//  String orderID;
//  Balance amount;
//  Balance fees;
//  String cardNumber;
//  Payer payer;
//  String cardToken;
//  String cardBrand;
//  String cardType;
//  String uniqueID;

  Transaction({
    this.responseCode,
    this.responseClass,
    this.responseDescription,
    this.responseClassDescription,

//        this.language,
//        this.transactionID,
//        this.approvalCode,
//        this.account,
//        this.balance,
//        this.orderID,
//        this.amount,
//        this.fees,
//        this.cardNumber,
//        this.payer,
//        this.cardToken,
//        this.cardBrand,
//        this.cardType,
//        this.uniqueID
  });

  Transaction.fromJson(Map<String, dynamic> json) {
    responseCode = json['ResponseCode'];
    responseClass = json['ResponseClass'];
    responseDescription = json['ResponseDescription'];
    responseClassDescription = json['ResponseClassDescription'];

//    language = json['Language'];
//    transactionID = json['TransactionID'];
//    approvalCode = json['ApprovalCode'];
//    account = json['Account'];
//    balance =
//    json['Balance'] != null ? new Balance.fromJson(json['Balance']) : null;
//    orderID = json['OrderID'];
//    amount =
//    json['Amount'] != null ? new Balance.fromJson(json['Amount']) : null;
//    fees = json['Fees'] != null ? new Balance.fromJson(json['Fees']) : null;
//    cardNumber = json['CardNumber'];
//    payer = json['Payer'] != null ? new Payer.fromJson(json['Payer']) : null;
//    cardToken = json['CardToken'];
//    cardBrand = json['CardBrand'];
//    cardType = json['CardType'];
//    uniqueID = json['UniqueID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ResponseCode'] = this.responseCode;
    data['ResponseClass'] = this.responseClass;
    data['ResponseDescription'] = this.responseDescription;
    data['ResponseClassDescription'] = this.responseClassDescription;

//    data['Language'] = this.language;
//    data['TransactionID'] = this.transactionID;
//    data['ApprovalCode'] = this.approvalCode;
//    data['Account'] = this.account;
//    if (this.balance != null) {
//      data['Balance'] = this.balance.toJson();
//    }
//    data['OrderID'] = this.orderID;
//    if (this.amount != null) {
//      data['Amount'] = this.amount.toJson();
//    }
//    if (this.fees != null) {
//      data['Fees'] = this.fees.toJson();
//    }
//    data['CardNumber'] = this.cardNumber;
//    if (this.payer != null) {
//      data['Payer'] = this.payer.toJson();
//    }
//    data['CardToken'] = this.cardToken;
//    data['CardBrand'] = this.cardBrand;
//    data['CardType'] = this.cardType;
//    data['UniqueID'] = this.uniqueID;
    return data;
  }
}

class Balance {
  String? value;
  String? printable;

  Balance({this.value, this.printable});

  Balance.fromJson(Map<String, dynamic> json) {
    value = json['Value'];
    printable = json['Printable'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Value'] = this.value;
    data['Printable'] = this.printable;
    return data;
  }
}

class Payer {
  String? information;

  Payer({this.information});

  Payer.fromJson(Map<String, dynamic> json) {
    information = json['Information'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Information'] = this.information;
    return data;
  }
}
