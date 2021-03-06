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
    
    enum CodingKeys: String, CodingKey{
        case id
        case image
        case duration
        case user
        case videoFiles = "video_files"
    }
    
    public struct User: Identifiable, Codable {
        public let id: Int
        public let name: String
        public let url: String
        
        public init(id: Int, name: String, url: String){
            self.id = id
            self.name = name
            self.url = url
        }
    }
    
    public struct VideoFile: Identifiable, Codable {
        public let id: Int
        public let quality: String
        public let fileType: String
        public let link: String
        
        enum CodingKeys: String, CodingKey{
            case id
            case quality
            case fileType = "file_type"
            case link
        }
    }
    
    public init(id: Int, image: String, duration: Int, user: User, videoFiles: [VideoFile]){
        self.id = id
        self.image = image
        self.duration = duration
        self.user = user
        self.videoFiles = videoFiles
    }
    
    public static func == (lhs: Video, rhs: Video) -> Bool {
        return lhs.id == rhs.id
        
    }
}
