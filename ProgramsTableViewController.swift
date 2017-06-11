//
//  ProgramsTableViewController.swift
//  WorkoutApp
//
//  Created by Nesreen Mamdouh on 6/7/17.
//  Copyright © 2017 Rana. All rights reserved.
//

import UIKit

class ProgramsTableViewController: UITableViewController {

    @IBOutlet var registerBtn: [UIButton]!
   
    @IBOutlet var tableViewPrograms: UITableView!
    
//    var headerLogo = UIImageView()
//    var headerLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         self.navigationController?.isNavigationBarHidden = true
        for btn in registerBtn {
            btn.layer.cornerRadius = 10
            btn.clipsToBounds = true
        }

//        tableViewPrograms.estimatedSectionHeaderHeight = 148
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
         self.navigationController?.isNavigationBarHidden = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    override func motionBegan(_ motion: UIEventSubtype, with event: UIEvent?) {
        print("Device was shaken!")
        
        let storyBoard : UIStoryboard = UIStoryboard(name:"Programs", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "BarcodeViewController") as! BarcodeViewController
        self.present(nextViewController, animated:true, completion:nil)
    }
//    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let v = UIView()
//        v.backgroundColor = UIColor.gray
////        headerLabel.textColor = UIColor(red: 251, green: 208, blue: 82, alpha: 0.5)
////        headerLabel.text = "Programs"
////        v.addSubview(headerLabel)
//        headerLogo.image = #imageLiteral(resourceName: "programs yellow")
//        headerLogo.frame.size.height = 64
//        headerLogo.frame.size.width = 80
//        v.addSubview(headerLogo)
//        return v
//    }
}
