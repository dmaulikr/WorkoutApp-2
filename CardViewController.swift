//
//  CardViewController.swift
//  WorkoutApp
//
//  Created by Nesreen Mamdouh on 6/8/17.
//  Copyright © 2017 Rana. All rights reserved.
//

import UIKit

class CardViewController: UIViewController {

    @IBOutlet var tickImages: [UIImageView]!
    @IBOutlet var cardStackView: UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()
        cardStackView.layer.borderWidth = 5
//        image1.layer.borderWidth = 2
        for tickImage in tickImages {
            
            tickImage.layer.borderWidth = 2
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
