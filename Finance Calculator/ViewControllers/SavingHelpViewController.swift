//
//  SavingHelpViewController.swift
//  Finance Calculator
//
//  Created by ABC on 12/6/20.
//

import UIKit

class SavingHelpViewController: UIViewController {

    // outlets
    @IBOutlet weak var helpTitle: UILabel!
    @IBOutlet weak var desc: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    // custom methods
    func setUpUI()
    {
        self.view.backgroundColor = UIColor.backgroundColor()
        self.helpTitle.text = NSLocalizedString("Help", comment: "")
        self.desc.text = NSLocalizedString("savingsHelp", comment: "")
    }
}
