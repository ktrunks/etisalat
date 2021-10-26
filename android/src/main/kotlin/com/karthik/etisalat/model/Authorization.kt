package com.app.thought_factory.shop_owner.request_response.request_payment

data class Authorization(
    val Amount: String,
    val CardNumber: String,
    val Channel: String,
    val Currency: String,
    val Customer: String,
    val ExpiryMonth: String,
    val ExpiryYear: String,
    val Language: String,
    val OrderID: String,
    val OrderName: String,
    val Password: String,
    val TransactionHint: String,
    val UserName: String,
    val VerifyCode: String
)