//
//  BoardView.swift
//  BridgeScores
//
//  Created by Chris Percival on 4/17/22.
//

import SwiftUI

struct CaptionView: View{
    var boardNo:Int
    @EnvironmentObject var match: Match
    @State var resultString = ""
    var body: some View{
        HStack {
            Text("Board " + String(match.Boards[boardNo].id + 1)).font(.title)
            Button("NS Rank: ",action: {
                resultString = match.Boards[boardNo].sortBoard()
            })
            .foregroundColor(.black)

            Text(resultString)
//                .foregroundColor(.black)
                .padding()
//                .frame(width:80)
//                .border(.black, width: 2)
        }

    }
}
struct BoardView: View {
    var boardNo:Int
    @EnvironmentObject var match: Match
    var body: some View {
        VStack{
            CaptionView(boardNo: boardNo)
            ContractRow(rowNo: 0,boardNo: boardNo)
            ContractRow(rowNo: 1,boardNo: boardNo)
            ContractRow(rowNo: 2,boardNo: boardNo)
            ContractRow(rowNo: 3,boardNo: boardNo)
            ContractRow(rowNo: 4,boardNo: boardNo)
            ContractRow(rowNo: 5,boardNo: boardNo)
        }
        .padding(.bottom)
        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
    }

}

struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        BoardView(boardNo: 0).environmentObject(Match())
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
