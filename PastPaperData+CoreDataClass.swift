//
//  PastPaperData+CoreDataClass.swift
//  Finance Calculator
//
//  Created by Jamith Nimantha on 2023-08-26.
//
//

import Foundation
import CoreData

@objc(PastPaperData)
public class PastPaperData: NSManagedObject {

    convenience init(date: String, marks: String, category: String, paper: String, url: String, year: String, duration: String ,insertIntoManagedObjectContext context: NSManagedObjectContext!) {
        
        self.init(context: context)
        
        self.date = date
        self.marks = marks
        self.paper = paper
        self.duration = duration
        self.url = url
        self.year = year
        self.category = category
    }
}
