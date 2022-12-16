//
//  Email.swift
//  BridgeScores
//
//  Created by Chris Percival on 12/14/22.
//

import Foundation
import SwiftUI
import UIKit
import MessageUI

class ViewController: UIViewController, MFMailComposeViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //@IBAction 
    func sendEmail(_ sender: Any) {
        if MFMailComposeViewController.canSendMail() {
            let mailComposer = MFMailComposeViewController()
            mailComposer.setToRecipients(["percivalcj@gmail.com"])
            mailComposer.setSubject("Update about ios tutorials")
            mailComposer.setMessageBody("What is the update about ios tutorials on youtube", isHTML: false)
            mailComposer.mailComposeDelegate = self
           self.present(mailComposer, animated: true
                    , completion: nil)
        } else {
            print("Email is not configured in settings app or we are not able to send an email")
        }
    }
    
    //MARK:- MailcomposerDelegate
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        switch result {
        case .cancelled:
            print("User cancelled")
            break

        case .saved:
            print("Mail is saved by user")
            break

        case .sent:
            print("Mail is sent successfully")
            break

        case .failed:
            print("Sending mail is failed")
            break
        default:
            break
        }

        controller.dismiss(animated: true)

    }

}


struct emailResults:UIViewControllerRepresentable{
    
    func makeUIViewController(context: Context) -> MFMailComposeViewController {
        
//        if MFMailComposeViewController.canSendMail() {
        let emailer = MFMailComposeViewController()
        emailer.setToRecipients(["dr.deb.walters@gmail.com"])
        emailer.setCcRecipients(["percivalcj@gmail.com"])
        emailer.setSubject("Results")
        
//        if let filePath = Bundle.main.path(forResource: "sampleData", ofType: "json") {
//           if let data = NSData(contentsOfFile: filePath) {
//              mail.addAttachmentData(data as Data, mimeType: "application/json" , fileName: "sampleData.json")
//           }
//        }


//        emailer.addAttachmentData(<#T##attachment: Data##Data#>, mimeType: "text", mimeType: , fileName: "Results.csv")
        return emailer
//        }
    }

    
    func updateUIViewController(_ uiViewController: MFMailComposeViewController, context: Context) {
    }
    
}
