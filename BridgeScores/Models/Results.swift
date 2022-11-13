//
//  Results.swift
//  BridgeScores
//
//  Created by Chris Percival on 11/12/22.
//

import Foundation


class Results: ObservableObject{
    var noPairs:Int?
    @Published var results = [ResultsRow]()
    
    init(){
        for index in 0..<(noPairs ?? 0) {
            results.append(ResultsRow(pairNo:index))
        }
    }
}


struct ResultsRow {
    var pairNo:Int?
    var PlayerNames = ""
    var masterPoints:Double?
    var percent:Double?
    var Rank:Int?
}
