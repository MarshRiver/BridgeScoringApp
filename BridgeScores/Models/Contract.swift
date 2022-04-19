//
//  Contract.swift
//  BridgeScores
//
//  Created by Chris Percival on 4/16/22.
//

import Foundation


class Match: ObservableObject {
    @Published var Boards =
                        [Board(id:0,contracts: [Contract(nsPair:""),
                                               Contract(nsPair:"2",ewPair: "4"),
                                               Contract(nsPair:"3",ewPair: "7"),
                                               Contract(nsPair:""),
                                               Contract(nsPair:"5",ewPair: "6"),
                                               Contract(nsPair:"")]),
                        Board(id:1,contracts: [Contract(nsPair:""),
                                               Contract(nsPair:"2",ewPair: "4"),
                                               Contract(nsPair:"3",ewPair: "7"),
                                               Contract(nsPair:""),
                                               Contract(nsPair:"5",ewPair: "6"),
                                               Contract(nsPair:"")]),
                        Board(id:2,contracts: [Contract(nsPair:""),
                                               Contract(nsPair:"2",ewPair: "4"),
                                               Contract(nsPair:"3",ewPair: "7"),
                                               Contract(nsPair:""),
                                               Contract(nsPair:"5",ewPair: "6"),
                                               Contract(nsPair:"")]),
                        Board(id:3,contracts: [Contract(nsPair:""),
                                               Contract(nsPair:"2",ewPair: "4"),
                                               Contract(nsPair:"3",ewPair: "7"),
                                               Contract(nsPair:""),
                                               Contract(nsPair:"5",ewPair: "6"),
                                               Contract(nsPair:"")]),
                        Board(id:4),
                        Board(id:4)
                        ]
}


struct Board{
    var id:Int
    var contracts = [Contract]()
    
    func sortBoard() -> String {
//        let contracts = self.contracts
        let sortedContracts = contracts.sorted(by: {Int($0.nsScore) ?? 0 > Int($1.nsScore) ?? 0})
//        sortedContracts = contracts.sorted(by: {$0.nsScore > $1.nsScore})
        print(contracts)
        print(sortedContracts)
        return(sortedContracts[0].nsPair + " , " + sortedContracts[1].nsPair + " , " + sortedContracts[2].nsPair)
    }
    
    mutating func calcMP(){
        let sortedContracts = contracts.sorted(by: {Int($0.nsScore) ?? 0 > Int($1.nsScore) ?? 0})
        
        //If ns pair numbers are not empty
        
        if(sortedContracts[0].nsPair != "") && (sortedContracts[1].nsPair != "") && (sortedContracts[2].nsPair != ""){
            //Check for tie in first
            if sortedContracts[0].nsScore == sortedContracts[1].nsScore
            {
                //player 1 get 1.5 pts, player 2 gets 1.5 pts
                let playerNo = sortedContracts[0].nsPair
                let contractIndex = contracts.firstIndex(where: { $0.nsPair == playerNo})
                contracts[contractIndex!].nsMP = 1.5
                print(contracts[contractIndex!].nsMP)
            } else {
                // player 1 gets 2
                
                //Check for tie in second
                if (sortedContracts[1].nsScore == sortedContracts[2].nsScore)
                {
                    //player 2 gets .5, player 3 gets .5
                    
                }
                else {
                    //player 2 get 1 pt, player 3 gets 0
                }
            }
        }
        
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



