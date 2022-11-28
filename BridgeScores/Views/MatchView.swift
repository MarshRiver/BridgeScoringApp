//
//  MatchView.swift
//  BridgeScores
//
//  Created by Chris Percival on 11/28/22.
//

import SwiftUI

struct MatchView: View {
    @EnvironmentObject var match:Match
    var body: some View {
        ScrollView {
            ForEach(match.Boards,id:\.boardNo){ board in
                if board.boardNo < match.Boards.count{
                    BoardView(boardNo: board.boardNo)
                }
                
            }
        }
        .environmentObject(match)

    }
}

struct MatchView_Previews: PreviewProvider {
    static var previews: some View {
        MatchView()
            .environmentObject(Match(event: Event()))
            .previewInterfaceOrientation(.landscapeRight)

    }
}
