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
    @State var result: Result<MFMailComposeResult, Error>? = nil
    @State var isShowingMailView = false
    let outputPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]

    
    var body: some View {
        let fileURL = URL(fileURLWithPath: "Results", relativeTo: outputPath).appendingPathExtension("csv")
         Button(action: {
             self.isShowingMailView.toggle()
         }) {
             Text("Tap Me")
         }
         .disabled(!MFMailComposeViewController.canSendMail())
         .sheet(isPresented: $isShowingMailView) {
             MailView2(data: NSData(contentsOf: fileURL)! as Data, result: self.$result)
         }
     }

    
    //    var emailer = emailResults(delegate: self)
    
//    var body: some View {
//        VStack{
//            Spacer()
//
//            Text("File Emailer")
//            Spacer()
//
//            if emailer.canSendEmail(){
//                emailer
//
//            }
//            Text("Email not available")
//            Spacer()
//        }
//     }
}

struct MailView_Previews: PreviewProvider {
    static var previews: some View {
        MailView()
    }
}
