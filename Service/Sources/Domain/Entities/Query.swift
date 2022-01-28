//
//  Query.swift
//  Service
//
//  Created by 최형우 on 2022/01/28.
//

public enum Query: String, CaseIterable{
    case nature, animals, people, ocean, food
}

public struct Video: Identifiable, Codable {
    public let id: Int
    public let image: String
    public let duration: Int
    public let user: User
    public let videoFiles: [VideoFile]
    
    public struct User: Identifiable, Codable {
        public let id: Int
        public let name: String
        public let url: String
    }
    
    public struct VideoFile: Identifiable, Codable {
        public let id: Int
        public let quality: String
        public let fileType: String
        public let link: String
    }
}
