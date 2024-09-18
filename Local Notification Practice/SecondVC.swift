//
//  SecondVC.swift
//  Local Notification Practice
//
//  Created by Rahul Sharma on 17/09/24.
//

import UIKit

class SecondVC: UIViewController {

    @IBOutlet weak var lblSecVC: UILabel!
    var strTxt = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lblSecVC.text = strTxt
    }

}
