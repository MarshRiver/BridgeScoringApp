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

    @State var resultString = ""
    var body: some View {
        VStack{
            LegendRowView()
            ScrollView {
                BoardView(boardNo: 0).padding()
                BoardView(boardNo: 1).padding()
                BoardView(boardNo: 2).padding()
                BoardView(boardNo: 3).padding()
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
