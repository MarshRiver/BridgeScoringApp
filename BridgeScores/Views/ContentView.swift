//
//  ContentView.swift
//  BridgeScores
//
//  Created by Chris Percival on 4/16/22.
//

import SwiftUI

struct LegendRowView:View{
    var body: some View {
        
        HStack{
            TextBox(s: "NSPair")
            TextBox(s: "Bid")
            TextBox(s: "Made")
            TextBox(s: "Down")
            TextBox(s: "NSScore")
            TextBox(s: "EWScore")
            TextBox(s: "NSMP")
            TextBox(s: "EWMP")
            TextBox(s: "EWPair")
        }
        .background(.cyan)
        .padding()
    }
}

struct ContentView: View {
    @StateObject var match = Match()

    @State var resultString = ""
    var body: some View {
        VStack{
            LegendRowView()
            ScrollView {
                BoardView(boardNo: 0)
                BoardView(boardNo: 1)
           }
        }
        .environmentObject(match)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
