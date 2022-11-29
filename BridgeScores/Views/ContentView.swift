//
//  ContentView.swift
//  BridgeScores
//
//  Created by Chris Percival on 4/16/22.
//

import SwiftUI

struct LegendRowView:View{
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(.cyan)
                .opacity(0.3)
                .frame(width: 800,height: 40)
                .shadow(radius: 15.0,x:-5,y:10)
            HStack{
                TextBox(s: "MP")
                    .frame(width:80)
                TextBox(s: "NS")
                    .frame(width:80)
                TextBox(s: "Bid")
                    .frame(width:80)
                TextBox(s: "Made")
                    .frame(width:80)
                TextBox(s: "Down")
                    .frame(width:80)
                TextBox(s: "NSScore")
                    .frame(width:80)
                TextBox(s: "EWScore")
                    .frame(width:80)
                TextBox(s: "EW")
                    .frame(width:50)
                TextBox(s: "MP")
            }
//            .background(.cyan)
        .padding()
        }.frame(width:800)
    }
}

struct ContentView: View {
    @StateObject var match = Match(event: Event())
    @StateObject var matchPointRow = MatchPointRow()
    @StateObject var belfastPlayers = BelfastPlayers()
//    @StateObject var results = Results(noPairs:event.noPairs)
    @EnvironmentObject var event: Event
    var results:Results{
        Results(noPairs: event.noPairs)

    }
//    @StateObject var matchPlayers = MatchPlayers()
    var matchPlayers:MatchPlayers{
        MatchPlayers(noPairs:event.noPairs)
    }
    
    var body: some View {
        TabView {
            NamesView().tabItem {
                Label("Players",systemImage: "star.fill")
            }
            
            if match.isLoaded{
            
                VStack{
                    LegendRowView()
                    MatchView()
                }
                .tabItem{Label("Boards",systemImage:"star.fill")}
            }
            ResultsView()
                .tabItem{Label("Results",systemImage:"star.fill")}
        }
        .environmentObject(match)
        .environmentObject(matchPointRow)
        .environmentObject(results)
        .environmentObject(matchPlayers)
        .environmentObject(belfastPlayers)
        .onAppear(){
//            print(event.eventMovementName)
            match.getLocalData(fileName: event.eventMovementName)
//            $match.noPairs = event.noPairs
//            results = Results(noPairs: event.noPairs)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(Event())
            .previewInterfaceOrientation(.portrait)
    }
}
