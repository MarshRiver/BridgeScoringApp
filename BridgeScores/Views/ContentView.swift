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
    @EnvironmentObject var event: Event
    @StateObject var matchPointRow = MatchPointRow()

//    @StateObject var match = Match(event: Event())
    var match:Match{
        Match(event:event)
    }
//    @StateObject var matchPlayers = MatchPlayers(event : Event())
//    @StateObject var matchPlayers = MatchPlayers()
 //Need to use computed variable
//    @StateObject var results = Results(event:Event())
   var results:Results{
       Results(event: event)

    }    
    //Need to use computed variable
    var matchPlayers:MatchPlayers{
        MatchPlayers(event: event)
    }
    

    var body: some View {
        TabView {
            NamesView().tabItem {
                Label("Players",systemImage: "star.fill")
            }
            MatchView()
                .tabItem{Label("Boards",systemImage:"star.fill")}
            ResultsView()
                .tabItem{Label("Results",systemImage:"star.fill")}
        }
        .environmentObject(match)
        .environmentObject(matchPointRow)
        .environmentObject(results)
        .environmentObject(matchPlayers)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Event())
            .previewInterfaceOrientation(.landscapeRight)
    }
}
