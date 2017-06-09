//
//  RegisterViewController.swift
//  WorkoutApp
//
//  Created by Rana on 6/8/17.
//  Copyright © 2017 Rana. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet var healthTextView: UITextView!
    @IBOutlet var commentsTextView: UITextView!
    
//    @IBOutlet var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround() 
        healthTextView.layer.cornerRadius = 5
        commentsTextView.layer.cornerRadius = 5
        healthTextView.clipsToBounds = true
        commentsTextView.clipsToBounds = true
       
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name:  Notification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: Notification.Name.UIKeyboardWillHide, object: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func motionBegan(_ motion: UIEventSubtype, with event: UIEvent?) {
        print("Device was shaken!")
        let storyBoard : UIStoryboard = UIStoryboard(name:"Programs", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "BarcodeViewController") as! BarcodeViewController
        self.present(nextViewController, animated:true, completion:nil)
    }

    
    func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0{
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y != 0{
                self.view.frame.origin.y = 0
            }
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
