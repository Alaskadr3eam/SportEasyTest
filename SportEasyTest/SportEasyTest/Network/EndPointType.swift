//
//  EndPointType.swift
//  SportEasyTest
//
//  Created by Clément Martin on 20/06/2021.
//

import Foundation
import Alamofire

protocol EndPointType {
    // MARK: - Propertie
    var baseURL: String { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var headers: HTTPHeaders? { get }
    var url: URL { get }
    var encoding: ParameterEncoding { get }
    var version: String { get }
}
