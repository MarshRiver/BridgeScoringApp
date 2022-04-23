//
//  NamesView.swift
//  BridgeScores
//
//  Created by Chris Percival on 4/22/22.
//

import SwiftUI


struct NamesView: View {
    @State var matchPlayers = MatchPlayers()
    @State var belfastPlayers = BelfastPlayers()
    @State var playerIndex = 0
    private var noPairs = 6
    var body: some View {
        VStack {
            HStack{
                Picker("First Name", selection: $playerIndex, content: {
                    ForEach(0..<belfastPlayers.players.count,id:\.self){ i in
                        Text(belfastPlayers.players[i].firstName + " " + belfastPlayers.players[i].lastName)
                    }
                })
}
            
            ForEach(0..<noPairs,id:\.self) { i in
                HStack {
                    Text(String(matchPlayers.players[i].pairNo))
                    TextField("Name", text: $matchPlayers.players[i].playerOne.firstName)
                    TextField("Name", text: $matchPlayers.players[i].playerTwo.firstName)
                }
            }
        }
    }
}

struct NamesView_Previews: PreviewProvider {
    static var previews: some View {
        NamesView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
