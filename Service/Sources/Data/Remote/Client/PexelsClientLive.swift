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
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            return request(.getVideoList(req))
                .map { data in data.data }
                .decode(type: VideoResponseDTO.self, decoder: decoder)
                .mapError{ VBAError.error(message: $0.localizedDescription) }
                .eraseToEffect()
                
        }
    )
}
