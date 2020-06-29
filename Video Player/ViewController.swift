//
//  ViewController.swift
//  Video Player
//
//  Created by Mert on 29.06.2020.
//  Copyright © 2020 Mert. All rights reserved.
//

import AVKit
import UIKit


class ViewController: UIViewController {

    private var videoPlayer: AVPlayer?
    
    private var videoPlayerLayer: AVPlayerLayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupVideo()
    }
    
    private func setupVideo() {
        let url: URL
        // Get thepath to the resource in the bundle
        if let filePath = Bundle.main.path(forResource: "rain", ofType: "mov") {
            // Create a url from it
            url = URL(fileURLWithPath: filePath)
        } else {
            fatalError("broken path")
        }
        
        // Create the video player item
        let item = AVPlayerItem(url: url)
        
        // Create the player
        videoPlayer = AVPlayer(playerItem: item)
        
        // Create the layer
        videoPlayerLayer = AVPlayerLayer(player: videoPlayer)
        
        // Adjust the size and frame
        videoPlayerLayer?.frame = CGRect(
            x: -self.view.frame.size.width * 1.5,
            y: 0,
            width: self.view.frame.width * 4,
            height: self.view.frame.height)
        
        view.layer.insertSublayer(videoPlayerLayer!, at: 0)
        
        // Add it to the video and play it
        videoPlayer?.playImmediately(atRate: 0.7)
    }
}

/*
 In the Project navigator, under Build Phases you should add your media to the Bundle resources, if it doesn't there, to make this app work!.
 */
