//
//  ContentView.swift
//  BridgeScores
//
//  Created by Chris Percival on 4/16/22.
//

import SwiftUI

struct TextBox: View{
    var s:String
    var body: some View{
        Text(s)
            .bold()
            .frame(width:50)
    }
}

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

    var match:Match{
        Match(event:event)
    }

    var results:Results{
       Results(event: event)

    }    
    var matchPlayers:MatchPlayers{
        MatchPlayers(event: event)
    }
    var entryNames: EntryNames
    {
        EntryNames(event: event)
    }


    var body: some View {
        TabView {
            NamesView()
                .tabItem {Label("Players",systemImage: "star.fill")}
            MatchView()
                .tabItem {Label("Boards",systemImage:"star.fill")}
            ResultsView()
                .tabItem {Label("Results",systemImage:"star.fill")}
            MailView()
                .tabItem {Label("Mail",systemImage:"star.fill")}
//            TestKeyPadView()
//                .tabItem {Label("Test",systemImage:"star.fill")}
        }
        .environmentObject(match)
        .environmentObject(matchPointRow)
        .environmentObject(results)
        .environmentObject(matchPlayers)
        .environmentObject(entryNames)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Event())
            .previewInterfaceOrientation(.landscapeRight)
    }
}
