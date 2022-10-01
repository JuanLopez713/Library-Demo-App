//
//  Page.swift
//  Library Demo App
//
//  Created by Juan Lopez on 9/30/22.
//

import Foundation
class Page:Identifiable, Decodable{
    var id:UUID?
    var pageNum:Int
    var page: String
    
}
