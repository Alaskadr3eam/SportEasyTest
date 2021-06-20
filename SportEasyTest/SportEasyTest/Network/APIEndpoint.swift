//
//  APIEndPoint.swift
//  SportEasyTest
//
//  Created by Clément Martin on 20/06/2021.
//

import Foundation
import Alamofire

enum APIEndpoint {
    // MARK: Action
    case event
}

extension APIEndpoint: EndPointType {
    var baseURL: String {
        return "https://hr2v36jyr7.execute-api.eu-west-3.amazonaws.com"
    }

    var version: String {
        return ""
    }

    var path: String {
        return "/default/events"
    }

    var httpMethod: HTTPMethod {
        return .get
    }

    var headers: HTTPHeaders? {
        return ["Content-Type": "application/json"]
    }

    var url: URL {
        return URL(string: self.baseURL + self.path)!
    }

    var encoding: ParameterEncoding {
        return JSONEncoding.default
    }
}
