//
//  Recording.swift
//  SoundBoardMini
//
//  Created by Arjasa Virya Aryanera on 07/04/20.
//  Copyright © 2020 Arjasa Virya Aryanera. All rights reserved.
//
import UIKit
import Foundation
import CoreData

public class Record: NSObject, NSCoding {
    
    var recordingName: String = ""
    // var recordingImage: UIImage!
    // var recordingAudioPath: String
    
    struct Keys {
        static let recordingName = "recordingName"
        // static let recordingImage = "recordingImage"
        // static let recordingAudioPath = "recordingAudioPath"
    }
    
    init(recordingName: String) {
        self.recordingName = recordingName
        // self.recordingImage = recordingImage
        // self.recordingAudioPath = recordingAudioPath
    }
    
    public func encode(with coder: NSCoder) {
        coder.encode(recordingName, forKey: Keys.recordingName)
        // coder.encode(recordingImage, forKey: Keys.recordingImage)
        // coder.encode(recordingAudioPath, forKey: Keys.recordingAudioPath)
    }
    
    public required convenience init?(coder: NSCoder) {
        guard let dRecordingName = coder.decodeObject(forKey: Keys.recordingName) as? String else { return nil }
            // , let dRecordingImage = coder.decodeObject(forKey: Keys.recordingImage) as? UIImage
            // , let dRecordingAudioPath = coder.decodeObject(forKey: Keys.recordingAudioPath) as? String
        
        self.init(
            recordingName: dRecordingName
            // recordingImage: dRecordingImage,
            // recordingAudioPath: dRecordingAudioPath
        )
    }
    
}
