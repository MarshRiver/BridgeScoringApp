//
//  KeyPadView.swift
//  BridgeScores
//
//  Created by Chris Percival on 12/8/22.
//

import SwiftUI

struct KeyPadView: View {
    
    @Binding var isShown: Bool
    @Binding var actionString: String
    
    var body: some View {

        VStack(alignment: .leading){
            Text(actionString)
                .frame(width: 100, height: 30)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
            HStack{
                Button("1") {
                    actionString += "1"
                }
                .frame(width: 30.0, height: 30.0)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                Button("2") {
                    actionString += "2"
                }
                .frame(width: 30.0, height: 30.0)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                Button("3") {
                    actionString += "3"
                }
                .frame(width: 30.0, height: 30.0)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)

            }
            HStack{
                Button("4") {
                    actionString += "4"

                }
                .frame(width: 30.0, height: 30.0)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                Button("5") {
                    actionString += "5"

                }
                .frame(width: 30.0, height: 30.0)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                Button("6") {
                    actionString += "6"

                }
                .frame(width: 30.0, height: 30.0)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
            }
            HStack{
                Button("7") {
                    actionString += "7"

                }
                .frame(width: 30.0, height: 30.0)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                Button("8") {
                    actionString += "8"

                }
                .frame(width: 30.0, height: 30.0)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                Button("9") {
                    
                    actionString += "9"
                }
                .frame(width: 30.0, height: 30.0)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)

            }
            HStack{
                Button("*") {
                    actionString = ""
                }
                .frame(width: 30.0, height: 30.0)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)

                Button("0") {
                    actionString += "0"

                }
                .frame(width: 30.0, height: 30.0)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)

                Button("#") {
                    print(actionString)
                    actionString = "\r\n"
                }
                .frame(width: 30.0, height: 30.0)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)

            }
        }
        .frame(width: 150.0, height: /*@START_MENU_TOKEN@*/200.0/*@END_MENU_TOKEN@*/)
        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
    }
}

struct KeyPadView_Previews: PreviewProvider {
    static var previews: some View {
        KeyPadView(isShown: .constant(true), actionString: .constant("Hello World"))
    }
}
