//
//  PexelsClient.swift
//  Service
//
//  Created by 최형우 on 2022/01/28.
//

import ComposableArchitecture

public final class PexelsClient: BaseClient<PexelsAPI>{
    public var getVideoList: (VideoRequestDTO) -> Effect<VideoResponseDTO, VBAError>
    
    public init(
        getVideoList: @escaping(VideoRequestDTO) -> Effect<VideoResponseDTO, VBAError>
    ) {
        self.getVideoList = getVideoList
    }
}
