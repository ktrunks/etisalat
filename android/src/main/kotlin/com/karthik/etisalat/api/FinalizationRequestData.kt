package com.karthik.etisalat.api

import com.karthik.etisalat.model.Finalization
import com.karthik.etisalat.model.FinalizationRequest
import java.util.*

class FinalizationRequestData {
    fun getFinalizationData(arg: Map<String, Objects>): FinalizationRequest {
        return FinalizationRequest(
                Finalization(
                        TransactionID = arg["TransactionID"].toString(),
                        Customer = arg["Customer"].toString(), //
                        UserName = arg["UserName"].toString(), //"Demo_fY9c",
                        Password = arg["Password"].toString()//"Comtrust@20182018",
                )
        )
    }
}
