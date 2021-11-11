package com.app.thought_factory.shop_owner.remote

import com.app.thought_factory.shop_owner.request_response.request_payment.DetailsRequest
import com.app.thought_factory.shop_owner.request_response.request_payment.RegistrationRequest
import com.app.thought_factory.shop_owner.request_response.response_payment.PaymentRegistrationResponse
import com.karthik.etisalat.model.FinalizationRequest
import com.karthik.etisalat.model.FinalizationResponse
import com.shatech.customerdetailapp.response.DetailsResponse
import retrofit2.Call
import retrofit2.http.Body
import retrofit2.http.Headers
import retrofit2.http.POST

interface ApiInterface {
    @Headers("Content-Type: application/json",
            "Accept: application/json")
    @POST("https://ipg.comtrust.ae:2443")
    fun apiPaymentCall(@Body detailsRequest: DetailsRequest): Call<DetailsResponse?>

    @Headers("Content-Type: application/json",
            "Accept: application/json")
    @POST("https://ipg.comtrust.ae:2443")
    fun apiRegistrationCall(@Body detailsRequest: RegistrationRequest): Call<PaymentRegistrationResponse?>

    @Headers("Content-Type: application/json",
            "Accept: application/json")
    @POST("https://ipg.comtrust.ae:2443")
    fun apiFinalizationCall(@Body detailsRequest: FinalizationRequest): Call<FinalizationResponse?>
}
