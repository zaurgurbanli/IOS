//
//  HeadingsItem.swift
//  Podcast
//
//  Created by Zaur Gurbanli on 28.06.24.
//

import Foundation

struct HeadingsItem {
    let id: Int
    let icon: String
    let text: String
}

let headingsItem: [HeadingsItem] = [
    HeadingsItem(id: 0, icon: "music.note.house", text: "Topics"),
    HeadingsItem(id: 1, icon: "globe", text: "Topics"),
    HeadingsItem(id: 2, icon: "face.smiling", text: "Authors"),
    HeadingsItem(id: 3, icon: "mic", text: "Podcasts"),
    HeadingsItem(id: 4, icon: "square.stack.3d.up", text: "Episodes")
]
