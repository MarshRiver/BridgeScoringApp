//
//  MPModel.swift
//  BridgeScores
//
//  Created by Chris Percival on 5/10/22.
//

import Foundation


class MatchPointTable {
    var noPairs:Int = 6
    var matchTable = [MatchPointRow]()
    
    init() {
        matchTable = Array(repeating:MatchPointRow(),count:noPairs)
    }
}

struct MatchPointRow {
    var pairNo:Int = 0
    var pairMP:Int = 0
    var pairNSScore: Int = 0
    var tied: Int = 0
    var rank: Int = 0
}

func fillMatchTable() {
    
}
