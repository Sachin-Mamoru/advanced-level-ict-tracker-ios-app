//
//  SchoolPaperViewController.swift
//  Finance Calculator
//
//  Created by Kirishikesan on 2023-08-23.
//

import UIKit
import CoreData


class SchoolPaperCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    var context: NSManagedObjectContext? {
        guard let appDelegate =
        UIApplication.shared.delegate as? AppDelegate else {
            return nil
        }
        return appDelegate.persistentContainer.viewContext
    }
//    let dataSource: [SchoolPaper] = [
//        SchoolPaper(year: "2021", marks: "78%", date: "2023-08-03", duration: "2 Hrs", url: "https://www.google.com"),
//        SchoolPaper(year: "2021", marks: "78%", date: "2023-08-03", duration: "2 Hrs", url: "https://www.google.com"),
//        SchoolPaper(year: "2021", marks: "78%", date: "2023-08-03", duration: "2 Hrs", url: "https://www.google.com"),
//        SchoolPaper(year: "2021", marks: "78%", date: "2023-08-03", duration: "2 Hrs", url: "https://www.google.com")
//    ]
    
    var dataSource: [PastPaper] = []
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell = UICollectionViewCell()
        if let learningMaterialCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell2", for: indexPath) as? CollectionViewCell {
            learningMaterialCell.configure(with: dataSource[indexPath.row])
            cell = learningMaterialCell
        }
        return cell;
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
            
        fetchStoredData()
    }
    
    func fetchStoredData()
    {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName:"PastPaperData")
        do
        {
            let savingData = try self.context?.fetch(request) as! [PastPaperData]
            if(savingData.count > 0 )
            {
//                for data in savingData {
//                            print("Year: \(data.year ?? ""), Marks: \(data.marks ?? ""), Date: \(data.date ?? ""), Category: \(data.category ?? ""), Duration: \(data.duration ?? ""), URL: \(data.url ?? "")")
//                        }
            
                dataSource = savingData
                    .filter{data in return data.category == "SCHOOL_PAPER"}
                    .map { data in
                                PastPaper(year: data.year ?? "",
                                          marks: data.marks ?? "",
                                          date: data.date ?? "",
                                          duration: data.duration ?? "",
                                          url: data.url ?? "")
                }
                collectionView.reloadData()
            }
            else
            {
                print("No results found")
            }
        }
        catch
        {
            print("Error in fetching items")
        }
    }
    
    

    
}
