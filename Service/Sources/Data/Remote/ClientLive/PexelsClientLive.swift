//
//  PexelsClientLive.swift
//  Service
//
//  Created by 최형우 on 2022/01/28.
//

import ComposableArchitecture
import CombineMoya
import Foundation

public extension PexelsClient{
    static let live = PexelsClient(
        getVideoList: { req in
            return request(.getVideoList(req))
                .map(VideoResponseDTO.self)
                .mapError{ VBAError.error(message: $0.localizedDescription) }
                .eraseToEffect()
        }
    )
}
