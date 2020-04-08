//
//  RecordViewController.swift
//  SoundBoardMini
//
//  Created by Arjasa Virya Aryanera on 06/04/20.
//  Copyright © 2020 Arjasa Virya Aryanera. All rights reserved.
//

import UIKit
import AVFoundation

class RecordViewController: UIViewController, AVAudioRecorderDelegate {

    var recordingSession: AVAudioSession!
    var audioRecorder: AVAudioRecorder!
    
    var numOfRecords = 0
    
    @IBOutlet weak var recordButton: UIButton!
    
    @IBAction func record(_ sender: UIButton) {
        // Check if have an active recorder
        if audioRecorder == nil{
            numOfRecords += 1
            let fileName = getDirectory().appendingPathComponent("\(numOfRecords).m4a")
            
            let settings = [AVFormatIDKey: Int(kAudioFormatMPEG4AAC), AVSampleRateKey: 12000, AVNumberOfChannelsKey: 1, AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue]
            
            // Start audio recording
            do{
                audioRecorder = try AVAudioRecorder(url: fileName, settings: settings)
                audioRecorder.delegate = self
                audioRecorder.record()
                
                recordButton.setTitle("Stop Recording", for: .normal)
            } catch {
                displayAlert(title: "Whoops!", message: "Recording Failed")
            }
        } else {
            audioRecorder.stop()
            audioRecorder = nil
            
            recordButton.setTitle("Start REcording", for: .normal)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Setting up session
        
        recordingSession = AVAudioSession.sharedInstance()
        
        // do {
        //     try recordingSession.setCategory(.playAndRecord, mode: .default)
        //     try recordingSession.setActive(true)
            recordingSession.requestRecordPermission() { (allowed) in
                // DispatchQueue.main.async {
                    if allowed {
                    //     self.loadRecordingUI()
                        print("Accepted")
                    } else {
                    //     self.loadFailUI()
                    }
                // }
            }
        // }
    }
    

    // /*
    // // MARK: - Navigation
    //
    // // In a storyboard-based application, you will often want to do a little preparation before navigation
    // override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //     // Get the new view controller using segue.destination.
    //     // Pass the selected object to the new view controller.
    // }
    // */
    
    // get path to directory
    func getDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = paths [0]
        return documentDirectory
    }

    // displays alert
    func displayAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "dismiss", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
