//
//  MailView.swift
//  BridgeScores
//
//  Created by Chris Percival on 12/15/22.
//

import SwiftUI
import MessageUI
import UIKit


struct MailView: View {
    @State private var isShowing = true
    
    var body: some View {
        VStack{
            
        }.sheet(isPresented: $isShowing) {            
            emailResults()
        }
     }
}

struct MailView_Previews: PreviewProvider {
    static var previews: some View {
        MailView()
    }
}
