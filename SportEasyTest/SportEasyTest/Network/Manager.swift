//
//  Manager.swift
//  SportEasyTest
//
//  Created by Clément Martin on 20/06/2021.
//

import Foundation
import Alamofire

class APIManager {

    private var pendingRequests: [DataRequest] = []

    func parseApiError(statusCode: Int, data: Data?) -> AlertMessage {

        let decoder = JSONDecoder()
        if let jsonData = data, let error = try? decoder.decode(APIError.self, from: jsonData) {
            return AlertMessage(code: statusCode, title: NSLocalizedString("api_error_title", comment: ""), body: error.message)
        }

        return AlertMessage(code: statusCode, title: NSLocalizedString("api_error_title", comment: ""), body: NSLocalizedString("api_error_msg", comment: ""))
    }

    // call with specific type
    func call<T>(type: EndPointType, params: Parameters? = nil, handler: @escaping (T?, _ error: AlertMessage?)->()) where T: Codable {

        #if DEBUG
        print("API CALL -> \(type.httpMethod.rawValue.uppercased()) \(type.url)")

        print("encoding : \(type.encoding)")

        if let headers = type.headers {
            print("headers : \(headers)")
        }

        if let params = params {
            print("params : \(params)")
        }
        #endif

        let request = AF.request(type.url,
                                 method: type.httpMethod,
                                 parameters: params,
                                 encoding: type.encoding,
                                 headers: type.headers, interceptor: nil).validate().responseJSON { data in
                                    switch data.result {
                                    case .success(_):

                                        #if DEBUG
                                        print("Success Response -> ")
                                        if let responseData = data.data {
                                            print("\(responseData)")
                                        }
                                        #endif

                                        let decoder = JSONDecoder()

                                        if let jsonData = data.data {
                                            do {
                                                let result = try decoder.decode(T.self, from: jsonData)
                                                handler(result, nil)
                                            } catch {
                                                #if DEBUG
                                                print("!!! JSON DECODER ERROR !!!")
                                                print("WITH API CALL -> \(type.httpMethod.rawValue.uppercased()) \(type.url)")
                                                print(error)
                                                #endif
                                                handler(nil, AlertMessage(title: NSLocalizedString("api_json_error_title", comment: ""), body: NSLocalizedString("api_json_error_msg", comment: "")))
                                            }
                                        }
                                    case .failure(_):

                                        #if DEBUG
                                        if let response = data.response {
                                            print("Error Response -> \(response)")
                                        } else {
                                            print("Error Response -> No response data !")
                                        }
                                        #endif

                                        if(data.response == nil) {
                                            handler(nil, AlertMessage(title: NSLocalizedString("alert_connection_title", comment: ""), body: NSLocalizedString("alert_connection_msg", comment: "")))
                                        } else {
                                            handler(nil, self.parseApiError(statusCode: data.response!.statusCode, data: data.data))
                                        }
                                    }
                                 }

        pendingRequests.append(request)
    }
}
