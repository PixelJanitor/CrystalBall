//
//  CrystalBall.swift
//  CrystalBall
//
//  Created by Nick Kohrn on 7/19/14.
//  Copyright (c) 2014 Nick Kohrn. All rights reserved.
//

import Foundation
import UIKit

class CrystalBall: UIViewController, UITextFieldDelegate {

    @IBOutlet var newAnswerTextField : UITextField
    @IBOutlet var alertButton : UIButton
    @IBOutlet var answerLabel : UILabel
    var answers = ["Yes", "No", "Maybe"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var buttonTap = UITapGestureRecognizer(target: self, action: "showAlert")
        self.alertButton.addGestureRecognizer(buttonTap)
        newAnswerTextField.delegate = self
    }
    
    override func canBecomeFirstResponder() -> Bool {
        return true
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent!) {
        if (motion == UIEventSubtype.MotionShake){
            updateAnswer()
        }
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        var newAnswer = textField.text
        answers.append(newAnswer)
        textField.text = nil
        textField.resignFirstResponder()
        return false
    }
    
    func randomAnswer() -> String {
        var randomAnswerIndex = arc4random_uniform(UInt32(answers.count))
        return answers[Int(randomAnswerIndex)]
    }
    
    func updateAnswer() {
        answerLabel.text = randomAnswer()
    }
    
    func showAlert() {
        var alert = UIAlertController(title: "The answer is", message: randomAnswer(), preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Close", style: UIAlertActionStyle.Default, handler: nil))
        presentViewController(alert, animated: true, completion: nil)
    }
    
}