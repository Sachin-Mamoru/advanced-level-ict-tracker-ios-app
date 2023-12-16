

import UIKit

class ProfileHelpViewController: UIViewController {

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
        self.helpTitle.text = NSLocalizedString("profile", comment: "")
        self.desc.text = NSLocalizedString("profileHelp", comment: "")
    }
}
