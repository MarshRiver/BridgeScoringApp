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
//        players.append(Player(firstName: "Deb", lastName: "Walters"))
//        players.append(Player(firstName: "Jim",lastName: "Cunningham"))
//        players.append(Player(firstName: "Fay", lastName: "Cunningham"))
//        players.append(Player(firstName: "Debbie", lastName: ""))
//        players.append(Player(firstName: "Deb",lastName: "C."))
//        players.append(Player(firstName: "Joshua", lastName: ""))
        
        // Get a url to the json file
        let jsonUrl = Bundle.main.url(forResource: "Names", withExtension: "json")

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
            print("Couldn't parse local data")
        }

    }
}


class MatchPlayers: ObservableObject{
    var noPairs:Int = 6
    @Published var players = [Pair]()
    
    init(){
        for i in 0 ..< noPairs {
            players.append(Pair())
            players[i].pairNo = i + 1
        }
    }
}

struct Player:Decodable {
     var firstName = ""
     var lastName = ""
}

struct Pair {
    var pairNo:Int = 0
    var playerOne = Player()
    var playerTwo = Player()
}
