//
//  ProfileViewController.swift
//  WorkoutApp
//
//  Created by Rana on 6/8/17.
//  Copyright © 2017 Rana. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController ,UIImagePickerControllerDelegate , UINavigationControllerDelegate{

    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var myProgramBtn: UIButton!
    
    @IBOutlet var profileImage: UIImageView!
     let imagePicker = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        myProgramBtn.layer.cornerRadius = 7
        myProgramBtn.clipsToBounds = true
        
        // Do any additional setup after loading the view.
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
  
    @IBAction func addProfileImage(_ sender: Any) {
        
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            profileImage.contentMode = .scaleAspectFit
            profileImage.image = pickedImage
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }

}
