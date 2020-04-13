//
//  ImageViewController.swift
//  SoundBoardMini
//
//  Created by Josia Mannuel on 11/04/20.
//  Copyright © 2020 Arjasa Virya Aryanera. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var onClick: UIButton!
    @IBOutlet weak var savebutton: UIButton!
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var imgBox: UIImageView!
    
    var audioPath: String = ""
    let recordManager = RecordManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        savebutton.layer.cornerRadius = 16
        img.layer.cornerRadius = 35
        titleField.layer.cornerRadius = 18
        print(audioPath)
    }
    
    @IBAction func onpickimage(_ sender: Any) {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    
    @IBAction func save(_ sender: Any) {
        var recordName = ""
        let recordImage = img.image

        if let title = titleField.text {
            recordName = title
        } else {
            let date = Date()
            let formatter = DateFormatter()
            formatter.dateFormat = "dd.MM.yyyy"
            print(formatter.string(from: date))
            recordName = formatter.string(from: date)
        }
        
        let newRecord = Record(recordingName: recordName, recordingImage: recordImage, recordingAudioPath: audioPath)
        recordManager.saveData(record: newRecord)
        
        performSegue(withIdentifier: "toHome", sender: self)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            img.image = image
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
}


