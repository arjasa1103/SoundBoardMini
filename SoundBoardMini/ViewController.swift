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
    
    var audios:[String] = []
    var audioPlayer = AVAudioPlayer()
    
    let items = ["Hi","HOI!","Samlekom","misi"]
    let images:[UIImage] = [#imageLiteral(resourceName: "lessons-1") , #imageLiteral(resourceName: "lessons-4") , #imageLiteral(resourceName: "lessons-6") , #imageLiteral(resourceName: "lessons-5")]
    
    var records: [Record] = []
    let recordManager = RecordManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        gettingSongName()
        recordManager.loadData()
        records = recordManager.records
        // myCollectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
    }
    
    @IBAction func addRecord(_ sender: Any) {
        performSegue(withIdentifier: "toRecord", sender: self)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return records.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell

        cell.soundTitle.text = records[indexPath.row].recordingName
        cell.soundImage.image = records[indexPath.row].recordingImage
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(records[indexPath.row])
        do{
            // let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
            // let documentDirectory = paths[0]
            print(records[indexPath.row].recordingAudioPath)
            // let audioPath = Bundle.main.path(forResource: records[indexPath.row].recordingAudioPath, ofType: ".m4a")
            // print(audioPath)
            // print(URL.init(fileURLWithPath: records[indexPath.row].recordingAudioPath))
            try audioPlayer = AVAudioPlayer(contentsOf: URL(string: records[indexPath.row].recordingAudioPath)!)
            audioPlayer.play()
        }catch{
            print("Error in playing audio files : \(error.localizedDescription)")
        }
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
