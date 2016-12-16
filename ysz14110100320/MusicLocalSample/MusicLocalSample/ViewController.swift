//
//  ViewController.swift
//  MusicLocalSample
//
//  Created by Freeman on 2016/12/6.
//  Copyright © 2016年 Freeman. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController,AVAudioPlayerDelegate {
    
    var player : AVAudioPlayer!

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var btnplay: UIButton!
    
    @IBAction func play(_ sender: Any) {
        if self.player == nil{
            let path = Bundle.main.path(forResource: "心动", ofType: "mp3")
            let url = URL(fileURLWithPath: path!)
            //init
            do {
                self.player = try AVAudioPlayer(contentsOf: url)
            } catch let er as NSError {
                print(er.description)
                self.player = nil
            }
        }
        self.player.delegate = self
        self.player.prepareToPlay()
        self.player.numberOfLoops = -1
        
        if !self.player.isPlaying {
            self.player.play()
            self.label.text = "is Playing"
            self.btnplay.setImage(UIImage(named: "puase"), for: .normal)
        } else {
            self.player.pause()
            self.label.text = "now is Puased"
            self.btnplay.setImage(UIImage(named: "play"), for: .normal)
        }
    }
    
    @IBAction func stop(_ sender: Any) {
        if self.player != nil{
            self.player.stop()
            self.player = nil
            self.label.text = "Music has stoped"
            self.btnplay.setImage(UIImage(named: "play"), for: .normal)
        }
    }
    
    // MARK: —实现AVAudioPlayerDelegate协议方法
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        NSLog("播放完成。")
        self.label.text = "播放完成。"
        let playImage = UIImage(named: "play")
        self.btnplay.setImage(playImage, for: .normal)
    }
    
    func audioPlayerDecodeErrorDidOccur(_ player: AVAudioPlayer, error: Error?) {
        NSLog("播放错误发生: %@", error!.localizedDescription)
        self.label.text = "播放错误。"
        let playImage = UIImage(named: "play")
        self.btnplay.setImage(playImage, for: .normal)
    }
    
    func audioPlayerBeginInterruption(_ player: AVAudioPlayer) {
        NSLog("播放中断。")
        self.label.text = "播放中断。"
        let playImage = UIImage(named: "play")
        self.btnplay.setImage(playImage, for: .normal)
    }
    
    func audioPlayerEndInterruption(player: AVAudioPlayer) {
        NSLog("中断返回。")
        self.label.text = "中断返回。"
        let playImage = UIImage(named: "play")
        self.btnplay.setImage(playImage, for: .normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

