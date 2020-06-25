//
//  ViewController.swift
//  Xylophone
//
//  Created by Rukhsar Jamati on 28/06/2019.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func keyPressed(_ sender: UIButton) {
        //print(sender.titleLabel?.text)
        print(sender.currentTitle)
        //print(sender.title(for: .normal))
        
        playSound(soundName : sender.currentTitle!)
        
        // Reduces sender's opacity to half
        sender.alpha = 0.5
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){
            
            //Bring's sender's opacity back up to fully opaque
            sender.alpha = 1.0
    
        }
    }
    
    func playSound(soundName : String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
        
    }
}
