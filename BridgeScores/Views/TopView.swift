//
//  TopView.swift
//  BridgeScores
//
//  Created by Chris Percival on 5/6/22.
//

import SwiftUI

//let MovementPicker = Picker("Movement")


struct TopView: View {
    @State var isSelected = false
    //Select debug movemen
    @State var movementIndex = 3
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
                        DatePicker("Date:", selection: $event.eventDate, displayedComponents: .date)
                        //Movement Picker
                        Picker("Movements",selection: $movementIndex){
                            ForEach(0..<event.Movements.count,id:\.self){ i in
                                Text(event.Movements[i].name)
                            }
                        }.onAppear(){
                            event.eventMovementName = event.Movements[movementIndex].name
                        }
                        .onChange(of: movementIndex) { newValue in
                            event.eventMovementName = event.Movements[newValue].name
                            event.noPairs = event.Movements[newValue].noPairs
//                            print(event.Movements[newValue].name)
                        }
                        Text("Select Players and Play")
                            .font(.title)
                            .onTapGesture {
                            isSelected = true
                        }
                    }
                    .padding()
                    
                }
                .frame(width:800,height:400)
                .border(.cyan, width: 4)
            }
            .environmentObject(event)
            
        }
    }
}

struct TopView_Previews: PreviewProvider {
    static var previews: some View {
        TopView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
