//
//  VideoListCore.swift
//  VBA-SCA
//
//  Created by 최형우 on 2022/01/28.
//  Copyright © 2022 baegteun. All rights reserved.
//

import ComposableArchitecture
import Service
import Foundation
import CasePaths
import SwiftUI

struct VideoListState: Equatable{
    var selectedQuery: Query = .nature
    var videos: [Video] = []
    var videoState: VideoState?
    
    static func == (lhs: VideoListState, rhs: VideoListState) -> Bool {
        return lhs.videos == rhs.videos
    }
}

enum VideoListAction: Equatable {
    case onAppear
    case selectTag(Query)
    case videoCardDidTap(Video)
    case videoView(VideoAction)
    case videoViewDismissed
    case videosResponse(Result<VideoResponseDTO, VBAError>)
}

struct VideoListEnvironment {
    let pexelsClient: PexelsClient
    let mainQueue: AnySchedulerOf<DispatchQueue>
}

let videoListReducer = Reducer<VideoListState, VideoListAction, VideoListEnvironment>.combine(
    videoReducer
        .optional()
        .pullback(
            state: \.videoState,
            action: /VideoListAction.videoView,
            environment: {
                VideoEnvironment(mainQueue: $0.mainQueue)
            }
        ),
    .init{ state, action, env in
        struct VideoListID: Hashable {}
        switch action {
        case let .selectTag(tag):
            state.selectedQuery = tag
            return env.pexelsClient
                .getVideoList(.init(query: state.selectedQuery.rawValue))
                .receive(on: env.mainQueue)
                .catchToEffect(VideoListAction.videosResponse)
            
        case let .videoCardDidTap(video):
            state.videoState = VideoState(video: video)
            return .none
            
        case .videoViewDismissed:
            state.videoState = nil
            return .cancel(id: VideoListID())
            
        case let .videosResponse(.success(res)):
            state.videos = res.videos
            return .none
            
        case let .videosResponse(.failure(err)):
            print(err.localizedDescription)
            return .none
            
        case .onAppear:
            return env.pexelsClient
                .getVideoList(.init(query: state.selectedQuery.rawValue))
                .receive(on: env.mainQueue)
                .catchToEffect(VideoListAction.videosResponse)
            
        case .videoView:
            return .none
        }
    }
)
