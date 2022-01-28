//
//  Video.swift
//  Service
//
//  Created by 최형우 on 2022/01/28.
//

public struct Video: Identifiable, Codable, Equatable {
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
    
    public static func == (lhs: Video, rhs: Video) -> Bool {
        return lhs.id == rhs.id
        
    }
}
