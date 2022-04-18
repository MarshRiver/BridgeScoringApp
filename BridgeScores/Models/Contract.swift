//
//  Contract.swift
//  BridgeScores
//
//  Created by Chris Percival on 4/16/22.
//

import Foundation


class Match: ObservableObject {
    @Published var Boards =
                        [Board(id:0,contracts: [Contract(nsPair:"1"),
                                               Contract(nsPair:"2",ewPair: "3"),
                                               Contract(nsPair:"3",ewPair: "6"),
                                               Contract(nsPair:"4"),
                                               Contract(nsPair:"5",ewPair: "5"),
                                               Contract(nsPair:"6")]),
                        Board(id:1),
                        Board(id:2),
                        Board(id:3),
                        Board(id:4),
                        Board(id:4)
                        ]
}


struct Board{
    var id:Int
    var contracts = [Contract]()
    
    func sortBoard() -> String {
        let contracts = self.contracts
        let sortedContracts = contracts.sorted(by: {$0.nsScore > $1.nsScore})
//        sortedContracts = contracts.sorted(by: {$0.nsScore > $1.nsScore})
//        print(contracts)
//        print(sortedContracts)
        return(sortedContracts[0].nsPair + " , " + sortedContracts[1].nsPair + " , " + sortedContracts[2].nsPair)
    }
}

struct Contract {
    
//    var id:Int
    var nsPair = ""
    var ewPair = ""
    var bid = ""
    var made = ""
    var down = ""
    var nsScore = ""
    var ewScore = ""
    var ewMP:Double = 0
    var nsMP:Double = 0
    
    
    mutating func setEWScore (score:String) {
        if score != ""{
            ewScore = String( -Int(score)!)
        }
        print(self)
    }
    mutating func setNSScore (score:String) {
        if score != ""{
            nsScore = String( -Int(score)!)
        }
        print(self)
    }


    
}



