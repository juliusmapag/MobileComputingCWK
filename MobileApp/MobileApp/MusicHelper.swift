//
//  MusicHelper.swift
//  MobileApp
//
//  Created by Julius Mapag on 07/01/2019.
//  Copyright © 2019 Julius Mapag. All rights reserved.
//

import AVFoundation

class MusicHelper {
    static let sharedHelper = MusicHelper()
    var audioPlayer: AVAudioPlayer?

    func playBackgroundMusic() {
        let aSound = NSURL(fileURLWithPath: Bundle.main.path(forResource: "gamemusic", ofType:
        "mp3")!)
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: aSound as URL)
            audioPlayer!.numberOfLoops = -1
            audioPlayer!.prepareToPlay()
            audioPlayer!.play()
            }
        catch {
            print("This audio file is not found")
        }
}
}
