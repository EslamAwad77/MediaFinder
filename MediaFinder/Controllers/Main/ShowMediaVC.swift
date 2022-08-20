//
//  ShowMediaVC.swift
//  MediaFinder
//
//  Created by eslam awad elsayed awad on 17/08/2022.
//

import UIKit
import AVKit
import AVFoundation

class ShowMediaVC: UIViewController {
    //TODO: Data
    var videoURL: String = ""
    
    //TODO: Outlets
    
    //TODO: Actions
    @IBAction func btnVideoClicked(_ sender: UIButton) {
        self.playVideo(videoName: videoURL)
    }
}

//TODO: lifeCycle Of Screen

extension ShowMediaVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension ShowMediaVC {
    func playVideo(videoName: String) {

        let player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: videoName, ofType: "m4v")!))
//        let layer = AVPlayerLayer(player: player)
//        layer.frame = view.bounds
//        layer.videoGravity = .resizeAspectFill
//        view.layer.addSublayer(layer)
//        player.volume = 0
//        player.play()
        let vc = AVPlayerViewController()
        vc.player = player
        self.present(vc, animated: true)
    }
}
