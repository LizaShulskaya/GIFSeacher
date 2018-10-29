//
//  DetailGifViewController.swift
//  GiphyApp
//
//  Created by lizaveta shulskaya on 10/29/18.
//  Copyright © 2018 lizaveta shulskaya. All rights reserved.
//

import UIKit

class DetailGifViewController: UIViewController {

    @IBOutlet var highResolusionImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var pubDateLabel: UILabel!
    @IBOutlet var logoImageView: UIImageView!

    var textL = String()
    var viewModel = GifViewModel()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setUpViews()
        self.setUpMainGif()
    }

     func setUpViews(){
        let dateForLabel = String.convertDateFrom(date: self.viewModel.date)
        self.pubDateLabel.text = dateForLabel
        self.titleLabel.text = self.viewModel.title
        self.logoImageView.image = UIImage(named: "logo.png")
    }
    func setUpMainGif() {
        DispatchQueue.global().async {
            let url = URL(string: self.viewModel.largeUrlGif)
            let data = try? Data(contentsOf: url!)
            DispatchQueue.main.async {
                self.highResolusionImageView.image = UIImage.gif(data: data!)
            }
        }

    }



}
