//
//  AlertMessage.swift
//  SportEasyTest
//
//  Created by Clément Martin on 20/06/2021.
//

import Foundation

public class AlertMessage:NSObject {

    public var statusCode = 0
    public var title = ""
    public var body = ""

    // MARK: - Initialization

    init(title:String, body:String) {
        self.title = title
        self.body = body
    }

    init(code:Int, title:String, body:String) {
        self.statusCode = code
        self.title = title
        self.body = body
    }
}
