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
//        imageView.image = UIImage(named: "bg")
//        imageView.backgroundColor = .systemRed
        imageView.tintColor = .systemMint
        return imageView
    }()
    
    private let myLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemMint
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 0
//        label.text = "Fruit"
//        label.backgroundColor = .green
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        contentView.backgroundColor = .systemBlue
        contentView.addSubview(myImage)
        contentView.addSubview(myLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //        myLabel.frame = contentView.bounds
        myLabel.frame = CGRect(x: 0, y: contentView.frame.size.height-30, width: contentView.frame.size.width, height: 20)
        //        myImage.frame = contentView.bounds
        myImage.frame = CGRect(x: 20, y: 0, width: contentView.frame.size.width-40, height: contentView.frame.size.height-40)
    }
    
    
//    func setup(label: String) {
//        myLabel.text = label
//    }
    
    func setup(fruit: ViewController.Fruit) {
        myLabel.text = fruit.title
        myImage.image = fruit.image
    }
    
}
