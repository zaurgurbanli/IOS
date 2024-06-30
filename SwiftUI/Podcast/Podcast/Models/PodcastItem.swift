//
//  PodcastItem.swift
//  Podcast
//
//  Created by Zaur Gurbanli on 28.06.24.
//

import Foundation

struct PodcastsItem {
    let id: Int
    let bgImage: String
    let title: String
    let date: String
    let time: String
    let author: String
    let new: Bool
}


let podcastsItem: [PodcastsItem] = [
    PodcastsItem(id:0, bgImage: "newpodcast1", title: "About flow and our motivations", date: "28.06.2024", time: "12.04.40", author: "Zaur Gurbanli", new: true),
    PodcastsItem(id:1, bgImage: "newpodcast2", title: "About flow and our motivations", date: "28.06.2024", time: "12.04.40", author: "Zaur Gurbanli", new: false),
    PodcastsItem(id:2, bgImage: "newpodcast3", title: "About flow and our motivations", date: "28.06.2024", time: "12.04.40", author: "Zaur Gurbanli", new: false)
]
