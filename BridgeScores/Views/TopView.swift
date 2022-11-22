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
            
            ContentView()
                .environmentObject(event)
        }
        else {
            VStack(alignment: .center) {
                Form {
                    Group{
                        TextField("Event: ", text: $event.eventName)
                            .padding()
                            .foregroundColor(.black)
                        DatePicker("Date:", selection: $event.eventDate, displayedComponents: .date)
                            .padding()
                    }
                    Picker("Number of Pairs:",selection: $event.noPairs){
                        ForEach(6...8,id:\.self){i in
                            Text(String(i))
                        }
                    }.padding()
                    
                    Text("Select Players").onTapGesture {
                        isSelected = true
                    }.padding()
                }
                .frame(width:400)
            }
            .environmentObject(event)
            
        }
    }
}
struct TopView_Previews: PreviewProvider {
    static var previews: some View {
        TopView()
            .previewInterfaceOrientation(.portraitUpsideDown)
    }
}
