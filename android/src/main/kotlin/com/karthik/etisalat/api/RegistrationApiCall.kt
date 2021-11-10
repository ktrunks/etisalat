package com.karthik.etisalat.api

import com.app.thought_factory.shop_owner.remote.ApiInterface
import com.app.thought_factory.shop_owner.request_response.response_payment.PaymentRegistrationResponse
import io.flutter.plugin.common.MethodChannel
import retrofit2.Call
import retrofit2.Callback
import retrofit2.Response
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory
import java.util.*

class RegistrationApiCall {

    fun api(arg: Map<String, Objects>, result: MethodChannel.Result) {
        val retrofit: Retrofit = Retrofit.Builder()
                .baseUrl("https://ipg.comtrust.ae:2443")
                .addConverterFactory(GsonConverterFactory.create())
                .build()
        val authData = RegistrationData().getRegistrationData(arg)
        val request = retrofit.create(ApiInterface::class.java)
        request.apiRegistrationCall(authData).enqueue(object : Callback<PaymentRegistrationResponse?> {
            override fun onResponse(
                    call: Call<PaymentRegistrationResponse?>,
                    response: Response<PaymentRegistrationResponse?>
            ) {
                if (response.isSuccessful) {
                    response.body().let {
                        if (it != null) {
                            when {
                                it.Transaction.ResponseClassDescription == "Success" -> {
                                    val returnArg: HashMap<Int, String> = HashMap<Int, String>()
                                    returnArg[1] = "Success"
                                    returnArg[2] = it.Transaction.PaymentPage
                                    returnArg[3] = it.Transaction.PaymentPortal
                                    returnArg[4] = it.Transaction.TransactionID
                                    returnArg[5] = it.Transaction.ResponseClassDescription
                                    result.success(returnArg)
                                }
                                it.Transaction.ResponseClassDescription == "Error" -> {
                                    val returnArg: HashMap<Int, String> = HashMap<Int, String>()
                                    returnArg[1] = "Error"
                                    returnArg[2] = it.Transaction.ResponseClassDescription
                                    result.success(returnArg)
                                }
                                else -> {
                                    val returnArg: HashMap<Int, String> = HashMap<Int, String>()
                                    returnArg[1] = "Error"
                                    returnArg[2] = "SomeThing went wrong, Please try again later."
                                    result.success(returnArg)
                                }
                            }
                        } else {
                            val returnArg: HashMap<Int, String> = HashMap<Int, String>()
                            returnArg[1] = "Error"
                            returnArg[2] = "SomeThing went wrong, Please try again later."
                            result.success(returnArg)
                        }
                    }
                }
            }

            override fun onFailure(call: Call<PaymentRegistrationResponse?>, t: Throwable) {
                val returnArg: HashMap<Int, String> = HashMap<Int, String>()
                returnArg[1] = "Error"
                returnArg[2] = "SomeThing went wrong, Please try again later."
                result.success(returnArg)
            }
        })
    }
}
