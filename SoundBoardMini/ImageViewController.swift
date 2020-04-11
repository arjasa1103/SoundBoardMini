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
       
       
       
       override func viewDidLoad() {
           super.viewDidLoad()
           savebutton.layer.cornerRadius = 16
           img.layer.cornerRadius = 35
           titleField.layer.cornerRadius = 18
           
       }
       
       @IBAction func onpickimage(_ sender: Any) {
           let vc = UIImagePickerController()
           vc.sourceType = .photoLibrary
           vc.delegate = self
           vc.allowsEditing = true
           present(vc, animated: true)
       }
       
       @IBAction func save(_ sender: Any) {
           if titleField.text == "" {
               let date = Date()
               let formatter = DateFormatter()
               formatter.dateFormat = "dd.MM.yyyy"
               print(formatter.string(from: date))
           }
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


