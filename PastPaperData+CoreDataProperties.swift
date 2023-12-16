//
//  PastPaperData+CoreDataProperties.swift
//  Finance Calculator
//
//  Created by Jamith Nimantha on 2023-08-26.
//
//

import Foundation
import CoreData


extension PastPaperData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PastPaperData> {
        return NSFetchRequest<PastPaperData>(entityName: "PastPaperData")
    }

    @NSManaged public var year: String?
    @NSManaged public var marks: String?
    @NSManaged public var date: String?
    @NSManaged public var duration: String?
    @NSManaged public var paper: String?
    @NSManaged public var url: String?
    @NSManaged public var category: String?

}
