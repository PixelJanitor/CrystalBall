//
//  CrystalBall.swift
//  CrystalBall
//
//  Created by Nick Kohrn on 7/19/14.
//  Copyright (c) 2014 Nick Kohrn. All rights reserved.
//

import Foundation
import UIKit

class CrystalBall: UIViewController, UIAlertViewDelegate {

    @IBOutlet var newAnswerTextField : UITextField
    @IBOutlet var alertButton : UIButton
    @IBOutlet var answerLabel : UILabel
    var answers = ["Yes", "No", "Maybe"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func canBecomeFirstResponder() -> Bool {
        return true
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent!) {
        if (motion == UIEventSubtype.MotionShake){
            updateAnswer()
        }
    }
    
    func alertView(alertView: UIAlertView!, didDismissWithButtonIndex buttonIndex: Int) {
        if (buttonIndex == 1) {
            var newAnswer = alertView.textFieldAtIndex(0).text
            answers.append(newAnswer)
        }
        
    }

    
    func randomAnswer() -> String {
        var randomAnswerIndex = arc4random_uniform(UInt32(answers.count))
        return answers[Int(randomAnswerIndex)]
    }
    
    func updateAnswer() {
        answerLabel.text = randomAnswer()
    }
    
    @IBAction func showAlert(sender: AnyObject) {
        var alert = UIAlertView(title: "Add Answer", message: "Add a New Answer", delegate: self, cancelButtonTitle: "Cancel", otherButtonTitles: "Add Answer")
        alert.alertViewStyle = UIAlertViewStyle.PlainTextInput
        alert.show()
    }
    
}