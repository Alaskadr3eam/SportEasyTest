//
//  API.swift
//  SportEasyTest
//
//  Created by Clément Martin on 20/06/2021.
//

import Foundation

class API {

    static let sharedIntance = API()

    let manager = APIManager()

    func getEvent (_ handler: @escaping (_ result: Event?, _ message: AlertMessage?)->()) {

        self.manager.call(type: APIEndpoint.event, params: nil) { (result:Event?, message: AlertMessage?) in
            if let result = result {
                handler(result, nil)
            } else {
                handler(nil, message!)
            }
        }
    }
}
