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
        players.append(Player(firstName: "Deb", lastName: "Walters"))
        players.append(Player(firstName: "Jim",lastName: "Cunningham"))
        players.append(Player(firstName: "Fay", lastName: "Cunningham"))
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

struct Player {
     var firstName = ""
     var lastName = ""
}

struct Pair {
    var pairNo:Int = 0
    var playerOne = Player()
    var playerTwo = Player()
}
