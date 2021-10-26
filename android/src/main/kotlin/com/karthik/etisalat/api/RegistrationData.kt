package com.karthik.etisalat.api

import com.app.thought_factory.shop_owner.request_response.request_payment.Registration
import com.app.thought_factory.shop_owner.request_response.request_payment.RegistrationRequest

class RegistrationData {
    fun getRegistrationData(arg: Map<String, Any>): RegistrationRequest {
        return RegistrationRequest(
                Registration(
                        Currency = arg["Currency"].toString(), //"AED",
                        ReturnPath = arg["ReturnPath"].toString(), //"AED",
                        TransactionHint = arg["TransactionHint"].toString(), // "CPT:Y;",
                        OrderID = arg["OrderID"].toString(),//"000000575",
                        Store = arg["Store"].toString(),
                        Terminal = arg["Terminal"].toString(),
                        Channel = arg["Channel"].toString(), //"W",
                        Amount = arg["Amount"].toString(), //"28.90",
                        Customer = arg["Customer"].toString(), //
                        OrderName = arg["OrderName"].toString(), //"Parle Kreams Gold - ",
                        UserName = arg["UserName"].toString(), //"Demo_fY9c",
                        Password = arg["Password"].toString()//"Comtrust@20182018",
                )
        )
    }
}