//
//  PexelsClientLive.swift
//  Service
//
//  Created by 최형우 on 2022/01/28.
//

import ComposableArchitecture
import CombineMoya
import Foundation

extension PexelsClient{
    static let live = PexelsClient(
        getVideoList: { req in
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            return request(.getVideoList(req))
                .map { data in data.data }
                .decode(type: VideoResponseDTO.self, decoder: decoder)
                .mapError{ _ in VBAError.error(message: "동영상을 불러오는 데에 실패했습니다.") }
                .eraseToEffect()
                
        }
    )
}
