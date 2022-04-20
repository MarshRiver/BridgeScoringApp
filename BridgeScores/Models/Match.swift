//
//  Match.swift
//  BridgeScores
//
//  Created by Chris Percival on 4/20/22.
//

import Foundation




class MatchModel: ObservableObject {
    @Published var Boards = [Board]()

    init() {
        
        getLocalData()
        
    }

    
    func getLocalData() {
        
        // Get a url to the json file
        let jsonUrl = Bundle.main.url(forResource: "Match6", withExtension: "json")
        
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
        
        print(self.Boards)
    }
    

}
