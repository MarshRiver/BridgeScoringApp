//
//  MatchView.swift
//  BridgeScores
//
//  Created by Chris Percival on 11/28/22.
//

import SwiftUI

struct MatchView: View {
    @EnvironmentObject var match:Match
    @EnvironmentObject var event:Event
    var body: some View {
        ScrollView {
            LazyVStack{
                
                ForEach(match.Boards,id:\.boardNo){ board in
                    if board.boardNo < match.Boards.count{
                        BoardView(boardNo: board.boardNo)
                    }
                    
                }
            }
        }
        .environmentObject(match)
        .environmentObject(event)
    }
}


struct MatchView_Previews: PreviewProvider {
    static var previews: some View {
        MatchView()
            .environmentObject(Match(event: Event()))
            .environmentObject(Event())
            .previewInterfaceOrientation(.landscapeRight)

    }
}
