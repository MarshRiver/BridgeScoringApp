//
//  Event.swift
//  BridgeScores
//
//  Created by Chris Percival on 5/7/22.
//

import Foundation

//json file names for possible movements

let Movementsjson = """
[
{"id":0,"name":"Howell-6","noPairs":6},
{"id":1,"name":"Howell-7","noPairs":7},
{"id":2,"name":"Howell-8","noPairs":8},
{"id":3,"name":"Howell-6-25Bluedebug","noPairs":6}
]
""".data(using: .utf8)

//var iarray = Array(repeating:Movement(),count:4)


class Event: ObservableObject {
    @Published var noPairs = 6
    @Published var eventMovementName = "Howell-6"
    @Published var eventDate = Date()
    @Published var eventName = "Belfast Afternoon"
//    @Published var Movements = Array(repeating:Movement(),count:4)
    @Published var Movements = [Movement()]
    let eventDateFormatter = DateFormatter()
    
    init(){
        do {
            // Read the file into a data object
            let jsonData = Data(Movementsjson!)
            // Try to decode the json into an array of modules
            let jsonDecoder = JSONDecoder()
            Movements = try jsonDecoder.decode([Movement].self, from: jsonData)
        }
        catch {
            // TODO log error
            print("Couldn't parse local data")

        }
//        eventMovementName = Movements[0].name
//        print(eventMovementName)
    }
    
    func stringDate() -> String {
        return eventDateFormatter.string(from: eventDate)
    }
    
    
    struct Movement:Decodable,Hashable,Identifiable{
        var id = 0
        
        var name = "string"
        var noPairs = 0
    }
}
