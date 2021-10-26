package com.app.thought_factory.shop_owner.request_response.response_payment

import com.shatech.customerdetailapp.response.Amount
import com.shatech.customerdetailapp.response.Balance
import com.shatech.customerdetailapp.response.Fees
import com.shatech.customerdetailapp.response.Payer

data class RegistrationResponse(
        val PaymentPortal: String,
        val PaymentPage: String,
        val ResponseCode: String,
        val ResponseClass: String,
        val ResponseClassDescription: String,
        val TransactionID: String,
        val Balance: Balance,
        val Amount: Amount,
        val Fees: Fees,
        val Payer: Payer,
        val UniqueID: String
)