//
//  NamesRowView.swift
//  BridgeScores
//
//  Created by Chris Percival on 11/29/22.
//

import SwiftUI

struct NamesRowView: View {
    var rowNo:Int
    @State var belfastPlayers = BelfastPlayers()
    @EnvironmentObject var matchPlayers:MatchPlayers
    @State var playerIndex = 0
    @State var playerIndex1 = 0
    
    var body: some View{
        HStack(alignment: .center) {
            Text(String(rowNo + 1))
                    .frame(width:30)
                //Picker for the first player of a pair
                Picker("Player 1", selection: $playerIndex, content: {
                    ForEach(0..<belfastPlayers.players.count,id:\.self)
                    { i in
                        Text(belfastPlayers.players[i].firstName + " " +
                             belfastPlayers.players[i].lastName)
                    }
                })
                //.padding(.trailing)
                //Fill matchPlayers with the selected name
                .onChange(of: playerIndex) {newValue in
                    matchPlayers.players[rowNo].playerOne.firstName = belfastPlayers.players[newValue].firstName
                    matchPlayers.players[rowNo].playerOne.lastName = belfastPlayers.players[newValue].lastName
                    //                print(matchPlayers.players)
                    
                }
                
                Spacer()
                //Picker for the second player of a pair
                Picker("Player 2", selection: $playerIndex1, content: {
                    ForEach(0..<belfastPlayers.players.count,id:\.self)
                    { i in
                        Text(belfastPlayers.players[i].firstName + " " +
                             belfastPlayers.players[i].lastName)
                    }
                })//.padding(.leading)
                .onChange(of: playerIndex1){ newValue in
                    matchPlayers.players[rowNo].playerTwo.firstName = belfastPlayers.players[newValue].firstName
                    matchPlayers.players[rowNo].playerTwo.lastName = belfastPlayers.players[newValue].lastName
                    //                print(matchPlayers.players)
                }
                Spacer()
        }
        }
    }




struct NamesRowView_Previews: PreviewProvider {
    static var previews: some View {
        NamesRowView(rowNo: 0)
            .environmentObject(MatchPlayers(event:Event()))

    }
}
