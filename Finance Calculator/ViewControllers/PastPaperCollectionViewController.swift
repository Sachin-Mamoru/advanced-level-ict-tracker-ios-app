//
//  PastPaperViewController.swift
//  Finance Calculator
//
//  Created by Kirishikesan on 2023-08-20.
//

import UIKit
import CoreData


class PastPaperCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var context: NSManagedObjectContext? {
        guard let appDelegate =
        UIApplication.shared.delegate as? AppDelegate else {
            return nil
        }
        return appDelegate.persistentContainer.viewContext
    }
    
//    let dataSource1: [PastPaper] = [
//        PastPaper(year: "2021", marks: "78%", date: "2023-08-03", duration: "2 Hrs", url: "https://www.google.com"),
//        PastPaper(year: "2021", marks: "78%", date: "2023-08-03", duration: "2 Hrs", url: "https://www.google.com"),
//        PastPaper(year: "2021", marks: "78%", date: "2023-08-03", duration: "2 Hrs", url: "https://www.google.com"),
//        PastPaper(year: "2021", marks: "78%", date: "2023-08-03", duration: "2 Hrs", url: "https://www.google.com")
//    ]
    
    var dataSource: [PastPaper] = []
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    
    @IBAction func viewButtonClicked(_ sender: Any) {
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let learningMaterialCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell1", for: indexPath) as? CollectionViewCell {
            learningMaterialCell.configure(with: dataSource[indexPath.row])
            learningMaterialCell.contentView.layer.cornerRadius = 1.5
            learningMaterialCell.contentView.layer.masksToBounds = true
            return learningMaterialCell
        }
        return UICollectionViewCell()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        fetchStoredData()
        
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
            
                dataSource = savingData
                    .filter{data in return data.category == "PAST_PAPER"}
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
