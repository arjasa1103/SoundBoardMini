//
//  RecordManager.swift
//  SoundBoardMini
//
//  Created by Arjasa Virya Aryanera on 08/04/20.
//  Copyright © 2020 Arjasa Virya Aryanera. All rights reserved.
//
import UIKit
import Foundation
import CoreData

public class RecordManager {
    
    var records: [Record] = []
    // var store = DataStore.sharedInstance
    
    // var filepath: String {
    //     let manager = FileManager.default
    //     let url = manager.urls(for: .documentDirectory, in: .userDomainMask).first
    //     print("url path : \(String(describing: url))")
    //     
    //     return (url!.appendingPathComponent("Data").path)
    // }
    // 
    public func saveData(record : Record){
        // self.store.recordingList.append(record)
        //
        // do {
        // let data = try NSKeyedArchiver.archivedData(withRootObject: self.store.recordingList, requiringSecureCoding: false)
        //     try data.write(to: URL(string: filepath)!)
        // } catch {
        //     print("error in writing file : \(error.localizedDescription)")
        // }
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Recording", in: managedContext)!
        let recording = NSManagedObject.init(entity: entity, insertInto: managedContext)
        
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: record, requiringSecureCoding: false)
            recording.setValue(data, forKey: "record")
            try managedContext.save()
        } catch {
            print("Error in saving data : \(error.localizedDescription)")
        }
        
    }
    
    public func loadData(){
        // do {
        //     let data = try Data(contentsOf: URL(string: filepath)!)
        //     let object = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data)
        //     return object
        // } catch {
        //     print("error in loading data: \(error.localizedDescription)")
        // }
        // return nil
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Recording")
        
        do {
            let result = try managedContext.fetch(fetchRequest)
            records = []
            
            for data in result as! [NSManagedObject] {
                let recordData = data.value(forKey: "record") as! Data
                let record = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(recordData)
                records.append(record as! Record)
            }
        } catch {
            print("Error in retrieving data : \(error.localizedDescription)")
        }
    }
    
    // public func getRecords() -> [Record] {
    //     var result: [Record] = []
    //     
    //     for data in records as [NSManagedObject]{
    //         let record = data.value(forKey: "record") as! Record
    //         result.append(record)
    //     }
    //     
    //     return result
    // }
}
