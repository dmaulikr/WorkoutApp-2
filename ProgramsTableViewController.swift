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
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
         self.navigationController?.isNavigationBarHidden = true
        for btn in registerBtn {
            btn.layer.cornerRadius = 10
            btn.clipsToBounds = true
        }
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


}
