//
//  VideoRequestDTO.swift
//  Service
//
//  Created by 최형우 on 2022/01/28.
//

public struct VideoRequestDTO: Codable{
    public let query: String
    public let perPage: Int
    public let orientation: String 
    
    public init(query: String, perPage: Int = 10, orientation: String = "portrait"){
        self.query = query
        self.perPage = perPage
        self.orientation = orientation
    }
}
