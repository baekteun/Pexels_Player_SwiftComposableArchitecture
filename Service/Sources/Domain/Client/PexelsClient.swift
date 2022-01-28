//
//  PexelsClient.swift
//  Service
//
//  Created by 최형우 on 2022/01/28.
//

import ComposableArchitecture

public struct PexelsClient{
    public var getVideoList: (VideoRequestDTO) -> Effect<VideoResponseDTO, VBAError>
    
}
