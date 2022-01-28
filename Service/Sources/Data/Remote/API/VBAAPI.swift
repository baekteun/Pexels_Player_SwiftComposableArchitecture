//
//  VBAAPI.swift
//  Service
//
//  Created by 최형우 on 2022/01/28.
//

import Moya
import Foundation

public protocol VBAAPI: TargetType {
    var domain: APIDomain { get }
    var urlPath: String { get }
}

extension VBAAPI {
    public var baseURL: URL{
        return URL(string: "https://api.pexels.com")!
    }
    
    public var path: String{
        return domain.url + urlPath
    }
    
    public var headers: [String : String]?{
        return [
            "Authorization": "563492ad6f9170000100000149b717cd3df54df18bb5f015c1a01d0b",
            "Content-Type": "application/json"
        ]
    }
}

public enum APIDomain: String{
    case videos
}

extension APIDomain{
    var url: String{
        return "/\(self.rawValue)"
    }
}
