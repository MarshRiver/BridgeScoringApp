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

//        if MFMailComposeViewController.canSendMail() {

//        if let filePath = Bundle.main.path(forResource: "sampleData", ofType: "json") {
//           if let data = NSData(contentsOfFile: filePath) {
//              mail.addAttachmentData(data as Data, mimeType: "application/json" , fileName: "sampleData.json")
//           }
//        }


//        emailer.addAttachmentData(<#T##attachment: Data##Data#>, mimeType: "text", mimeType: , fileName: "Results.csv")


struct emailResults:UIViewControllerRepresentable{
    var delegate:MFMailComposeViewControllerDelegate
    
    func makeUIViewController(context: Context) -> MFMailComposeViewController {
        
        let emailer = MFMailComposeViewController()
        emailer.setToRecipients(["percivalcj@gmail.com"])
//        emailer.setCcRecipients()
        emailer.setSubject("Results")
        emailer.mailComposeDelegate = delegate
        
        return emailer
    }

    
    func updateUIViewController(_ uiViewController: MFMailComposeViewController, context: Context) {
    }
    
    func canSendEmail() -> Bool{
        return MFMailComposeViewController.canSendMail()
    }
}


//https://stackoverflow.com/questions/56784722/swiftui-send-email

struct MailView2: UIViewControllerRepresentable {
    
    var data:Data
    
    @Environment(\.presentationMode) var presentation
    @Binding var result: Result<MFMailComposeResult, Error>?

    class Coordinator: NSObject, MFMailComposeViewControllerDelegate {

        @Binding var presentation: PresentationMode
        @Binding var result: Result<MFMailComposeResult, Error>?

        init(presentation: Binding<PresentationMode>,
             result: Binding<Result<MFMailComposeResult, Error>?>) {
            _presentation = presentation
            _result = result
        }

        func mailComposeController(_ controller: MFMailComposeViewController,
                                   didFinishWith result: MFMailComposeResult,
                                   error: Error?) {
            defer {
                $presentation.wrappedValue.dismiss()
            }
            guard error == nil else {
                self.result = .failure(error!)
                return
            }
            self.result = .success(result)
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(presentation: presentation,
                           result: $result)
    }

    func updateUIViewController(_ uiViewController: MFMailComposeViewController,
                                context: UIViewControllerRepresentableContext<MailView2>) {

    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<MailView2>) -> MFMailComposeViewController {
        let vc = MFMailComposeViewController()
        vc.mailComposeDelegate = context.coordinator
        vc.setSubject("Match Results")
        vc.setToRecipients(["percivalcj@gmail.com"])
        vc.setCcRecipients(["percivalcj@gmail.com"])
        
        vc.addAttachmentData(data, mimeType: "text", fileName: "Results.csv")
        return vc
    }

}
