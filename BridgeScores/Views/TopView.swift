//
//  TopView.swift
//  BridgeScores
//
//  Created by Chris Percival on 5/6/22.
//

import SwiftUI

struct TopView: View {
    @State var isSelected = false
    @StateObject var event = Event()
    var body: some View {
        if isSelected {
            
            ContentView().environmentObject(event)
            
        }
        else {
            NavigationView{
                VStack(alignment: .center) {
                    Form {
                        Picker("Number of Pairs:",selection: $event.noPairs){
                            ForEach(6...8,id:\.self){i in
                                Text(String(i))
                            }
                        }
                        Text("Lets Play").onTapGesture {
                            isSelected = true
                        }
                    }
                    .frame( alignment: .top)
                    .frame(height: 100.0)
                    .navigationTitle("Bridge Scoring")
                
                NamesView().environmentObject(event)
                }
            }.environmentObject(event)
            
        }
    }
}
struct TopView_Previews: PreviewProvider {
    static var previews: some View {
        TopView()
    }
}
