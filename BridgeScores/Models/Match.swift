//
//  Match.swift
//  BridgeScores
//
//  Created by Chris Percival on 4/20/22.
//

import Foundation

class Match: ObservableObject {

    
    @Published var isLoaded = false
    @Published var Boards = [Board]()
    
    required init(event: Event) {
        getLocalData(fileName:event.eventMovementName)
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
            print("Couldn't parse local data: match.swift")
        }
        isLoaded = true
    }
    

}
