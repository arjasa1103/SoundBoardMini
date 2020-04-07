//
//  ViewController.swift
//  SoundBoardMini
//
//  Created by Arjasa Virya Aryanera on 03/04/20.
//  Copyright © 2020 Arjasa Virya Aryanera. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var onClick: UIButton!
    @IBOutlet weak var savebutton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        savebutton.layer.cornerRadius = 20
        img.layer.cornerRadius = 30
        
    }
    
    @IBAction func onpickimage(_ sender: Any) {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    

}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
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

