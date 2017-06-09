//
//  BarcodeViewController.swift
//  WorkoutApp
//
//  Created by Nesreen Mamdouh on 6/8/17.
//  Copyright © 2017 Rana. All rights reserved.
//

import UIKit

class BarcodeViewController: UIViewController {

    @IBOutlet var BarcodeImageView: UIImageView!
    var previousViewName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let image = generateBarcode(from: "NesreenM")
        BarcodeImageView.image = image
        self.hideKeyboardWhenTappedAround()
       

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func BackToPreviousView(_ sender: Any) {
        
//        let storyBoard : UIStoryboard = UIStoryboard(name:"Programs", bundle:nil)
//        let nextViewController = storyBoard.instantiateViewController(withIdentifier: previousViewName) as! BarcodeViewController
//        self.present(nextViewController, animated:true, completion:nil)
        self.dismiss(animated: true, completion: nil)
        
    }
    func generateBarcode(from string: String) -> UIImage? {
        let data = string.data(using: String.Encoding.ascii)
        
        if let filter = CIFilter(name: "CIQRCodeGenerator") {
            filter.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 1, y: 1)
            
            if let output = filter.outputImage?.applying(transform) {
                return UIImage(ciImage: output)
            }
        }
        
        return nil
    }


}
