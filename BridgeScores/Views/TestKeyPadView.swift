//
//  TestKeyPadView.swift
//  BridgeScores
//
//  Created by Chris Percival on 12/9/22.
//

import SwiftUI


struct TestKeyPadView: View {
    @State private var showKeypad = true
    @State private var keyPadString = ""
    
    func numbersOnly(input: String) -> String{
        var output = ""
        for c in input {
            if
                c != "0" &&
                    c != "1" &&
                    c != "2" &&
                    c != "3" &&
                    c != "4" &&
                    c != "5" &&
                    c != "6" &&
                    c != "7" &&
                    c != "8" &&
                    c != "9"
                {
                print(c)
            }
            else {
                output.append(c)
            }
        }
        return output
    }
    
    var body: some View {
        VStack{
            KeyPadView(isShown: $showKeypad, actionString: $keyPadString)
            TextField("1234567890", text: $keyPadString)
                .onChange(of: self.keyPadString, perform: { newValue in
                    print(newValue)
                    keyPadString = numbersOnly(input: newValue)
                })
                .onSubmit {
                    print(keyPadString)
                }
        }
    }
}

struct TestKeyPadView_Previews: PreviewProvider {
    static var previews: some View {
        TestKeyPadView()
    }
}
