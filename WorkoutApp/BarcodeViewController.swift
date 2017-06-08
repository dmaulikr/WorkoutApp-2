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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let image = generateBarcode(from: "NesreenM")
        BarcodeImageView.image = image


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
