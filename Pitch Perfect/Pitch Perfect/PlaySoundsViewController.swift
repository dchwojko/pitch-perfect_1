//
//  PlaySoundsViewController.swift
//  Pitch Perfect
//
//  Created by DONALD CHWOJKO on 4/26/15.
//  Copyright (c) 2015 DONALD CHWOJKO. All rights reserved.
//

import UIKit
import AVFoundation


class PlaySoundsViewController: UIViewController {
    var audioPlayer: AVAudioPlayer!
    var receivedAudio: RecordedAudio!
    var audioEngine:AVAudioEngine!
    var audioFile:AVAudioFile!

    @IBOutlet weak var stopPlaybackButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        audioPlayer = AVAudioPlayer(contentsOfURL: receivedAudio.filePathUrl, error: nil)
        audioPlayer.enableRate = true
        audioEngine = AVAudioEngine()
        audioFile = AVAudioFile(forReading: receivedAudio.filePathUrl, error: nil)
        
    }
    
    override func viewWillAppear(animated: Bool) {
        stopPlaybackButton.hidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func playSlowAudio(sender: UIButton) {
        playAudioWithSoundEffect(rate: 0.25)
    }

    @IBAction func playFastAudio(sender: UIButton) {
        playAudioWithSoundEffect(rate: 3.0)
    }
    @IBAction func stopAudio(sender: UIButton) {
        audioPlayer.stop()
        audioEngine.stop()
        audioEngine.reset()
        stopPlaybackButton.hidden = true
    }
    
    func playAudioWithSoundEffect(pitch: Float = 1.0, rate: Float = 1.0) {
        stopPlaybackButton.hidden = false
        audioPlayer.stop()
        audioEngine.stop()
        audioEngine.reset()
        
        var audioPlayerNode = AVAudioPlayerNode()
        audioEngine.attachNode(audioPlayerNode)
        
        var soundEffect = AVAudioUnitTimePitch()
        soundEffect.pitch = pitch
        soundEffect.rate = rate
        audioEngine.attachNode(soundEffect)
        
        audioEngine.connect(audioPlayerNode, to: soundEffect, format: nil)
        audioEngine.connect(soundEffect, to: audioEngine.outputNode, format: nil)
        
        audioPlayerNode.scheduleFile(audioFile, atTime: nil, completionHandler: nil)
        audioEngine.startAndReturnError(nil)
        
        audioPlayerNode.play()

    }
    
    @IBAction func playChipmunkAudio(sender: UIButton) {
        playAudioWithSoundEffect(pitch: 1000)
    }
    
    @IBAction func playDarthvaderAudio(sender: UIButton) {
        playAudioWithSoundEffect(pitch: -1000)
    }
}
