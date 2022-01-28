//
//  VideoDTO.swift
//  Service
//
//  Created by 최형우 on 2022/01/28.
//

public struct VideoResponseDTO: Equatable, Codable {
    public let page: Int
    public let perPage: Int
    public let totalResults: Int
    public let url: String
    public let videos: [Video]
    
    enum CodingKeys: String, CodingKey{
        case page = "page"
        case perPage = "per_page"
        case totalResults = "total_results"
        case url = "url"
        case videos = "videos"
    }
}
