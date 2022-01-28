//
//  VideoDTO.swift
//  Service
//
//  Created by 최형우 on 2022/01/28.
//

struct VideoResponseDTO: Codable {
    let page: Int
    let perPage: Int
    let totalResults: Int
    let url: String
    let videos: [Video]
}
