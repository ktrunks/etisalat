package com.karthik.etisalat.api

import com.app.thought_factory.shop_owner.request_response.request_payment.Authorization
import com.app.thought_factory.shop_owner.request_response.request_payment.DetailsRequest
import java.util.*

class Authorization{

    fun getAuthorizationData(arg: Map<String, Objects>): DetailsRequest {
        return DetailsRequest(
                Authorization(
                        Amount = arg["Amount"].toString(), //"28.90",
                        CardNumber = arg["CardNumber"].toString(), //"4111111111111111",
                        Channel = arg["Channel"].toString(), //"W",
                        Currency = arg["Currency"].toString(), //"AED",
                        Customer = arg["Customer"].toString(), //"Demo Merchant",
                        ExpiryMonth = arg["ExpiryMonth"].toString(), //"12",
                        ExpiryYear = arg["ExpiryYear"].toString(), //"2021",
                        Language = arg["Language"].toString(), //"en",
                        OrderID = arg["OrderID"].toString(),//"000000575",
                        OrderName = arg["OrderName"].toString(), //"Parle Kreams Gold - ",
                        Password = arg["Password"].toString(),//"Comtrust@20182018",
                        TransactionHint = arg["TransactionHint"].toString(), // "CPT:Y;",
                        UserName = arg["UserName"].toString(), //"Demo_fY9c",
                        VerifyCode = arg["VerifyCode"].toString() //"123"
                )
        )
    }


}