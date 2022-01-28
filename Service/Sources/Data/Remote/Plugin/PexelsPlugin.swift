//
//  PexelsPlugin.swift
//  Service
//
//  Created by 최형우 on 2022/01/28.
//

import Moya
import Foundation

final class PexelsPlugin: PluginType{
    func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        var req = request
        
        let authorization = "563492ad6f9170000100000149b717cd3df54df18bb5f015c1a01d0b"
        req.addValue(authorization, forHTTPHeaderField: "Authorization")
        return req
    }
    
    func didReceive(_ result: Result<Response, MoyaError>, target: TargetType) {
        
    }
}
