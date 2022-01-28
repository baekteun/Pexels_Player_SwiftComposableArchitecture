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

struct VideoListState: Equatable{
    var selectedQuery: Query
    var videos: [Video]
    
    static func == (lhs: VideoListState, rhs: VideoListState) -> Bool {
        return lhs.videos == rhs.videos
    }
}

enum VideoListAction {
    case viewDidAppear
    case selectTag(Query)
    case videoDidTap(Video)
}

