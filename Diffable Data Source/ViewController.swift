//
//  ViewController.swift
//  Diffable Data Source
//
//  Created by MD. SHAYANUL HAQ SADI on 12/3/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {
    
    let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    
    enum Section {
        case first
    }
    
    struct Fruit: Hashable {
        let title: String
    }
    
    //diff datasource
    var datasource: UITableViewDiffableDataSource<Section, Fruit>!
    
    var fruits = [Fruit]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        view.addSubview(tableView)
        tableView.frame = view.bounds
        
        datasource = UITableViewDiffableDataSource(tableView: tableView, cellProvider: { tableView, indexPath, itemIdentifier in
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = itemIdentifier.title
            return cell
        })
        
        
        title = "my fruits"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus.circle"), style: .done, target: self, action: #selector(didTapAdd))
    }


    @objc func didTapAdd() {
        let actionSheet = UIAlertController(title: "Select Fruit", message: nil, preferredStyle: .actionSheet)
        
        for x in 0...100 {
            actionSheet.addAction(UIAlertAction(title: "fruit\(x+1)", style: .default, handler: { [weak self] _ in
                let fruit = Fruit(title: "fruit\(x+1)")
                self?.fruits.append(fruit)
                self?.updateDatasource()
            }))
        }
        
        actionSheet.addAction(UIAlertAction(title: "cancel", style: .cancel, handler: nil))
        present(actionSheet, animated: true)
    }
    
    
    func updateDatasource() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Fruit>()
        snapshot.appendSections([.first])
        snapshot.appendItems(fruits)
        
        datasource.apply(snapshot)
//        datasource.apply(snapshot, animatingDifferences: true, completion: nil)
    }
}

