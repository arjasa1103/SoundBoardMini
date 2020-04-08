//
//  Recording+CoreDataProperties.swift
//  SoundBoardMini
//
//  Created by Arjasa Virya Aryanera on 08/04/20.
//  Copyright © 2020 Arjasa Virya Aryanera. All rights reserved.
//
//

import Foundation
import CoreData


extension Recording {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Recording> {
        return NSFetchRequest<Recording>(entityName: "Recording")
    }

    @NSManaged public var record: Data?

}
