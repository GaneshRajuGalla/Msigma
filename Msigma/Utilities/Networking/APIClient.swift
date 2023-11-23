//
//  APICleint.swift
//  Msigma
//
//  Created by Ganesh Raju Galla on 23/11/23.
//

import Foundation

class APICleint{
    
    // MARK: - Properties
    static private var decoder:JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
    
    static private let sucessRange:Range = 200..<300
    
    static func sendRequest<T:Decodable>(endpoint:EndPointsType) async throws -> T{
        let (data,response) = try await URLSession.shared.data(for: endpoint.asUrlRequest())
        let validData = try validateData(data: data, response: response)
        return try decoder.decode(T.self, from: validData)
    }
    
    static private func validateData(data:Data,response:URLResponse) throws -> Data{
        guard let code = (response as? HTTPURLResponse)?.statusCode else {
            throw NetworkErros.invalidResponse
        }
        
        if sucessRange.contains(code){
            return data
        } else {
            switch code{
            case 401:
                throw NetworkErros.unAuthorized
                
            case 404:
                throw NetworkErros.routeNotFound
                
            default:
                throw NetworkErros.unKnowerror(code)
            }
        }
    }
}
