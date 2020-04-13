//
//  RecordViewController.swift
//  SoundBoardMini
//
//  Created by Dhanaryo Wilson on 09/04/20.
//  Copyright © 2020 Arjasa Virya Aryanera. All rights reserved.
//

import UIKit
import AVFoundation

class RecordViewController: UIViewController, AVAudioRecorderDelegate {


    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    
    var recordingSession: AVAudioSession!
     var audioRecorder: AVAudioRecorder!
     var audioPlayer: AVAudioPlayer!

     var arrayIndex : [String] = []
     var arrayTimer: [String] = []
     var arrayString : [String] = []

     var index = 0
     var counter = 0.0
     var timer = Timer()
     var urlToStringGlobal = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        saveButton.layer.cornerRadius = 16
        
        if let number:Int = UserDefaults.standard.object(forKey: "Index") as? Int{
                  index = number
              }
              
                    if let arrayNumber:[String] = UserDefaults.standard.object(forKey: "arrayOfIndex") as? [String]{
                         arrayIndex = arrayNumber
                    }
                    
                    
                    if let arrayTime:[String] = UserDefaults.standard.object(forKey: "arrayOfTime") as? [String]{
                        arrayTimer = arrayTime
                    }
        
                if let arrayStrings:[String] = UserDefaults.standard.object(forKey: "arrayOfString") as? [String]{
                    arrayString = arrayStrings
                }
           
              
              recordingSession = AVAudioSession.sharedInstance()
              
              AVAudioSession.sharedInstance().requestRecordPermission {(hasPermission) in
                  if hasPermission {
                      print("Accepted")
                  }else{
                      print("Denied")
                  }
              }
    }
    

    @IBAction func toImage(_ sender: Any) {
        performSegue(withIdentifier: "toImage", sender: self)
    }
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let imageVC = segue.destination as? ImageViewController {
            imageVC.audioPath = self.arrayString.last!
        }
    }
    
    @IBAction func startRecording(_ sender: UIButton) {
        index += 1
        
        // file path save
        let fileName = getDocumentsDirectory().appendingPathComponent("\(index).m4a")
        
           let setting  = [AVFormatIDKey: Int(kAudioFormatMPEG4AAC), AVSampleRateKey: 12000, AVNumberOfChannelsKey: 1, AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue]
        
        // start recording
        do{
            audioRecorder = try AVAudioRecorder(url: fileName, settings: setting)
            audioRecorder.delegate = self
            audioRecorder.record()
        }catch{
            print("Error Record")
        }
        
         timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: (#selector(action)), userInfo: nil, repeats: true)
        
        var urlToStringLocal = ""
        urlToStringLocal = "\(fileName)"
        urlToStringGlobal = urlToStringLocal
        
        stopButton.isHidden = false
        recordButton.isHidden = true
    }
    
    func getDocumentsDirectory() -> URL {
          let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
          let documentDirectory = paths[0]
          return documentDirectory
      }
    
   
    
    // stop and saves the recording
    @IBAction func stopRecording(_ sender: UIButton) {
        audioRecorder.stop()
        
        // Save latest number of record
        UserDefaults.standard.set(index, forKey: "Index")

        // Save record to array
        arrayIndex.append("\(index)")
        UserDefaults.standard.set(arrayIndex, forKey: "arrayOfIndex")
        
        // Save record duration
        if let time = timeLabel.text {
            arrayTimer.append(time)
        }
        UserDefaults.standard.set(arrayTimer, forKey: "arrayOfTime")
        
        // save url to string record
               arrayString.append(urlToStringGlobal)
               UserDefaults.standard.set(arrayString, forKey: "arrayOfString")
               
               print(arrayString)
        
        recordButton.isHidden = false
        stopButton.isHidden = true
        timeLabel.isHidden = false
        
        timer.invalidate()
        counter = 0.0
    }
    
    
    // to record time
       @objc func action(){
           counter += 0.01
           var minuteString = ""
           var secondString = ""
           
           let flooredCounter = Int(floor(counter))
           
           let minute = (flooredCounter % 3600) / 60
           if minute < 10 {
               minuteString = "0\(minute)"
           } else {
               minuteString = "\(minute)"
           }
           
           let second = (flooredCounter % 3600) % 60
           if second < 10 {
               secondString = "0\(second)"
           } else {
               secondString = "\(second)"
           }
           
           let centisecond = String(format: "%.2f", counter).components(separatedBy: ".").last!
           
           timeLabel.text = "\(minuteString):\(secondString).\(centisecond)"
       }
}
