//
//  DetailsViewController.swift
//  Diffable Data Source
//
//  Created by MD. SHAYANUL HAQ SADI on 21/3/23.
//

import UIKit

class DetailsViewController: UIViewController {
    
    static let identifier = "DetailsViewController"
   
    
    private let myBgImage: UIImageView = {
        let imageView = UIImageView()
//        imageView.image = UIImage(systemName: "carrot.fill")
        imageView.image = UIImage(named: "bg 3")
//        imageView.backgroundColor = .systemRed
        imageView.tintColor = .systemMint
        imageView.contentMode = .scaleAspectFill
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.clipsToBounds = true
//        imageView.layer.cornerRadius = 55
        
        return imageView
    }()

    
    
    private let myImage: UIImageView = {
        let imageView = UIImageView()
//        imageView.image = UIImage(systemName: "carrot.fill")
        imageView.image = UIImage(named: "bg")
//        imageView.backgroundColor = .systemRed
        imageView.tintColor = .systemMint
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 55
        imageView.layer.borderColor = CGColor(red: 0.0, green: 0.40, blue: 1.0, alpha: 0.50)
//        imageView.layer.borderColor = CGColor(red: 0.0, green: 0.40, blue: 1.0, alpha: 0.50)
        imageView.layer.borderWidth = 10
        return imageView
    }()
    
    
    private let myLabel: UILabel = {
        let label = UILabel()
//        label.text = "Fruit"
//        label.textColor = .systemMint
        label.textColor = .lightText
        label.backgroundColor = .separator
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 0
        label.clipsToBounds = true
        label.layer.cornerRadius = 5
        return label
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        title = "Fruit" //dynamic
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus.circle"), style: .done, target: self, action: nil)
//        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: segmentControl)
        
        view.addSubview(myBgImage)
        view.addSubview(myImage)
        view.addSubview(myLabel)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        myBgImage.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
        myImage.frame = CGRect(x: view.frame.size.width/2-100, y: 200, width: 200, height: 200)
        myLabel.frame = CGRect(x: view.frame.size.width/2-100, y: 500, width: 200, height: 100)
    }
    
    
    func setup(fruit: ViewController.Fruit, backgroundImg: UIImage, navTitle: String) {
        myLabel.text = fruit.title
        myImage.image = fruit.image
        myBgImage.image = backgroundImg
        title = navTitle
    }
}
