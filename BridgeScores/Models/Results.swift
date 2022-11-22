//
//  Results.swift
//  BridgeScores
//
//  Created by Chris Percival on 11/12/22.
//

import Foundation


class Results: ObservableObject{
    @Published var results = [ResultsRow]()
    var rowCount = 0
    
    init(){
        for index in 0..<6 {
            results.append(ResultsRow(pairNo:index + 1))
//            results[index].PlayerNames = String(matchPlayers.players[
        }
    }
    
    init(noPairs:Int!){
        rowCount = noPairs
        for index in 0..<noPairs {
            results.append(ResultsRow(pairNo:index + 1))
//            results[index].PlayerNames = String(index)
        }
    }
    
    func fillResults(){
        
    }
    
    func fillPlayerNames(matchResults: Results, matchPlayers: MatchPlayers){
        
        for i  in 0..<matchResults.results.count {
            matchResults.results[i].PlayerNames =
            matchPlayers.players[i].playerOne.firstName
            + " & " + matchPlayers.players[i].playerTwo.firstName
        }
        
        
    }

}

struct ResultsRow {
    var pairNo = 0
    var PlayerNames = "Joe & Judy"
    var masterPoints = 0.0
    var percent = 0.0
    var Rank = 0
}


func printResults(results: Results){
    
    for row in 0..<results.rowCount{
        print(String(results.results[row].pairNo)
              + "  " + String(results.results[row].masterPoints)
              + "  " + results.results[row].PlayerNames)
    }
    
}
