//
//  ViewController.swift
//  SoundBoardMini
//
//  Created by Arjasa Virya Aryanera on 03/04/20.
//  Copyright © 2020 Arjasa Virya Aryanera. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
                return items.count
    }
    
    var audios:[String] = []
    var audioPlayer = AVAudioPlayer()
    
    let items = ["Hi","HOI!","Samlekom","misi"]
    let images:[UIImage] = [#imageLiteral(resourceName: "lessons-1") , #imageLiteral(resourceName: "lessons-4") , #imageLiteral(resourceName: "lessons-6") , #imageLiteral(resourceName: "lessons-5")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        gettingSongName()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        
        cell.soundTitle.text = items[indexPath.row]
        cell.soundImage.image = images[indexPath.row]
        
//        cell.soundAudio?.text = audios[indexPath.row]
//        cell.textLabel?.text = songs[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
//       do{
//                    let audioPath = Bundle.main.path(forResource: audios[indexPath.row], ofType: ".m4a")
//                    try audioPlayer = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
//                    audioPlayer.play()
//                }catch{
//                    print("ERROR!")
//                }
    }
    
//  func gettingSongName(){
//    let folderURL = URL(fileURLWithPath: Bundle.main.resourcePath!)
//    do{
//        let audioPath = try FileManager.default.contentsOfDirectory(at: folderURL, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
//
//        for audio in audioPath{
//            var myAudio = audio.absoluteString
//
//            if myAudio.contains(".m4a"){
//                let findString = myAudio.components(separatedBy: "/")
//                myAudio = findString[findString.count-1]
//                myAudio = myAudio.replacingOccurrences(of: "%20", with: " ")
//                myAudio = myAudio.replacingOccurrences(of: ".m4a", with: "")
//                audios.append(myAudio)
//            }
//        }
//        myCollectionView.reloadData()
//    }
//    catch{
//
//    }
//    }
}

