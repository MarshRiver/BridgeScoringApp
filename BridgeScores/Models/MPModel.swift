//
//  MPModel.swift
//  BridgeScores
//
//  Created by Chris Percival on 5/10/22.
//

import Foundation


class MatchPointTable {
//    var match:Match = Match()
    let minusInfinity = -Int.max
    var noPairs:Int = 6
    var matchTable = [MatchPointRow]()
    
    init() {
        matchTable = Array(repeating:MatchPointRow(),count:noPairs)
    }

    func fillMatchTable(match:Match,boardNo:Int) {
        self.noPairs = match.noPairs
        
        //Assign current board contracts to our board array
        var board = match.Boards[boardNo].contracts
        //Remove contracts with no players
        board.removeAll(where: {
            $0.nsPair == ""})
        
        //TODO: Assign negative scores from EW score
        
        
        //Sort by NSscore
        board.sort{Int($0.nsScore) ?? minusInfinity > Int($1.nsScore) ?? minusInfinity}
        
        matchTable = Array(repeating: MatchPointRow(), count: noPairs)
        
        
    }
}

struct MatchPointRow {
    var pairNo:Int = 0
    var pairMP:Int = 0
    var pairNSScore: Int = kCFNumberNegativeInfinity as! Int
    var tied: Int = 0
    var rank: Int = 0
}

