//
//  ContractRow.swift
//  BridgeScores
//
//  Created by Chris Percival on 4/16/22.
//

import SwiftUI

struct TextBox: View{
    var s:String
    var body: some View{
        Text(s)
            .bold()
            .frame(width:50)
    }
}

//struct NewContractRow: View {
//    var contract:Contract
//
//    var body: some View {
//
//        VStack {
//            HStack{
//                TextBox(s: String(contract.nsMP))
//                    .font(.title2)
//                TextField("NSPair",text: contract.nsPair)
//                    .font(.title2)
//                    .frame(width:100)
//                TextField("Bid",text: contract.bid)
//                    .font(.title2)
//                    .frame(width:100)
//                TextField("Made",text: contract.made)
//                    .font(.title2)
//                    .frame(width:100)
//                TextField("Down",text: contract.down)
//                    .font(.title2)
//                    .frame(width:100)
//                TextField("NSScore",text: contract.nsScore)
//                    .font(.title2)
//                    .keyboardType(.numberPad)
//                    .frame(width:100)
////                    .onSubmit{
////                        contract.setEWScore(score: contract.nsScore)
////                    }
//                TextField("EWScore",text: contract.ewScore)
//                    .font(.title2)
//                    .keyboardType(.numberPad)
//                    .frame(width:100)
////                    .onSubmit{
////                        contract.setNSScore(score: contract.ewScore)
////                    }
//                TextField("EWPair",text: contract.ewPair)
//                    .frame(width:100)
//                    .font(.title2)
//                TextBox(s: String(contract.ewMP))
//                    .font(.title2)
//            }
//        }
//        .padding(.bottom, 2.0)
//    }
//}


struct ContractRow: View {
    var rowNo:Int
    var boardNo:Int
    @EnvironmentObject var match: Match
    @State private var ewScore = ""
    @State private var nsScore = ""

    
    var body: some View {
        VStack {
            HStack{
                TextBox(s: String(match.Boards[boardNo].contracts[rowNo].nsMP))
                    .font(.title2)
                TextField("NSPair",text: $match.Boards[boardNo].contracts[rowNo].nsPair)
                    .font(.title2)
                    .frame(width:100)
                TextField("Bid",text: $match.Boards[boardNo].contracts[rowNo].bid)
                    .font(.title2)
                    .frame(width:100)
                TextField("Made",text: $match.Boards[boardNo].contracts[rowNo].made)
                    .font(.title2)
                    .frame(width:100)
                TextField("Down",text: $match.Boards[boardNo].contracts[rowNo].down)
                    .font(.title2)
                    .frame(width:100)
                TextField("NSScore",text: $match.Boards[boardNo].contracts[rowNo].nsScore)
                    .font(.title2)
                    .keyboardType(.numberPad)
                    .frame(width:100)
                    .onSubmit{
                        match.Boards[boardNo].contracts[rowNo].setEWScore(score: match.Boards[boardNo].contracts[rowNo].nsScore)
                    }
                TextField("EWScore",text: $match.Boards[boardNo].contracts[rowNo].ewScore)
                    .font(.title2)
                    .keyboardType(.numberPad)
                    .frame(width:100)
                    .onSubmit{
                        match.Boards[boardNo].contracts[rowNo].setNSScore(score: match.Boards[boardNo].contracts[rowNo].ewScore)
                    }
                TextField("EWPair",text: $match.Boards[boardNo].contracts[rowNo].ewPair)
                    .frame(width:100)
                    .font(.title2)
                TextBox(s: String(match.Boards[boardNo].contracts[rowNo].ewMP))
                    .font(.title2)
            }
        }
        .padding(.bottom, 2.0)
    }
        

}

struct ContractRow_Previews: PreviewProvider {
    static var previews: some View {
        ContractRow(rowNo: 0,boardNo: 0)
            .environmentObject(Match())
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
