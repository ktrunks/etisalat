//
//  Authorization.swift
//  etisalat
//
//  Created by Pro on 06/08/1943 Saka.
//

import Foundation


func AuthorizationApi(data: [String:String],result: @escaping FlutterResult)
    {
        print("responce",data)
        print(data["UserName"]! as String)
        //code to register user
        var urlRequest = URLRequest(url: URL(string: "https://ipg.comtrust.ae:2443")!)
        urlRequest.httpMethod = "POST"
        let request = AuthorizationRequest(authorization: Authorization(customer: data["Customer"]!, language: data["Language"]!, currency: data["Currency"]!, orderName: data["OrderName"]!, orderID: data["OrderID"]!, channel: data["Channel"]!, amount: data["Amount"]!, transactionHint: data["TransactionHint"]!, cardNumber: data["CardNumber"]!, expiryMonth: data["ExpiryMonth"]!, expiryYear: data["ExpiryYear"]!, verifyCode: data["VerifyCode"]!, userName: data["UserName"]!, password: data["Password"]!))
        do {

            let requestBody = try JSONEncoder().encode(request)
            urlRequest.httpBody = requestBody
            urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
            urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        } catch let error {
            debugPrint(error.localizedDescription)
        }

        URLSession.shared.dataTask(with: urlRequest) { (data, httpUrlResponse, error) in

            if(data != nil && data?.count != 0)
            {
                do {

                    let response = try JSONDecoder().decode(TransactionResponse.self, from: data!)
                    if(response.transaction.responseClassDescription == "Success"){
                        var uploadArray = [[Int: Any]]()
                        let ordersDictionary = [
                            1  : "Success",
                            2 : response.transaction.responseDescription
                        ]
                        uploadArray.append(ordersDictionary)
                        print(uploadArray)
                        result(uploadArray)
                    }
                    else{
                        var uploadArray = [[Int: Any]]()
                        let ordersDictionary = [
                            1  : "Error",
                            2 : response.transaction.responseDescription
                        ]
                        uploadArray.append(ordersDictionary)
                        print(uploadArray)
                        result(uploadArray)
                    }
                   
                    debugPrint(response)
                }
                catch let decodingError {
                    debugPrint(decodingError)
                }
            }
        }.resume()
    }
