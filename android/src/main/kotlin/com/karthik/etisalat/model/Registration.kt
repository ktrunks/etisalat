package com.app.thought_factory.shop_owner.request_response.request_payment

data class Registration(
        val Currency: String,
        val ReturnPath: String,
        val TransactionHint: String,
        val OrderID: String,
        val Store: String,
        val Terminal: String,
        val Channel: String,
        val Amount: String,
        val Customer: String,
        val OrderName: String,
        val UserName: String,
        val Password: String
)