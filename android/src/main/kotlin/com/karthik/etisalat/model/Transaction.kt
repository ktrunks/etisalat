package com.shatech.customerdetailapp.response

data class Transaction(
    val Account: String,
    val Amount: Amount,
    val ApprovalCode: String,
    val Balance: Balance,
    val CardBrand: String,
    val CardNumber: String,
    val CardToken: String,
    val CardType: String,
    val Fees: Fees,
    val Language: String,
    val OrderID: String,
    val Payer: Payer,
    val ResponseClass: String,
    val ResponseClassDescription: String,
    val ResponseCode: String,
    val ResponseDescription: String,
    val TransactionID: String,
    val UniqueID: String
)