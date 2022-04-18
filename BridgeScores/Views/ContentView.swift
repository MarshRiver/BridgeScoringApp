//
//  ContentView.swift
//  BridgeScores
//
//  Created by Chris Percival on 4/16/22.
//

import SwiftUI

struct CaptionRowView:View{
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
            CaptionRowView()
            ScrollView {
                BoardView()
                HStack {
                    Text("Table 1").font(.title)
                    Button("NS Rank: ",action: {
                        resultString = match.Boards[0].sortBoard()
                    })
                    .foregroundColor(.black)

                    Text(resultString)
                        .foregroundColor(.black)
                        .padding()
//                        .frame(width:80)
//                        .border(.black, width: 2)
                }
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
