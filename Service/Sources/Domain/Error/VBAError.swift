//
//  VBAError.swift
//  Service
//
//  Created by 최형우 on 2022/01/28.
//

import Foundation

public enum VBAError: Error, Equatable{
    public static func == (lhs: VBAError, rhs: VBAError) -> Bool {
        return lhs.localizedDescription == rhs.localizedDescription
    }
    
    case error(message: String = "에러가 발생했습니다.", errorBody: [String:Any] = [:])
}
