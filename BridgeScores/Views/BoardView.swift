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
                ZStack{
                    RoundedRectangle(cornerRadius: 15)
                        .fill(.cyan)
                        .opacity(0.3)
                        .frame(width: 800,height: 40)
                        .shadow(radius: 15.0,x:-5,y:10)
                    Text("Board " + String(match.Boards[boardNo].boardNo + 1))
                        .font(.title)
                        .padding()
                }
            }

        }
    }
}


struct BoardView: View {
    var boardNo:Int
    @EnvironmentObject var match: Match
    @EnvironmentObject var event: Event
    @EnvironmentObject var matchPointRow:MatchPointRow
    var body: some View {
        
        VStack{
            CaptionView(boardNo: boardNo)
            ForEach(0..<event.noPairs,id:\.self){ i in
                if (boardNo < match.Boards.count) && (i < match.Boards[boardNo].contracts.count) {
                    ContractRow(rowNo:i,boardNo: boardNo)
                }
            }
        }
        .padding()        
        .border(.cyan, width: /*@START_MENU_TOKEN@*/4/*@END_MENU_TOKEN@*/)
        
    }
}

struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        BoardView(boardNo: 0)
            .environmentObject(Match(event:Event()))
            .environmentObject(Event())
            .environmentObject(MatchPointRow())
            .previewInterfaceOrientation(.landscapeRight)
    }
}
