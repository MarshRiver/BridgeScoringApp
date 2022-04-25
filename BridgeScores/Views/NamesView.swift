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
    @EnvironmentObject var matchData: MatchData
//    @State var eventDate = Date()
//    @State var eventName = "Belfast"
    var body: some View {
        VStack {
            VStack {
                VStack {
                    Text("Event")
                        .bold()
                        .frame(alignment:.leading)
                        .padding(.top)
                    TextField("Event", text: $matchData.eventName)
                        .padding()
                        .background(Color.cyan)
                        .foregroundColor(.white)
                }
                .border(Color.black,width:2)
                HStack{
                    DatePicker("Date:", selection: $matchData.eventDate, displayedComponents: .date)
                        .frame(width: 300)
                        .padding()
                }
            }
            .border(Color.black,width: 2)
            //Player grouping
            VStack {
                HStack {
                    Text("Number of Pairs:")
                    Picker("Number of Pairs:",selection: $matchData.noPairs){
                        ForEach(1...12,id:\.self){i in
                            Text(String(i))
                        }
                    }
                }.padding()
                
                VStack(alignment:.leading) {
                    ForEach(0..<matchData.noPairs,id:\.self) { i in
                        NamesRowView(rowNo: i)
                    }
                }
                .environmentObject(belfastPlayers)
                .padding()
            }
            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 2)
        }
        
    }
}

struct NamesView_Previews: PreviewProvider {
    static var previews: some View {
        NamesView()
            .previewInterfaceOrientation(.portrait)
    }
}
