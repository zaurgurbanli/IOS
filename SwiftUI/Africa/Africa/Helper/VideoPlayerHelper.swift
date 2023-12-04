//
//  VideoPlayerHelper.swift
//  Africa
//
//  Created by Zaur Gurbanli on 27.02.22.
//

import Foundation
import AVKit

var videoPlayer: AVPlayer?

func playVideo(name:String, format: String) -> AVPlayer {
    let file = Bundle.main.url(forResource: name, withExtension: format)
    if(file != nil){
        videoPlayer = AVPlayer(url: file!)
        videoPlayer?.play()
    }
    return videoPlayer!
}
