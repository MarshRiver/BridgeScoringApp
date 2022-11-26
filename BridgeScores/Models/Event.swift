//
//  Event.swift
//  BridgeScores
//
//  Created by Chris Percival on 5/7/22.
//

import Foundation

//json file names for possible movements


class Event: ObservableObject {
    @Published var noPairs = 6
    @Published var eventMovementName = ""
    @Published var eventDate = Date()
    @Published var eventName = "Belfast Afternoon"
    let eventDateFormatter = DateFormatter()
    
    let Movements = ["Howell-6",
                    "Howell-7",
                    "Howell-8",
                    "Howell-6-25Bluedebug"]

    init(){
        eventDateFormatter.dateFormat = "MM/dd/YYYY"
        eventMovementName = Movements[1]
    }
    
    func stringDate() -> String {
        return eventDateFormatter.string(from: eventDate)
    }
}
