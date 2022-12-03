//
//  NamesView.swift
//  BridgeScores
//
//  Created by Chris Percival on 4/22/22.
//

import SwiftUI


struct NamesView: View {

    @EnvironmentObject var event:Event

    var body: some View {
            VStack {
                //Legend
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
                }

                //Name pickers
                ForEach(0..<event.noPairs,id:\.self) { i in
                    NamesRowView(rowNo: i)
                }
            }
            .padding()
            .frame(width:800)
            .border(.cyan, width: /*@START_MENU_TOKEN@*/4/*@END_MENU_TOKEN@*/)
    }
}

struct NamesView_Previews: PreviewProvider {
    static var previews: some View {
        NamesView()
            .environmentObject(Event())
            .previewInterfaceOrientation(.landscapeRight)
    }
}
