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
    @State var playerIndex1 = 0
    @EnvironmentObject var belfastPlayers: BelfastPlayers
    @EnvironmentObject var matchPlayers:MatchPlayers
    
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
            .padding(.trailing)
           //Fill matchPlayers with the selected name
            .onChange(of: playerIndex) {newValue in
                matchPlayers.players[rowNo].playerOne.firstName = belfastPlayers.players[newValue].firstName
                matchPlayers.players[rowNo].playerOne.lastName = belfastPlayers.players[newValue].lastName
//                print(matchPlayers.players)

            }
            .onChange(of: playerIndex1){ newValue in
                matchPlayers.players[rowNo].playerTwo.firstName = belfastPlayers.players[newValue].firstName
                matchPlayers.players[rowNo].playerTwo.lastName = belfastPlayers.players[newValue].lastName
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
            }).padding(.leading)
            Spacer()
        }
        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct NamesView: View {
    @State var belfastPlayers = BelfastPlayers()
    @EnvironmentObject var event:Event
    @EnvironmentObject var matchPlayers:MatchPlayers

    var body: some View {
        VStack(alignment:.leading) {
            HStack(alignment: .center){
                Text("PairNo")
                Text("Player One")
                Text("Player Two")
            }.frame(width: 600)
     
            //Name picker
            VStack {
                ForEach(0..<event.noPairs,id:\.self) { i in
                    NamesRowView(rowNo: i).frame(width: 600, height: 48, alignment: .topLeading).tag(i+1)
                }
            }
        }
        .environmentObject(belfastPlayers)
        .padding()
    }
}

struct NamesView_Previews: PreviewProvider {
    static var previews: some View {
        NamesView().environmentObject(Event())
            .previewInterfaceOrientation(.portraitUpsideDown)
    }
}
