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
    @EnvironmentObject var matchData: MatchData
    @State var resultString = ""
    var body: some View{
        HStack {
            Text(String(matchData.noPairs))
            Text("Board " + String(match.Boards[boardNo].id + 1))
                .font(.title)
                .padding()
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .fill(.cyan)
                    .frame(width: 120,height: 40)
                    .shadow(radius: 15.0,x:-5,y:10)
                Button("Master Points",action: {
                    match.Boards[boardNo].calcMP()
                 })
                .foregroundColor(.white)
            }

        }
    }
}
struct BoardView: View {
    var boardNo:Int
    @EnvironmentObject var match: Match
    @EnvironmentObject var matchData: MatchData
    var body: some View {
        VStack{
            CaptionView(boardNo: boardNo)
            ForEach(0..<matchData.noPairs,id:\.self){ i in
                ContractRow(rowNo:i,boardNo: boardNo)
            }
//            ContractRow(rowNo: 0,boardNo: boardNo)
//            ContractRow(rowNo: 1,boardNo: boardNo)
//            ContractRow(rowNo: 2,boardNo: boardNo)
//            ContractRow(rowNo: 3,boardNo: boardNo)
//            ContractRow(rowNo: 4,boardNo: boardNo)
//            ContractRow(rowNo: 5,boardNo: boardNo)
        }
        .padding(.bottom)
        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
        .environmentObject(matchData)
    }

}

struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        BoardView(boardNo: 0)
            .environmentObject(Match())
            .environmentObject(MatchData())
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
