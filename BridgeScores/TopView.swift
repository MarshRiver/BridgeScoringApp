//
//  TopView.swift
//  BridgeScores
//
//  Created by Chris Percival on 5/6/22.
//

import SwiftUI

struct TopView: View {
    @State var noPairs = 6
    @State var isSelected = false
    var body: some View {
        if isSelected {ContentView(noPairs:noPairs)}
        else {
            NavigationView{
                Form {
                    Picker("Number of Pairs:",selection: $noPairs){
                        ForEach(6...8,id:\.self){i in
                            Text(String(i))
                        }
                    }
                    Text("Lets Play").onTapGesture {
                        isSelected = true
                    }
                }
                .frame( alignment: .top)
                .navigationTitle("Bridge Scoring")
            }
            
        }
    }
}
struct TopView_Previews: PreviewProvider {
    static var previews: some View {
        TopView()
    }
}
