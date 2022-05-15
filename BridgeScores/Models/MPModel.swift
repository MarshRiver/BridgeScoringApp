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
        var MP = Array(repeating: 0.0 , count: board.count)
        var ties = Array(repeating: 0.0 , count: board.count)

        //Remove contracts with no players
        board.removeAll(where: {
            $0.nsPair == ""})
        
        //TODO: Assign negative scores from EW score
        for index in 0..<board.count {
            if board[index].nsScore == "" {
                board[index].nsScore = String(-(Int(board[index].ewScore) ?? minusInfinity))
            }
        }
        
        //Sort by NSscore
        board.sort{Int($0.nsScore) ?? minusInfinity > Int($1.nsScore) ?? minusInfinity}
        //Calculate Ties
        for outerIndex in 0..<board.count {
            for innerIndex in 0..<board.count{
                if board[innerIndex].nsScore == board[outerIndex].nsScore{
                    ties[outerIndex] += 1.0
                }
            }
        }
        //Calculate rank
        var index = 0
        var prev: Int?              // previous score
        var currentRank = 0
        var rankingList = [(name: String, score: Int, rank: Int)]()
        
        for contract in board {
            let nsScoreInt = Int(contract.nsScore) ?? minusInfinity
            index += 1
           
            if prev == nil || nsScoreInt != prev! {
                prev = nsScoreInt
                currentRank = index
            }
            rankingList.append((contract.nsPair,nsScoreInt,currentRank))
        }
        //Caluclate master points
        index = 0
        for elem in rankingList {
            
            MP[index] = 3.0 - Double(elem.rank) - (ties[index] - 1.0) * 0.5
            index += 1
        }


        
        
//        matchTable = Array(repeating: MatchPointRow(), count: noPairs)
        
        
    }
}

struct MatchPointRow {
    var pairNo:Int = 0
    var pairMP:Int = 0
    var pairNSScore: Int = kCFNumberNegativeInfinity as! Int
    var tied: Int = 0
    var rank: Int = 0
}

