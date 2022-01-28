//
//  VideoRequestDTO.swift
//  Service
//
//  Created by 최형우 on 2022/01/28.
//

public struct VideoRequestDTO: Codable{
    public let query: String
    public let perPage: Int = 10
    public let orientation: String = "portrait"
}
