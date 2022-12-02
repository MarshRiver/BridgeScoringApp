//
//  Results.swift
//  BridgeScores
//
//  Created by Chris Percival on 11/12/22.
//

import Foundation


class Results: ObservableObject{
    @Published var results = [ResultsRow]()
//    init(noPairs:Int!){
    init(event:Event){
//        rowCount = event.noPairs
        for index in 0..<event.noPairs {
            results.append(ResultsRow(pairNo:index + 1))
        }
    }
    
    func fillPlayerNames(matchResults: Results, matchPlayers: MatchPlayers){
        
        for i  in 0..<matchResults.results.count {
            results[i].PlayerNames =
                matchPlayers.players[i].playerOne.firstName
                + " & " + matchPlayers.players[i].playerTwo.firstName
        }
        
        
    }
    
    func toteMasterPoints(match: Match){
        //Inititalize resultRows
//        print("in results")
//        print(match.Boards[0])
        for i in 0..<results.count {
            results[i].masterPoints = 0.0
        }
        
        //for each board
        match.Boards.forEach { board in
            //for each contract
            board.contracts.forEach { contract in
                //test for EW Pair and NS Pair not null
                if contract.nsPair != "" && contract.ewPair != ""   {
                    results[(Int(contract.nsPair) ?? 0) - 1].masterPoints += contract.nsMP
                    results[(Int(contract.ewPair) ?? 0) - 1].masterPoints += contract.ewMP
                }
            }
        }
//        printResults(results: matchResults)
    }

}

struct ResultsRow: Comparable {
        static func < (lhs: ResultsRow, rhs: ResultsRow) -> Bool {
            return lhs.masterPoints > rhs.masterPoints + 0.01
        }
        
    var pairNo = 0
    var PlayerNames = "Joe & Judy"
    var masterPoints = 0.0
    var percent = 0.0
    var Rank = 0
}


//func printResults(results: Results){
//
//    for row in 0..<results.rowCount{
//        print(String(results.results[row].pairNo)
//              + "  " + String(results.results[row].masterPoints)
//              + "  " + results.results[row].PlayerNames)
//    }
//
//}
