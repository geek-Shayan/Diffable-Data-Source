//
//  CustomTableViewCell.swift
//  Diffable Data Source
//
//  Created by MD. SHAYANUL HAQ SADI on 15/3/23.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
        
    static let identifier = "CustomTableViewCell"
    
    
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
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 0
//        label.text = "Fruit"
//        label.backgroundColor = .green
        return label
        
    }()
            
            
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        contentView.backgroundColor = .systemBlue
        contentView.addSubview(myImage)
        contentView.addSubview(myLabel)
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func layoutSubviews() {
        super.layoutSubviews()
        
        myLabel.frame = CGRect(x: 20, y: 0, width: contentView.frame.size.width-110, height: contentView.frame.size.height)
        myImage.frame = CGRect(x: contentView.frame.size.width-90, y: 10, width: 80, height: 80)
    }


//    func setup(label: String) {
//        myLabel.text = label
//    }
    
    func setup(fruit: ViewController.Fruit) {
        myLabel.text = fruit.title
        myImage.image = fruit.image
    }
    
    
}
