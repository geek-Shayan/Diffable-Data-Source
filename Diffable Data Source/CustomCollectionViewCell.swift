//
//  CustomCollectionViewCell.swift
//  Diffable Data Source
//
//  Created by MD. SHAYANUL HAQ SADI on 14/3/23.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CustomCollectionViewCell"
    
    
    private let myImage: UIImageView = {
        let imageView = UIImageView()
//        imageView.image = UIImage(systemName: "carrot.fill")
//        imageView.image = UIImage(named: "bg 4")
//        imageView.backgroundColor = .systemRed
        imageView.tintColor = .systemMint
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 55
        imageView.layer.borderColor = CGColor(red: 0.60, green: 0.60, blue: 0.60, alpha: 0.50)
        imageView.layer.borderWidth = 5
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        contentView.backgroundColor = .systemBlue
        contentView.addSubview(myImage)
        contentView.addSubview(myLabel)
//        backgroundView = UIImageView(image: UIImage(named: "bg 4"))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //        myLabel.frame = contentView.bounds
//        myLabel.frame = CGRect(x: 0, y: contentView.frame.size.height-30, width: contentView.frame.size.width, height: 20)
        myLabel.frame = CGRect(x: 0, y: contentView.frame.size.height/2-10, width: contentView.frame.size.width, height: 20)
        //        myImage.frame = contentView.bounds
//        myImage.frame = CGRect(x: 20, y: 10, width: contentView.frame.size.width-40, height: contentView.frame.size.height-40)
        myImage.frame = CGRect(x: 5, y: 5, width: contentView.frame.size.width-10, height: contentView.frame.size.height-10)
    }
    
    
//    func setup(label: String) {
//        myLabel.text = label
//    }
    
    func setup(fruit: ViewController.Fruit) {
        myLabel.text = fruit.title
        myImage.image = fruit.image
    }
    
}
