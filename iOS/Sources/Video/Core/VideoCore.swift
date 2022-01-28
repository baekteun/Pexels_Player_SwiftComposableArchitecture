//
//  VideoCore.swift
//  VBA-SCA
//
//  Created by 최형우 on 2022/01/28.
//  Copyright © 2022 baegteun. All rights reserved.
//

import ComposableArchitecture
import Service
import Foundation
import AVKit

struct VideoState: Equatable{
    var video: Video = .init(id: 0, image: "", duration: 1, user: Video.User.init(id: 1, name: "", url: ""), videoFiles: [])
    var player = AVPlayer()
}

enum VideoAction: Equatable {
    case onAppear
}

struct VideoEnvironment {
    let mainQueue: AnySchedulerOf<DispatchQueue>
}

let videoReducer = Reducer<VideoState, VideoAction, VideoEnvironment>{ state, action, env in
    switch action{
    case .onAppear:
        state.player = AVPlayer(url: URL(string: state.video.videoFiles.first?.link ?? .init())!)
        state.player.play()
        return .none
    }
}.debug()
