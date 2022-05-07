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
        if isSelected {ContentView()}
        else {
            NavigationView{
                VStack {
                    Picker("Number of Pairs:",selection: $noPairs){
                        ForEach(6...8,id:\.self){i in
                            Text(String(i))
                        }
                    }
                    Text("Lets Play").onTapGesture {
                        isSelected = true
                    }
                }
            }

        }
    }
}
struct TopView_Previews: PreviewProvider {
    static var previews: some View {
        TopView()
    }
}