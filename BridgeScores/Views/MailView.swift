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
    @State var errorResult: Result<MFMailComposeResult, Error>? = nil
    @State var isShowingMailView = false
    let outputPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]

    
    var body: some View {
        let fileURL = URL(fileURLWithPath: "Results", relativeTo: outputPath).appendingPathExtension("csv")
        VStack{
            
            //TODO: email should be initialized here with the attachment
            if MFMailComposeViewController.canSendMail(){
                MailView2(data: NSData(contentsOf: fileURL)! as Data, result: self.$errorResult)
            } else{
                Text("Email not available")
            }
        }.onAppear(){
            print("File sent: \(fileURL.absoluteURL)")

        }
    }
}



struct MailView_Previews: PreviewProvider {
    static var previews: some View {
        MailView()
    }
}
