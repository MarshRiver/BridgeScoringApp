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
//    @State private var isShowing = true
    @State var errorResult: Result<MFMailComposeResult, Error>? = nil
    @State var isShowingMailView = false
    @State var resultString = "Hello"
    let outputPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]

    
    var body: some View {
        let fileURL = URL(fileURLWithPath: "Results", relativeTo: outputPath).appendingPathExtension("csv")
        VStack{
            Button("Send email"){
                isShowingMailView = true
            }
            .disabled(!MFMailComposeViewController.canSendMail())
            //TODO: email should be initialized here with the attachment
            //TODO: use text view for error and results after dismissal
            if MFMailComposeViewController.canSendMail(){
                Text("Hello")
            } else {
                Text("Email not available, check settings to configure")
            }
        }
        .sheet(isPresented: $isShowingMailView, content: {
            emailer(data: NSData(contentsOf: fileURL)! as Data, result: self.$errorResult)
        })
        .onAppear(){
            print("File sent: \(fileURL.absoluteURL)")
        }
    }
}



struct MailView_Previews: PreviewProvider {
    static var previews: some View {
        MailView()
    }
}
