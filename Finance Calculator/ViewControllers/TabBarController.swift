//
//  TabBarController.swift
//  Finance Calculator
//
//  Created by ABC on 12/4/20.
//
import UIKit

class TabBarController: UITabBarController {

    //variables
    // set in MainViewControllers on click of collection item
    var selectedPassedIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setUpUI()
    }
    
    // custom methods
    
    func setUpUI()
    {
     
        // set navigation bar image
        self.navigationController!.navigationBar.setBackgroundImage(UIImage(named: "HeaderBg.png")!.resizableImage(withCapInsets: UIEdgeInsets(top: 0, left: 0, bottom: 0 ,right: 0), resizingMode: .stretch), for: .default)
        self.navigationController?.isNavigationBarHidden = false

        // background color
        self.view.backgroundColor = UIColor.backgroundColor()

        // set tab bar items programatically
        let pastPapersItem = UITabBarItem(title: NSLocalizedString("Past Papers", comment: ""), image: UIImage(named: "MortgageLine.png"), selectedImage: UIImage(named: "MortgageFill.png"))
        let schoolPapersItem = UITabBarItem(title: NSLocalizedString("School Papers", comment: ""),image: UIImage(named: "SavingsLine.png"), selectedImage: UIImage(named: "SavingsFill.png"))
        let tutorialItem = UITabBarItem(title: NSLocalizedString("Tutorials", comment: ""),image: UIImage(named: "LoansLine.png"), selectedImage: UIImage(named: "LoansFill.png"))
        let profileItem = UITabBarItem(title: NSLocalizedString("Profile", comment: ""),image: UIImage(named: "LoansLine.png"), selectedImage: UIImage(named: "LoansFill.png"))
        
        // view controllers are embedded in a parent which has a scrollview - ScrollViewController
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let updatePastPapersVC = storyboard.instantiateViewController(withIdentifier: "scrollVC")
        let updateSchoolPapersVC = storyboard.instantiateViewController(withIdentifier: "scrollVC")
        let updateTutorialsVC = storyboard.instantiateViewController(withIdentifier: "scrollVC")
        let updateProfileVC = storyboard.instantiateViewController(withIdentifier: "scrollVC")
    
        updatePastPapersVC.tabBarItem = pastPapersItem
        updateSchoolPapersVC.tabBarItem = schoolPapersItem
        updateTutorialsVC.tabBarItem = tutorialItem
        updateProfileVC.tabBarItem = profileItem
        
        // pass the index to ScrollViewController in order to load the child controller view, in container
        (updatePastPapersVC as! ScrollViewController).selectedTabIndex = 0
        (updateSchoolPapersVC as! ScrollViewController).selectedTabIndex = 1
        (updateTutorialsVC as! ScrollViewController).selectedTabIndex = 2
        (updateProfileVC as! ScrollViewController).selectedTabIndex = 3

        // programatically setting view controllers in tab bar
        let tabControllers = [updatePastPapersVC,updateSchoolPapersVC,updateTutorialsVC,updateProfileVC]
        self.viewControllers = tabControllers
        self.selectedIndex = selectedPassedIndex
    }
}
