//
//  SearchDetailViewController.swift
//  GiphyApp
//
//  Created by lizaveta shulskaya on 10/29/18.
//  Copyright © 2018 lizaveta shulskaya. All rights reserved.
//

import UIKit

class SearchDetailViewController: UIViewController {

    @IBOutlet var gifImage: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    var viewModel = GifViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        let textFordateLabel = String.convertDateFrom(date: self.viewModel.date)
        self.titleLabel.text = self.viewModel.title
        self.dateLabel.text = textFordateLabel
       

        
        DispatchQueue.global().async {
            let url = URL(string: self.viewModel.largeUrlGif)
            let data = try? Data(contentsOf: url!)
            DispatchQueue.main.async {
                self.gifImage.image = UIImage.gif(data: data!)
            }
        }
    }

}
