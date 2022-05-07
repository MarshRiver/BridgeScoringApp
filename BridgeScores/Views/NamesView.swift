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
        HStack(alignment: .center) {
            Text(String(rowNo + 1))
                .frame(width:30)
            Picker("First Name", selection: $playerIndex, content: {
                ForEach(0..<belfastPlayers.players.count,id:\.self)
                    { i in
                    Text(belfastPlayers.players[i].firstName + " " +
                         belfastPlayers.players[i].lastName)
                }
            })
            Picker("Last Name", selection: $playerIndex1, content: {
                ForEach(0..<belfastPlayers.players.count,id:\.self)
                    { i in
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
    @EnvironmentObject var event:Event

    var body: some View {
        
        VStack(alignment:.leading) {

            //Event grouping
            Form {
                Group{
                TextField("Event: ", text: $event.eventName)
                    .padding()
//                    .background(Color.cyan)
                    .foregroundColor(.black)
                DatePicker("Date:", selection: $event.eventDate, displayedComponents: .date)
                    .padding()
                }
                .frame(height: 50.0)
            }
            .frame(height: 200,alignment: .top)

            
            VStack {
                ForEach(0..<event.noPairs,id:\.self) { i in
                    NamesRowView(rowNo: i)
                }
            }
//            .padding(.leading, 100.0)
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
