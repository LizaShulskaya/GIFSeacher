//
//  Gif.swift
//  GiphyApp
//
//  Created by lizaveta shulskaya on 10/29/18.
//  Copyright © 2018 lizaveta shulskaya. All rights reserved.
//

import Foundation


class Gif {
   

        var title: String?
        var rating: String?
        var urls: Urls
        var dates:Dates
        var sizes: Size
    
    
    struct Size {
        var height: Int
        var width: Int
    }
    struct Dates {
        var importing: String?
        var trending: String?
    }
    struct Urls {
        var smallURL: String?
        var largeURL: String?
        var locationURL: String?
    }
    

    init(urls: Urls, title: String?,rating: String?, dates: Dates, size: Size) {
        self.title = title
        self.urls = urls
        self.dates = dates
        self.sizes = size
        self.rating = rating
    }
}
