//
//  NamesView.swift
//  BridgeScores
//
//  Created by Chris Percival on 4/22/22.
//

import SwiftUI

struct NamesRowView:View {
    var rowNo:Int
    @State var playerIndex = 0
    @EnvironmentObject var belfastPlayers: BelfastPlayers
    var body: some View{
        HStack {
            Text(String(rowNo + 1))
            Picker("First Name", selection: $playerIndex, content: {
                ForEach(0..<belfastPlayers.players.count,id:\.self){ i in
                    Text(belfastPlayers.players[i].firstName + " " +
                         belfastPlayers.players[i].lastName)
                }
            })
        }

    }
    
}

struct NamesView: View {
    @State var matchPlayers = MatchPlayers()
    @State var belfastPlayers = BelfastPlayers()
    private var noPairs = 12
    var body: some View {
        VStack(alignment:.leading) {
            ForEach(0..<noPairs,id:\.self) { i in
                NamesRowView(rowNo: i)
            }
        }
        .environmentObject(belfastPlayers)
    }
}

struct NamesView_Previews: PreviewProvider {
    static var previews: some View {
        NamesView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
