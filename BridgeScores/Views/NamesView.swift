//
//  NamesView.swift
//  BridgeScores
//
//  Created by Chris Percival on 4/22/22.
//

import SwiftUI


struct NamesView: View {
//    @State var belfastPlayers = BelfastPlayers()
    @EnvironmentObject var event:Event
    @EnvironmentObject var matchPlayers:MatchPlayers

    var body: some View {
        VStack(alignment:.leading) {
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .fill(.cyan)
                    .opacity(0.4)
                    .frame(height: 40)
                    .shadow(radius: 15.0,x:-5,y:10)
                HStack(alignment: .center){
                    Text("PairNo").frame(width:80)
                    
                    Text("Player One")
                    Spacer()
                    Text("Player Two")
                    Spacer()
                }
            }.frame(width: 800)
            //Name picker
            VStack {
                ForEach(0..<event.noPairs,id:\.self) { i in
                    NamesRowView(rowNo: i)//.frame(width: 800, height: 48, alignment: .topLeading).tag(i+1)
                }
            }
//            .background(Color.cyan)
//            .opacity(0.2)
            .padding()
            .frame(width:800)
            .border(.cyan, width: /*@START_MENU_TOKEN@*/4/*@END_MENU_TOKEN@*/)
        }
//        .environmentObject(belfastPlayers)
    }
}

struct NamesView_Previews: PreviewProvider {
    static var previews: some View {
        NamesView()
            .environmentObject(Event())
            .previewInterfaceOrientation(.landscapeRight)
    }
}
