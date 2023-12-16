//
//  AmortizedDataController.swift
//  Finance Calculator
//
//  Created by ABC on 12/7/20.
//

import UIKit

class AmortizedDataController: UITableViewController {

    //variables
    var data = [AmortizedData]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        prepareDummyData()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 13
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DataIdentifier", for: indexPath) as! AmortizedDataView
        
        if(indexPath.row == 0)
        {
            cell.no.text = NSLocalizedString("no", comment: "")
            cell.year.text = NSLocalizedString("year", comment: "")
            cell.futureVal.text = NSLocalizedString("futureValue", comment: "")
            cell.interest.text = NSLocalizedString("interest", comment: "")
            cell.effectiveRate.text = NSLocalizedString("effectiveRate", comment: "")
            
            cell.backgroundColor = UIColor.lightGray
        }
        else
        {
            let index = indexPath.row - 1
            cell.no.text = data[index].no
            cell.year.text = data[index].year
            cell.futureVal.text = data[index].futureVal
            cell.interest.text = data[index].interest
            cell.effectiveRate.text = data[index].effectiveRate
        }

        return cell
    }
    
    // custom methods
     func setUpUI()
     {
         self.view.backgroundColor = UIColor.backgroundColor()
         self.tableView.contentInset = UIEdgeInsets(top: 20,left: 20, bottom: 20,right: 20)
         self.tableView.allowsSelection = false


         //remove extra empty lines
         tableView.tableFooterView = UIView()

     }
    
    // please ignore the dummy data
    func prepareDummyData()
    {
        for i in 1...12 {
            data.append(AmortizedData(no: String(i), year: "1", futureVal: "1000.00", effectiveRate: "10.45%", interest: "10.34%"))
        }
    }

}

