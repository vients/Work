//
//  ViewController.swift
//  CallNumberApp
//
//  Created by Yurii Vients on 8/2/17.
//  Copyright © 2017 Yurii Vients. All rights reserved.
//

import UIKit
import MessageUI

class ViewController: UIViewController , MFMailComposeViewControllerDelegate{

   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

@IBAction func Call(_ sender: Any) {
    if let url = URL(string:"tel://1234567"), UIApplication.shared.canOpenURL(url) {
        UIApplication.shared.openURL(url)
    }
}
    @IBAction func SentMessage(_ sender: Any) {
        let mailCompose = MFMailComposeViewController()
        mailCompose.mailComposeDelegate = self
        mailCompose.setToRecipients(["yvients@gmail.com"])
        mailCompose.setSubject("Test")
        mailCompose.setMessageBody("Enter the text", isHTML: false)
        
        if MFMailComposeViewController.canSendMail()
        {
            self.present(mailCompose, animated: true, completion: nil)
        }
        else
        {
            print("Error !!!")
        }
        
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
}

