//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 27/01/2016.
//  Copyright © 2016 London App Brewery. All rights reserved.
//

import UIKit
import AVFoundation
import AudioToolbox

class ViewController: UIViewController, AVAudioPlayerDelegate{
    
    var player: AVAudioPlayer!
    
    let soundFilesNames = ["note1", "note2", "note3", "note4", "note5", "note6", "note7"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }



    @IBAction func notePressed(_ sender: UIButton) {
        // SOLUÇÃO STACK OVERFLOW
        /*guard let url = Bundle.main.url(forResource: "note\(sender.tag)", withExtension: "wav") else {
            print("url not found")
            return
        }
        
        do {
            /// this codes for making this app ready to takeover the device audio
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            
            /// change fileTypeHint according to the type of your audio file (you can omit this)
            
            /// for iOS 11 onward, use :
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            /// else :
            /// player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3)
            
            // no need for prepareToPlay because prepareToPlay is happen automatically when calling play()
            player!.play()
        } catch let error as NSError {
            print("error: \(error.localizedDescription)")
        }*/
        
        //solução do curso
        
//        let url = Bundle.main.url(forResource: "note\(sender.tag)", withExtension: "wav")!
//        do{
//            player = try AVAudioPlayer(contentsOf: url)
//            guard let player = player else {return}
//            player.prepareToPlay()
//            player.play()
//        }catch let error as Error {
//            print (error.localizedDescription)
//        }
        
        //outra solução do curso
        
//        if let soundURL = Bundle.main.url(forResource: "note\(sender.tag)", withExtension: "wav"){
//            var mySound: SystemSoundID = 0
//            AudioServicesCreateSystemSoundID(soundURL as CFURL, &mySound)
//            //play the sound
//            AudioServicesPlaySystemSound(mySound)
//        }
        
        //Solução final do curso
        playSound(fileName: soundFilesNames[sender.tag - 1])
    }
    
    func playSound(fileName : String){
        let soundUrl = Bundle.main.url(forResource: fileName, withExtension: "wav")
        do{
            player = try AVAudioPlayer(contentsOf: soundUrl!)
        }
        catch {
            print(error)
        }
        player.play();
    }

}

