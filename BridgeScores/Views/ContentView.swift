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
                .frame(height: 40)
                .shadow(radius: 15.0,x:-5,y:10)
            HStack{
                TextBox(s: "MP")
                    .frame(width:50)
                TextBox(s: "NS")
                    .frame(width:100)
                TextBox(s: "Bid")
                    .frame(width:100)
                TextBox(s: "Made")
                    .frame(width:100)
                TextBox(s: "Down")
                    .frame(width:100)
                TextBox(s: "NSScore")
                    .frame(width:100)
                TextBox(s: "EWScore")
                    .frame(width:100)
                TextBox(s: "EW")
                    .frame(width:50)
                TextBox(s: "MP")
            }
            .background(.cyan)
        .padding()
        }
    }
}

struct ContentView: View {
    @StateObject var match = Match()
    @StateObject var matchPointRow = MatchPointRow()
    @StateObject var matchPlayers = MatchPlayers()
    @StateObject var belfastPlayers = BelfastPlayers()
    @StateObject var results = Results()
    @EnvironmentObject var event: Event
//    var results:Results{
//        Results(noPairs: event.noPairs)
//
//    }
    var body: some View {
        TabView {
            NamesView().tabItem {
                Label("Players",systemImage: "star.fill")
            }
            
            if match.isLoaded{
            
                VStack{
                    LegendRowView()
                    ScrollView {
                        ForEach(match.Boards,id:\.boardNo){ board in
                            if board.boardNo < match.Boards.count{
                                BoardView(boardNo: board.boardNo).padding()
                            }
                            
                        }
                    }
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
            match.noPairs = event.noPairs
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
