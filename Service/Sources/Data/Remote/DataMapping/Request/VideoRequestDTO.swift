//
//  VideoRequestDTO.swift
//  Service
//
//  Created by 최형우 on 2022/01/28.
//

struct VideoRequestDTO: Codable{
    let query: String
    let perPage: Int = 10
    let orientation: String = "portrait"
}
