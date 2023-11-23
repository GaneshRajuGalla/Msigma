//
//  TargetType.swift
//  Msigma
//
//  Created by Ganesh Raju Galla on 23/11/23.
//

import Foundation

protocol TargetType{
    var baseUrl:String {get}
    var path:String {get}
    var method:HttpMethod{get}
    var parameteres:RequestParams{get}
}

extension TargetType{
    
    func asUrlRequest() throws -> URLRequest{
        let url = try baseUrl.asUrl()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HttpHeaderFiles.contentType.rawValue)
        
        switch parameteres{
        case .query(let request):
            let params = try request?.toDictionary()
            let queryItems = params?.compactMap({URLQueryItem(name: $0.key, value: "\($0.value)")})
            var urlComponent = URLComponents(string: url.appendingPathComponent(path).absoluteString)
            urlComponent?.queryItems = queryItems
            urlRequest.url = urlComponent?.url
            
        case .body(let request):
            let params = try request?.toDictionary()
            urlRequest.httpBody = try JSONSerialization.data(withJSONObject: params)
        }
        
        return urlRequest
    }
}
