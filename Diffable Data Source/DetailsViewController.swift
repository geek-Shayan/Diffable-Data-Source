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
        imageView.image = UIImage(named: "bg 3")
//        imageView.backgroundColor = .systemRed
        imageView.tintColor = .systemMint
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    
    private let myButton: UIButton = {
        let button = UIButton()
//        button.setTitle("tap", for: .normal)
        button.backgroundColor = .orange
        button.addTarget(nil, action: #selector(didTapbutton), for: .touchUpInside)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        button.titleLabel?.numberOfLines = 0
        button.clipsToBounds = true
        button.layer.cornerRadius = 5
        return button
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
        imageView.layer.cornerRadius = 150
        imageView.layer.borderColor = CGColor(red: 0.0, green: 0.40, blue: 0.90, alpha: 0.80)
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
//        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus.circle"), style: .done, target: self, action: nil)
//        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: segmentControl)
        
        view.addSubview(myBgImage)
        view.addSubview(myImage)
        view.addSubview(myLabel)
        view.addSubview(myButton)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        myBgImage.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
        myImage.frame = CGRect(x: view.frame.size.width/2-150, y: 100, width: 300, height: 300)
        myLabel.frame = CGRect(x: view.frame.size.width/2-100, y: 450, width: 200, height: 100)
        myButton.frame = CGRect(x: view.frame.size.width/2-50, y: 600, width: 100, height: 100)
    }
    
    
    func setup(fruit: ViewController.Fruit, backgroundImg: UIImage, navTitle: String) {
        myLabel.text = fruit.title
        myImage.image = fruit.image
        myBgImage.image = backgroundImg
        myButton.setTitle(fruit.title, for: .normal)
        title = navTitle
    }
    
    
    @objc func didTapbutton() {
        myImage.layer.borderColor = CGColor(red: CGFloat(Float(arc4random()) / Float(UINT32_MAX)), green: CGFloat(Float(arc4random()) / Float(UINT32_MAX)), blue: CGFloat(Float(arc4random()) / Float(UINT32_MAX)), alpha: 0.80)
        
        
//        myImage.layer.borderWidth += 2
//
//        if (myImage.layer.cornerRadius == 0) {
//            myImage.layer.cornerRadius = 100
//        }
//        else if (myImage.layer.cornerRadius == 100) {
//            myImage.layer.cornerRadius = 0
//        }
    }
}


