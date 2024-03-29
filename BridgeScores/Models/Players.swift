//
//  Players.swift
//  BridgeScores
//
//  Created by Chris Percival on 4/22/22.
//

import Foundation

class BelfastPlayers:ObservableObject {
    @Published var players = [Player]()
    
    init(){
        // Get a url to the json file
        let jsonUrl = Bundle.main.url(forResource: "BelfastNames", withExtension: "json")

        do {
            // Read the file into a data object
            let jsonData = try Data(contentsOf: jsonUrl!)

            // Try to decode the json into an array of modules
            let jsonDecoder = JSONDecoder()
            let players = try jsonDecoder.decode([Player].self, from: jsonData)

            // Assign parsed modules to modules property
            self.players = players
        }
        catch {
            // TODO log error
            print("Couldn't parse local data in Players.swift")
        }

    }
}


class EntryNames: ObservableObject {
    @Published var players = [String]()
    
    init(event:Event){
        for _ in 0..<event.noPairs{
            players.append("")
            
        }
    }
}

class MatchPlayers: ObservableObject {
//    var noPairs:Int!
    @Published var players = [Pair]()
    
//    init(noPairs:Int!){
    init(event:Event){
        for i in 0 ..< (event.noPairs ?? 6) {
            players.append(Pair())
            players[i].pairNo = i + 1
        }
    }
}

struct Pair {
    var pairNo:Int = 0
    var playerOne = Player()
    var playerTwo = Player()
}

struct Player:Decodable {
     var firstName = ""
     var lastName = ""
}
