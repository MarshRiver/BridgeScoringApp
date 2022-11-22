//
//  Match.swift
//  BridgeScores
//
//  Created by Chris Percival on 4/20/22.
//

import Foundation

class Match: ObservableObject {
    @Published var noPairs = 6 {
        willSet{
            boardFileName = "Howell-" + String(newValue)
            getLocalData(fileName: boardFileName)
        }
    }
    @Published var isLoaded = false
    @Published var boardFileName = "Howell-6"
    @Published var Boards = [Board]()
    

    required init() {
        
        getLocalData(fileName:boardFileName)
        
    }
    
    func getLocalData(fileName:String) {

        isLoaded = false
        // Get a url to the json file
        let jsonUrl = Bundle.main.url(forResource: fileName, withExtension: "json")
        
        do {
            // Read the file into a data object
            let jsonData = try Data(contentsOf: jsonUrl!)
            
            // Try to decode the json into an array of modules
            let jsonDecoder = JSONDecoder()
            let boards = try jsonDecoder.decode([Board].self, from: jsonData)
            
            // Assign parsed modules to modules property
            self.Boards = boards
        }
        catch {
            // TODO log error
            print("Couldn't parse local data")
        }
        isLoaded = true
//        print(self.Boards)
    }
    

    func toteMasterPoints(matchResults: Results){
        //for each board
        self.Boards.forEach { board in
            //for each contract
            board.contracts.forEach { contract in
                //test for EW Pair and NS Pair not null
                if contract.nsPair != "" && contract.ewPair != ""   {
                    matchResults.results[(Int(contract.nsPair) ?? 0) - 1].masterPoints += contract.nsMP
                }
            }
        }
        printResults(results: matchResults)
    }
}
