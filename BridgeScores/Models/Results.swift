//
//  Results.swift
//  BridgeScores
//
//  Created by Chris Percival on 11/12/22.
//

import Foundation
import UIKit
import MessageUI


class Results: ObservableObject {
    @Published var results = [ResultsRow]()
    
    
    init(event:Event){
        for index in 0..<(event.noPairs ?? 6) {
            results.append(ResultsRow(pairNo:index + 1))
        }
    }
    
    
    //Add all data to Result array
    func fillResultsTable(match:Match,entryNames:EntryNames){
        
        fillPlayerNames(matchResults: self, entryNames: entryNames)
        toteMasterPoints(match: match)
        results.sort()
        for i in 0..<results.count {
            results[i].Rank = i + 1
        }
        
    }
    
    
    
    //    func fillPlayerNames(matchResults: Results, matchPlayers: MatchPlayers){
    func fillPlayerNames(matchResults: Results, entryNames:EntryNames){
        
        for i in 0..<matchResults.results.count{
            results[i].PlayerNames = entryNames.players[i]
        }
        //For use with pull down dialog
        //        for i in 0..<matchResults.results.count {
        //            results[i].PlayerNames =
        //                matchPlayers.players[i].playerOne.firstName
        //                + " & " + matchPlayers.players[i].playerTwo.firstName
        //        }
    }
    
    func toteMasterPoints(match: Match){
        //Inititalize resultRows
        for i in 0..<results.count {
            results[i].masterPoints = 0.0
            results[i].pairNo = i + 1
            results[i].percent = 0.0
            results[i].maxPossible = 0.0
        }
        
        //for each board
        match.Boards.forEach { board in
            //for each contract
            board.contracts.forEach { contract in
                //test for EW Pair and NS Pair not null
                if contract.nsPair != "" && contract.ewPair != ""   {
                    //Caluculate ns numbers
                    let nsPair = (Int(contract.nsPair) ?? 0)
                    results[nsPair - 1].masterPoints += contract.nsMP
                    results[nsPair - 1].maxPossible += 2.0
                    //ew numbers
                    let ewPair = (Int(contract.ewPair) ?? 0)
                    results[ewPair - 1].masterPoints += contract.ewMP
                    results[ewPair - 1].maxPossible += 2.0
                }
            }
        }
        
        
        for i in 0..<results.count {
            results[i].percent =  round( (10 * results[i].masterPoints/results[i].maxPossible) * 100) / 10
        }
    }
    
    
    
    struct ResultsRow: Comparable {
        static func < (lhs: ResultsRow, rhs: ResultsRow) -> Bool {
            return lhs.masterPoints > rhs.masterPoints + 0.01
        }
        
        var pairNo = 0
        var PlayerNames = "Joe & Judy"
        var masterPoints = 0.0
        var maxPossible = 0.0
        var percent = 0.0
        var Rank = 0
    }
    
    
    func printResults(results: Results){
        
        for row in 0..<results.results.count{
            print(String(results.results[row].pairNo)
                  + "  " + String(results.results[row].masterPoints)
                  + "  " + results.results[row].PlayerNames)
        }
        
    }
    
    func outPutCSV(results:Results,event:Event){
        
        //https://medium.com/@CoreyWDavis/reading-writing-and-deleting-files-in-swift-197e886416b0
        let outputPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let fileURL = URL(fileURLWithPath: "Results", relativeTo: outputPath).appendingPathExtension("csv")
        var outputString = ""
        outputString = outputString.appending(event.eventName + "   " + event.stringDate())
        outputString = outputString.appending("\n\("Pair"),\("Players"),\("Rank"),\("Score"),\("Percentage")\n\n")
        for row in 0..<results.results.count{
            outputString = outputString.appending(String(results.results[row].pairNo) + ",")
            outputString = outputString.appending(results.results[row].PlayerNames + ",")
            outputString = outputString.appending(String(results.results[row].Rank) + ",")
            outputString = outputString.appending(String(results.results[row].masterPoints) + ",")
            outputString = outputString.appending(String(results.results[row].percent))
            outputString = outputString.appending("\n")
        }
        
        guard let data = outputString.data(using: .utf8) else {
            print("unable to convert string data")
            return
        }
        // Save the data
        do {
            try data.write(to: fileURL )
            print("File saved: \(fileURL.absoluteURL)")
        } catch {
            // Catch any errors
            print(error.localizedDescription)
        }
        return
        
    }
}
