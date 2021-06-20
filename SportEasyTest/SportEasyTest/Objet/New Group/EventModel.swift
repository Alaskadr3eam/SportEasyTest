//
//  EventModel.swift
//  SportEasyTest
//
//  Created by Clément Martin on 20/06/2021.
//
import Foundation

class EventModel {

    var event = [EventElement]()

    let api = API.sharedIntance

    func getMatchResult(completionHandler: @escaping(Bool, AlertMessage?) -> Void) {

        self.api.getEvent { [weak self] eventResult, alertMessage in
            guard let self = self else { return }
            guard alertMessage == nil else {
                completionHandler(false, alertMessage)
                return
            }
            guard let results = eventResult else {
                completionHandler(false, alertMessage)
                return
            }
            self.event = results.events
            completionHandler(true, nil)
        }
    }
}
