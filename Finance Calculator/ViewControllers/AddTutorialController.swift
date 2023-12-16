//
//  SavingsViewController.swift
//  Finance Calculator
//
//  Created by ABC on 12/4/20.
//

import UIKit
import Foundation
import CoreData

class AddTutorialController: UIViewController {

    
    @IBOutlet weak var year: UITextField!
    @IBOutlet weak var marks: UITextField!
    @IBOutlet weak var duration: UITextField!
    @IBOutlet weak var paper: UITextField!
    
    var context: NSManagedObjectContext? {
        guard let appDelegate =
        UIApplication.shared.delegate as? AppDelegate else {
            return nil
        }
        return appDelegate.persistentContainer.viewContext
    }
    
    @IBAction func onAddPaper(_ sender: Any) {
        guard let year = year.text,
                      let marks = marks.text,
                      let duration = duration.text,
                      let paper = paper.text else {
                    return
                }
        savePaper(_year: year, _marks: marks, _date: dateToString(date: Date()), _duration: duration, _url: "https://www.google.com", _paper: paper)
        displaySuccessAlert()
    }
    
    func dateToString(date: Date, format: String = "yyyy-MM-dd") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: date)
    }
    
    
    func displaySuccessAlert()
    {
         let alert = UIAlertController(title: "Successfull", message: "Paper Added Successfully", preferredStyle: .alert)
         alert.addAction(UIAlertAction(title: "OK", style: .default))
         self.present(alert, animated: true, completion: nil)
        clearSavings()
    }
    
    func clearSavings()
    {
        clearEachValue(field: year)
        clearEachValue(field: marks)
        clearEachValue(field: duration)
        clearEachValue(field: paper)
        
    }
    
    func clearEachValue(field: UITextField)
    {
        field.text=""
        field.clear()
    }
    
    func savePaper(_year: String, _marks: String, _date: String, _duration: String, _url: String, _paper: String) {
        
        guard let context = context else {
                    return
                }
                
        if let pastPaperEntity = NSEntityDescription.entity(forEntityName: "PastPaperData", in: context) {
            let pastPaper = NSManagedObject(entity: pastPaperEntity, insertInto: context)
            pastPaper.setValue(_year, forKey: "year")
            pastPaper.setValue(_marks, forKey: "marks")
            pastPaper.setValue(_date, forKey: "date")
            pastPaper.setValue(_duration, forKey: "duration")
            pastPaper.setValue(_url, forKey: "url")
            pastPaper.setValue(_paper, forKey: "paper")
            pastPaper.setValue("TUTORIAL", forKey: "category")
            
            do {
                try context.save()
            } catch let error as NSError {
                print("Could not save. \(error), \(error.userInfo)")
            }
        }
    }
}
