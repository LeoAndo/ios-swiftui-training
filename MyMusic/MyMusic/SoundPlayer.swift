//
//  SoundPlayer.swift
//  MyMusic
//
//  Created by LeoAndo on 2022/04/27.
//

import UIKit
import AVFoundation

class SoundPlayer: NSObject {
    var cymbalPlayer:AVAudioPlayer!
    func play(fileName: String) {
        do {
            guard let data = NSDataAsset(name: fileName)?.data else {
                print("fileName: \(fileName)")
                return
            }
            cymbalPlayer = try AVAudioPlayer(data: data)
            cymbalPlayer.play()
        } catch {
            print("エラーが発生しました！")
        }
    }
}
