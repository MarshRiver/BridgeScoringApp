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
            .padding(.horizontal, 3.0)
            .frame(width:80)
    }
}

struct ContractTextBox: View{
    var legend:String
    @State var s:String
    var color:Color = .gray
    var body: some View{
        TextField(legend, text: $s)
            .padding(.horizontal, 3.0)
            .background(color)
            .frame(width:80)
    }
}


struct ContractRow: View {
    var rowNo:Int = 0
    @EnvironmentObject var match: Match
//    @State var contract = Contract()
    @State private var ewScore = ""
    @State private var nsScore = ""

    
    var body: some View {
        VStack {
            HStack{
                TextField("NSPair",text: $match.Boards[0].contracts[rowNo].nsPair)
                    .frame(width:80)
                TextField("Bid",text: $match.Boards[0].contracts[rowNo].bid)
                    .frame(width:80)
                TextField("Made",text: $match.Boards[0].contracts[rowNo].made)
                    .frame(width:80)
                TextField("Down",text: $match.Boards[0].contracts[rowNo].down)
                    .frame(width:80)
                TextField("NSScore",text: $match.Boards[0].contracts[rowNo].nsScore)
                    .frame(width:80)
                    .onSubmit{
                        match.Boards[0].contracts[rowNo].setEWScore(score: match.Boards[0].contracts[rowNo].nsScore)
                    }
                TextField("EWScore",text: $match.Boards[0].contracts[rowNo].ewScore)
                    .frame(width:80)
                    .onSubmit{
                        match.Boards[0].contracts[rowNo].setNSScore(score: match.Boards[0].contracts[rowNo].ewScore)
                    }
                TextBox(s: String(match.Boards[0].contracts[rowNo].nsMP))
                TextBox(s: String(match.Boards[0].contracts[rowNo].ewMP))
                TextField("EWPair",text: $match.Boards[0].contracts[rowNo].ewPair)
                    .frame(width:80)
                
            }.padding()
        }
    }
        

}

struct ContractRow_Previews: PreviewProvider {
    static var previews: some View {
        ContractRow(rowNo: 0).environmentObject(Match())
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
