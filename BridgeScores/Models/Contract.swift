//
//  Contract.swift
//  BridgeScores
//
//  Created by Chris Percival on 4/16/22.
//

import Foundation

struct Board: Decodable,Identifiable {
    var id:UUID?
    var boardNo:Int
    var contracts = [Contract]()
}

//TODO: add which pair got the contract
struct Contract: Decodable,Identifiable {
    
    var id:Int
    var nsPair = ""
    var ewPair = ""
    var bid = ""
    var made = ""
    var down = ""
    var nsScore = ""
    var ewScore = ""
    var ewMP:Double = 0.0
    var nsMP:Double = 0.0
    
    
    mutating func setEWScore (score:String) {
        if score != ""{
            ewScore = String( -Int(score)!)
        }
//        print(self)
    }
    mutating func setNSScore (score:String) {
        if score != ""{
            nsScore = String( -Int(score)!)
        }
//        print(self)
    }


    
}



