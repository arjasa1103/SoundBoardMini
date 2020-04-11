//
//  DataStore.swift
//  SoundBoardMini
//
//  Created by Arjasa Virya Aryanera on 08/04/20.
//  Copyright © 2020 Arjasa Virya Aryanera. All rights reserved.
//

import Foundation

class DataStore {
    
    static let sharedInstance = DataStore()
    private init() {}
    var recordingList: [Record] = []
}
