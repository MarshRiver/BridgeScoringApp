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
            if boardNo < match.Boards.count {
                Text("Board " + String(match.Boards[boardNo].boardNo + 1))
                    .font(.title)
                .padding()
            }

        }
    }
}


struct BoardView: View {
    var boardNo:Int
    @EnvironmentObject var match: Match
    var body: some View {
        
        VStack{
            CaptionView(boardNo: boardNo)

            ForEach(0..<match.noPairs,id:\.self){ i in
                if (boardNo < match.Boards.count) && (i < match.Boards[boardNo].contracts.count) {
                    ContractRow(rowNo:i,boardNo: boardNo)
                }
            }
        }
        .padding(.bottom)
        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
    }
    

}

struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        BoardView(boardNo: 0)
            .environmentObject(Match())
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
