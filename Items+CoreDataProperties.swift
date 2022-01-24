//
//  Items+CoreDataProperties.swift
//  IntakePaperwork
//
//  Created by Dax Gerber on 12/28/21.
//
//

import Foundation
import CoreData
import SwiftUI


extension Items {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Items> {
        return NSFetchRequest<Items>(entityName: "Items")
    }

    @NSManaged public var timestamp: Date?
    @NSManaged public var pdfArray: [NSData]
    @NSManaged public var imageArray: [UIImage]
    @NSManaged public var name: String

}

extension Items : Identifiable {

}
