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
{"id":1,"name":"Howell-6","noPairs":6},
{"id":2,"name":"Howell-7","noPairs":7},
{"id":3,"name":"Howell-8","noPairs":8},
{"id":4,"name":"Howell-6-25Bluedebug","noPairs":6}
]
""".data(using: .utf8)

class Event: ObservableObject {
    @Published var noPairs:Int!
    @Published var eventMovementName = ""
    @Published var eventDate = Date()
    @Published var eventName = "Belfast Afternoon"
    @Published var Movements = [Movement()]
    let eventDateFormatter = DateFormatter()
    
    init(){
        //Read list of movement names
        do {
            // Read the file into a data object
            let jsonData = Data(Movementsjson!)
            // Try to decode the json into an array of modules
            let jsonDecoder = JSONDecoder()
            Movements = try jsonDecoder.decode([Movement].self, from: jsonData)
        }
        catch {
            // TODO log error
            print("Couldn't parse local data: Event.swift")

        }
        eventMovementName = Movements[0].name
        noPairs = Movements[0].noPairs
        print(eventMovementName + "  " + String(noPairs) + " in event.swift")
    }
    
    func stringDate() -> String {
        eventDateFormatter.dateStyle = .full
        return eventDateFormatter.string(from: eventDate)
    }
    
    
    struct Movement:Decodable,Hashable,Identifiable{
        var id = 0
        
        var name = ""
        var noPairs = 0
    }
}
