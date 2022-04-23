//
//  Contract.swift
//  BridgeScores
//
//  Created by Chris Percival on 4/16/22.
//

import Foundation

struct Board: Decodable {
    var id:Int = 0
    var contracts = [Contract]()

    
//    func sortBoard() -> String {
//        let sortedContracts = contracts.sorted(by: {Int($0.nsScore) ?? 0 > Int($1.nsScore) ?? 0})
////        print(sortedContracts)
//        return(sortedContracts[0].nsPair + " , " + sortedContracts[1].nsPair + " , " + sortedContracts[2].nsPair)
//    }
    
    mutating func calcMP(){
        let sortedContracts = contracts.sorted(by: {Int($0.nsScore) ?? Int(-INT_MAX) > Int($1.nsScore) ?? Int(-INT_MAX)})
//        print(sortedContracts)
        //If ns pair numbers are not empty
        
        if(sortedContracts[0].nsPair != "") && (sortedContracts[1].nsPair != "") && (sortedContracts[2].nsPair != ""){
            //Check for tie in first
            if sortedContracts[0].nsScore == sortedContracts[1].nsScore
            {
                //player 1 get 1.5 pts, player 2 gets 1.5 pts
                var playerNo = sortedContracts[0].nsPair
                var contractIndex = contracts.firstIndex(where: { $0.nsPair == playerNo})
                contracts[contractIndex!].nsMP = 1.5
                contracts[contractIndex!].ewMP = 0.5
                playerNo = sortedContracts[1].nsPair
                contractIndex = contracts.firstIndex(where: { $0.nsPair == playerNo})
                contracts[contractIndex!].nsMP = 1.5
                contracts[contractIndex!].ewMP = 0.5
            } else {
                // player 1 gets 2
                let playerNo = sortedContracts[0].nsPair
                let contractIndex = contracts.firstIndex(where: { $0.nsPair == playerNo})
                contracts[contractIndex!].nsMP = 2
                //Check for tie in second
                if (sortedContracts[1].nsScore == sortedContracts[2].nsScore)
                {
                    //player 2 gets .5, player 3 gets .5
                    var playerNo = sortedContracts[1].nsPair
                    var contractIndex = contracts.firstIndex(where: { $0.nsPair == playerNo})
                    contracts[contractIndex!].nsMP = 0.5
                    contracts[contractIndex!].ewMP = 1.5
                    playerNo = sortedContracts[2].nsPair
                    contractIndex = contracts.firstIndex(where: { $0.nsPair == playerNo})
                    contracts[contractIndex!].nsMP = 0.5
                    contracts[contractIndex!].ewMP = 1.5

                }
                else {
                    //player 2 get 1 pt, player 3 gets 0
                    var playerNo = sortedContracts[1].nsPair
                    var contractIndex = contracts.firstIndex(where: { $0.nsPair == playerNo})
                    contracts[contractIndex!].nsMP = 1.0
                    contracts[contractIndex!].ewMP = 1.0
                    playerNo = sortedContracts[2].nsPair
                    contractIndex = contracts.firstIndex(where: { $0.nsPair == playerNo})
                    contracts[contractIndex!].nsMP = 0.0
                    contracts[contractIndex!].ewMP = 2.0
                }
            }
        }
        
    }
}

struct Contract: Decodable {
    
    var id:UUID?
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



