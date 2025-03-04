//
//  DetailViewController.swift
//  TableViewOnlyCode
//
//  Created by 서준일 on 3/4/25.
//

import UIKit

class DetailViewController: UIViewController {

    private let detailView = DetailView()
    
    var movieData: Movie?
    
    override func loadView() {
        view = detailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    func setupUI() {
        detailView.mainImageView.image = movieData?.movieImage
        detailView.movieNameLabel.text = movieData?.movieName
        detailView.descriptionLabel.text = movieData?.movieDescription
    }
}
