//
//  CoverModel.swift
//  NationalGeography
//
//  Created by Yacine on 9/9/23.
//

import Foundation

struct CoverModel: Identifiable{
    var id: Int
    var name: String
    var thumbnail:String
}


let coversData: [CoverModel] = [
    CoverModel(id: 1, name: "cover1", thumbnail: "thumb-cover1"),
    CoverModel(id: 2, name: "cover2", thumbnail: "thumb-cover2"),
    CoverModel(id: 3, name: "cover3", thumbnail: "thumb-cover3"),
]
