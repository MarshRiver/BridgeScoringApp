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
    
    var body: some View {
        VStack{
            KeyPadView(isShown: $showKeypad, actionString: $keyPadString)
            TextField("1234567890", text: $keyPadString)
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
