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
    @State var movementIndex = 0
    @StateObject var event = Event()
    
    var body: some View {
        if isSelected {
            
            ContentView()
                .environmentObject(event)
        }
        else {
            VStack(alignment: .center) {
                Form {
                    Section{
                        TextField("Event: ", text: $event.eventName).padding()
                        DatePicker("Date:", selection: $event.eventDate, displayedComponents: .date)
                            .padding()
                //Movement Picker
                    Picker("Movements",selection: $movementIndex){
                        ForEach(0..<event.Movements.count,id:\.self){ i in
                            Text(event.Movements[i].name)
                        }
                    }.pickerStyle(WheelPickerStyle())
                    .padding()
                    .onAppear(){
                        event.eventMovementName = event.Movements[movementIndex].name
//                        print(event.eventMovementName + "  " + String(event.noPairs) + "  in topview.swift #1")
                    }
                    .onChange(of: movementIndex) { newValue in
                        event.eventMovementName = event.Movements[newValue].name
                        event.noPairs = event.Movements[newValue].noPairs
//                        print(event.eventMovementName + "  " + String(event.noPairs) + "  in topview.swift #2")
                    }
                        HStack{Spacer()
                            Button("Select Players"){
                                isSelected = true
                            }.padding().border(Color.cyan, width: 4)
                            Spacer()
                        }
                    }//end section
                    
                }//end form


            }
            .frame(width:800,height:600)
            .border(.cyan, width: 4)
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
