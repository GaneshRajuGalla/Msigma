//
//  SampleData.swift
//  Msigma
//
//  Created by Ganesh Raju Galla on 23/11/23.
//

import Foundation

struct CourceModel: Identifiable{
    var id = UUID()
    let image:ImageResource
    let offer:Float?
    let courceTitle:String
    let enrollCount:String
    
    static func getData() -> [CourceModel]{
        return [
            CourceModel(image: .engineering, offer: 20, courceTitle: "B.Tech", enrollCount: "2.4k"),
            CourceModel(image: .upsc, offer: 20, courceTitle: "UPSC", enrollCount: "6.3k"),
            CourceModel(image: .isro, offer: nil, courceTitle: "ISRO", enrollCount: "2.4k"),
            CourceModel(image: .gate, offer: 20, courceTitle: "GATE", enrollCount: "2.4k")
        ]
    }
}
