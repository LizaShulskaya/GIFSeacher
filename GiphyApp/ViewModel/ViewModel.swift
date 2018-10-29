//
//  ViewModel.swift
//  GiphyApp
//
//  Created by lizaveta shulskaya on 10/29/18.
//  Copyright © 2018 lizaveta shulskaya. All rights reserved.
//

import Foundation

class GifViewModel:NSObject {
    
    open static let publicAPIKey = "dc6zaTOxFJmzC"
    let trendingURL = "http://api.giphy.com/v1/gifs/trending?api_key=dc6zaTOxFJmzC&offset=0"
    
   
    var title: String?
    var smallUrlGif: String?
    var largeUrlGif = String()
    var date = String ()
    var trendingDate = String ()
    var height = Int ()
    var width = Int ()
    var resultArray = [Gif]()
    var gifArray = [Gif]()
    var location = String()
    var numberOfRows = Int()
    var rating = String()

    func getGifArrayFromJSON(fromURL url: String) -> [Gif]? {
        let parser = JSON_Parser()
        

        let fullJSON: [Any] = parser.parseJSON(fromURL: url)

        for dict in fullJSON {
            var dict : [String:Any] = dict as! [String : Any]

            let title = dict[Constants.kTitleTag] as! String

            let date = dict[Constants.kPubDate] as! String
            let trendingDate = dict[Constants.kTrendDate] as! String
            let rating = dict[Constants.kRatingTag] as! String


            let dataBetweenImagesTag: [[String:Any]] = [dict[Constants.kImagesTag] as! Dictionary<String, Any>]
            for image in dataBetweenImagesTag {
                let dataBetweenPreviewTags: [[String:Any]] = [(image[Constants.kPreviewTag] as? Dictionary<String, Any>)!]
                let dataBetweenOriginalTags: [[String:Any]] = [image[Constants.kDownsizedTag] as! Dictionary<String, Any>]
                for smallUrl in dataBetweenPreviewTags {
                    var urlDict : [String: Any] = smallUrl

                    if let smallUrl = (smallUrl[Constants.kUrlTag] as? String) {
                        self.smallUrlGif = smallUrl
                    } else {
                        self.smallUrlGif = "https://media2.giphy.com/media/1AgUUXI6Lqm5QHciLX/giphy-preview.gif?cid=e1bb72ff5b8d38c663362e30771c9ca6"
                    }


                    if let height = urlDict[Constants.kHeightTag] as? String {
                        self.height = Int(height)!
                    } else {
                        self.height = 200
                        
                    }

                }
                for largeURL in dataBetweenOriginalTags{
                    var largeDict : [String: Any] = largeURL
                    self.largeUrlGif = largeDict[Constants.kUrlTag] as! String
                }
            }

            let sizes = Gif.Size(height: self.height, width: self.width)
            let urls = Gif.Urls(smallURL: self.smallUrlGif, largeURL: self.largeUrlGif, locationURL: nil)
            let dates = Gif.Dates(importing: date, trending: trendingDate)
            //let gif = Gif(urls: urls, title: title, dates: dates, size: sizes)
            let gif = Gif(urls: urls, title: title, rating: rating, dates: dates, size: sizes)


            self.resultArray.append(gif)
        }
        return self.resultArray
    }

    func fetchGifsForTrends(url: String, completion: @escaping ((Data, URL) -> Void))  {
        let downloader = Downloader()
        downloader.fetchGif(withUrl: url) { (data, destinationURL) in
            let compData = data
            let desturl = destinationURL
            completion(compData!, desturl!)
        }
    }
    
}
