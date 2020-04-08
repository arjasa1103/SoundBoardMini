//
//  ViewController.swift
//  SoundBoardMini
//
//  Created by Arjasa Virya Aryanera on 03/04/20.
//  Copyright © 2020 Arjasa Virya Aryanera. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let recordManager = RecordManager()
    // var recordNames: [String] = ["Test"]
    var records: [Record] = []
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Record Names"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        reloadData()
        print(records)
    }
    
    @IBAction func addName(_ sender: Any) {
        let alert = UIAlertController(title: "New Name", message: "Add a new recording name", preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Save", style: .default) {
            [unowned self] action in
            guard let textField = alert.textFields?.first,
                let nameToSave = textField.text else {
                    return
            }
            
            let record: Record = Record(recordingName: nameToSave)
            
            self.recordManager.saveData(record: record)
            self.reloadData()
            self.tableView.reloadData()
            // self.recordNames.append(nameToSave)
            // self.tableView.reloadData()
            // print(self.recordNames)
            print(self.recordManager.records)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel",
                                         style: .cancel)
        
        alert.addTextField()
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
    }
    
    func reloadData() {
        self.recordManager.loadData()
        self.records = self.recordManager.records
    }
    
}
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return recordNames.count
        return records.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        // let record = records[indexPath.row].value(forKey: "record") as! Record
        let record = records[indexPath.row]
        // let recordName = recordNames[indexPath.row]
        cell.textLabel?.text = record.recordingName
        // cell.textLabel?.text = recordName
        return cell
    }
    
}

