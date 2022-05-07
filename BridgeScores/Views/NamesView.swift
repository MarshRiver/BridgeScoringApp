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
    var body: some View{
        HStack {
            Text(String(rowNo + 1)).frame(width:30)
            Picker("First Name", selection: $playerIndex, content: {
                ForEach(0..<belfastPlayers.players.count,id:\.self)
                    { i in
                    Text(belfastPlayers.players[i].firstName + " " +
                         belfastPlayers.players[i].lastName)
                        .frame(width: 200)
                        .foregroundColor(.pink)
                }
            }).foregroundColor(.black)
            Spacer()
            Picker("First Name", selection: $playerIndex1, content: {
                ForEach(0..<belfastPlayers.players.count,id:\.self)
                    { i in
                    Text(belfastPlayers.players[i].firstName + " " +
                         belfastPlayers.players[i].lastName)
                    .frame(width:200)
                    .foregroundColor(.black)
                }
            })
            .foregroundColor(.black)
            Spacer()
        }
        .frame(width: 400, alignment: .leading)

    }
    
}

struct NamesView: View {
    @State var matchPlayers = MatchPlayers()
    @State var belfastPlayers = BelfastPlayers()
    @EnvironmentObject var match:Match
    var body: some View {
        
        VStack {

            //Event grouping
            Form {
                Group{
                TextField("Event: ", text: $match.eventName)
                    .padding()
//                    .background(Color.cyan)
                    .foregroundColor(.black)
                DatePicker("Date:", selection: $match.eventDate, displayedComponents: .date)
                    .padding()
                }
                .frame(height: 50.0)
            }
            .frame(height: 200,alignment: .top)

            
            VStack {
                ForEach(0..<match.noPairs,id:\.self) { i in
                    NamesRowView(rowNo: i)
                }
            }
            .padding(.leading, 100.0)
        }
        .environmentObject(belfastPlayers)
        .padding()
    }
}

struct NamesView_Previews: PreviewProvider {
    static var previews: some View {
        NamesView().environmentObject(Match())
            .previewInterfaceOrientation(.portraitUpsideDown)
    }
}
