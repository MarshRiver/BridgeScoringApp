//
//  Event.swift
//  BridgeScores
//
//  Created by Chris Percival on 5/7/22.
//

import Foundation

class Event: ObservableObject {
    @Published var noPairs = 6
    @Published var eventFileName = "Howell-6"
    @Published var eventDate = Date()
    @Published var eventName = "Belfast Afternoon"
    let eventDateFormatter = DateFormatter()
    

    init(){
        eventDateFormatter.dateFormat = "MM/dd/YYYY"
    }
    
    func stringDate() -> String {
        return eventDateFormatter.string(from: eventDate)
    }
}
