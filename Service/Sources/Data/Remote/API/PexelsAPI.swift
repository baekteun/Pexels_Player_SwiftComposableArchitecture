//
//  PexelsAPI.swift
//  Service
//
//  Created by 최형우 on 2022/01/28.
//

import Moya

public enum PexelsAPI {
    case getVideoList(VideoRequestDTO)
}

extension PexelsAPI: VBAAPI{
    public var domain: APIDomain {
        return .videos
    }
    
    public var urlPath: String {
        switch self {
        case .getVideoList:
            return "/search"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .getVideoList:
            return .get
        }
    }
    
    public var task: Task{
        switch self {
        case let .getVideoList(req):
            return .requestParameters(parameters: [
                "query" : req.query,
                "per_page" : req.perPage,
                "orientation" : req.orientation
            ], encoding: URLEncoding.queryString)
        }
    }
    
    
}
