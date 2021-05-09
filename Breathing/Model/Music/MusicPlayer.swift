//
//  MusicPlayer.swift
//  Breathing
//
//  Created by Jackie Leonardy on 02/05/21.
//

import AVFoundation
import Foundation

var player : AVAudioPlayer?

class MusicPlayer{
    static func playSound(sound: String) {
        
        if let path = Bundle.main.url(forResource: sound, withExtension: "mp3"){
            
            var audioSession = AVAudioSession.sharedInstance()
            
            do {
                try audioSession.setCategory(AVAudioSession.Category.playAndRecord)
            } catch {
                assertionFailure("Failed to configure `AVAAudioSession`: \(error.localizedDescription)")
            }
            do{
                player = try AVAudioPlayer(contentsOf: path, fileTypeHint: AVFileType.mp3.rawValue)
                guard let player = player else { return }

                    player.play()
                player.volume = 2
            } catch{
              print("Sound Path error")
            }
            
        }
    }
    
    static func stopSound(){
        if let player = player, player.isPlaying {
            player.stop()
        }
    }
    
    static func fadeSound(ratioVolume : Float, transitionTime: Float){
        if let player = player, player.isPlaying {
            player.setVolume(ratioVolume, fadeDuration: TimeInterval(transitionTime))
        }
    }
}
