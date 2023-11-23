//
//  EndPointsType.swift
//  Msigma
//
//  Created by Ganesh Raju Galla on 23/11/23.
//

import Foundation

enum EndPointsType{
    case cources(courceName:String)
}

extension EndPointsType:TargetType{
    
    // MARK: - baseUrl
    
    var baseUrl: String {
        return "https://api.msigma.in/"
    }
    
    // TODO: - path
    
    var path: String {
        switch self {
        case .cources(let courceName):
            return "\(courceName)/v2/branches"
        }
        
    }
    
    // TODO: - method
    
    var method: HttpMethod {
        switch self {
        case .cources:
            return .get
        }
    }
    
    // TODO: - parameteres
    
    var parameteres: RequestParams {
        switch self {
        case .cources:
            return .query(nil)
        }
    }
}
