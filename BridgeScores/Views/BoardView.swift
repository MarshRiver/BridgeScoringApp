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
            Text("Board " + String(match.Boards[boardNo].boardNo + 1))
                .font(.title)
                .padding()
//            ZStack {
//                RoundedRectangle(cornerRadius: 15)
//                    .fill(.cyan)
//                    .frame(width: 120,height: 40)
//                    .shadow(radius: 15.0,x:-5,y:10)
//                Button("Master Points",action: {
//                    match.Boards[boardNo].calcMP()
//                 })
//                .foregroundColor(.white)
//            }

        }
    }
}


struct BoardView: View {
    var boardNo:Int
    @EnvironmentObject var match: Match
    var body: some View {
        VStack{
            CaptionView(boardNo: boardNo)
            let noPairs = match.noPairs

            ForEach(0..<noPairs,id:\.self){ i in
                ContractRow(rowNo:i,boardNo: boardNo)
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
