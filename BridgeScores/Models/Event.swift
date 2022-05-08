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
    @Published var eventName = "Belfast"

    @Published var matchPlayers:MatchPlayers
    
    init(){
        matchPlayers = MatchPlayers()
        matchPlayers.noPairs = 6
    }
    
}
