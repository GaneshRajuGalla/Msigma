//
//  Enums.swift
//  Msigma
//
//  Created by Ganesh Raju Galla on 23/11/23.
//

import Foundation

// TODO: - HttpHeaderFiles

enum HttpHeaderFiles:String{
    case contentType = "Content-Type"
    case acceptType = "Accept"
}

// TODO: - ContentType

enum ContentType:String{
    case json = "Application/json"
}

// TODO: - HttpMethod

enum HttpMethod: String{
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}

// TODO: - RequestParams

enum RequestParams{
    case query(_ request:Encodable?)
    case body(_ request:Encodable?)
}

// TODO: - NetworkErros

enum NetworkErros:Error{
    case invalidUrl
    case encodingError
    case invalidResponse
    case unAuthorized
    case routeNotFound
    case unKnowerror(Int)
}
