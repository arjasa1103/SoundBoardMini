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
    
    func shakeView(duration: CFTimeInterval, view: UIView) {
        let shakeValues = [-5, 5, -5, 5, -3, 3, -2, 2, 0]

        let translation = CAKeyframeAnimation(keyPath: "transform.translation.x");
        translation.timingFunction = CAMediaTimingFunction(name: .linear)
        translation.values = shakeValues
        
        let rotation = CAKeyframeAnimation(keyPath: "transform.rotation.z")
        rotation.values = shakeValues.map { (Int(Double.pi) * $0) / 180 }
        
        let shakeGroup = CAAnimationGroup()
        shakeGroup.animations = [translation, rotation]
        shakeGroup.duration = 0.5
        view.layer.add(shakeGroup, forKey: "shakeIt")
    }
    
}

