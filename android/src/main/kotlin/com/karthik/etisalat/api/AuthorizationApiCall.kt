package com.karthik.etisalat.api

import com.app.thought_factory.shop_owner.remote.ApiInterface
import com.shatech.customerdetailapp.response.DetailsResponse
import io.flutter.plugin.common.MethodChannel
import retrofit2.Call
import retrofit2.Callback
import retrofit2.Response
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory
import java.util.*

class AuthorizationApiCall {

    fun api(arg: Map<String, Objects>, result: MethodChannel.Result) {
        val retrofit: Retrofit = Retrofit.Builder()
                .baseUrl("https://ipg.comtrust.ae:2443")
                .addConverterFactory(GsonConverterFactory.create())
                .build()
        var authData = Authorization().getAuthorizationData(arg)
        val request = retrofit.create(ApiInterface::class.java)
        request.apiPaymentCall(authData).enqueue(object : Callback<DetailsResponse?> {
            override fun onResponse(
                    call: Call<DetailsResponse?>,
                    response: Response<DetailsResponse?>
            ) {
                if (response.isSuccessful) {
                    response.body().let {
                        if (it != null) {
                            when {
                                it.Transaction.ResponseClassDescription.equals("Success") -> {
                                    val returnArg: HashMap<Int, String> = HashMap<Int, String>()
                                    returnArg[1] = "Success"
                                    returnArg[2] = it.Transaction.ResponseDescription.toString()
                                    result.success(returnArg)
                                }
                                it.Transaction.ResponseClassDescription.equals("Error") -> {
                                    val returnArg: HashMap<Int, String> = HashMap<Int, String>()
                                    returnArg[1] = "Error"
                                    returnArg[2] = it.Transaction.ResponseDescription.toString()
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

            override fun onFailure(call: Call<DetailsResponse?>, t: Throwable) {
                val returnArg: HashMap<Int, String> = HashMap<Int, String>()
                returnArg[1] = "Error"
                returnArg[2] = "SomeThing went wrong, Please try again later."
                result.success(returnArg)
            }
        })
    }
}
