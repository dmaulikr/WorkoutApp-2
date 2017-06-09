//
//  ProfileViewController.swift
//  WorkoutApp
//
//  Created by Rana on 6/8/17.
//  Copyright © 2017 Rana. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var myProgramBtn: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()

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
        
        let storyBoard : UIStoryboard = UIStoryboard(name:"Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "BarcodeViewController") as! BarcodeViewController
        self.present(nextViewController, animated:true, completion:nil)
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
