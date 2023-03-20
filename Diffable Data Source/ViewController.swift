//
//  ViewController.swift
//  Diffable Data Source
//
//  Created by MD. SHAYANUL HAQ SADI on 12/3/23.
//

import UIKit
import Rudder


class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UITableViewDelegate {
    
    
    
    // MARK: - segmented control properties
    
    let items = ["Table", "Collection"]
    
    lazy var segmentControl: UISegmentedControl = {
        let view = UISegmentedControl(items: items)
        view.selectedSegmentIndex = 0
        view.addTarget(self, action: #selector(selectionChanged), for: .valueChanged)
        return view
    }()
    
    
    
    // MARK: - table view properties
    
    let tableView: UITableView = {
        let table = UITableView()
//        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        return table
    }()
    

        
    // MARK: - collection view properties
    
    let collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        collection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collection.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
 
        return collection
    }()
    
    
    
    // MARK: - properties
    
    enum Section {
        case first
        case second 
    }

    struct Fruit: Hashable {
        let title: String
        let image: UIImage!
    }

    var fruits = [Fruit]()
    
    
    // MARK: - local data

    private let fruitList: [Fruit] = [
        Fruit(title: "Mango", image: UIImage(named: "mango")),
        Fruit(title: "Banana", image: UIImage(named: "banana")),
        Fruit(title: "Orange", image: UIImage(named: "orange")),
        Fruit(title: "Pomegranad", image: UIImage(named: "pomegranad")),
        Fruit(title: "Cherry", image: UIImage(named: "cherry")),
        Fruit(title: "Kiwi", image: UIImage(named: "kiwi")),
        Fruit(title: "Apple", image: UIImage(named: "apple")),
        Fruit(title: "Pineapple", image: UIImage(named: "pineapple")),
        Fruit(title: "Mango 1", image: UIImage(named: "mango")),
        Fruit(title: "Banana 1", image: UIImage(named: "banana")),
        Fruit(title: "Orange 1", image: UIImage(named: "orange")),
        Fruit(title: "Pomegranad 1", image: UIImage(named: "pomegranad")),
        Fruit(title: "Cherry 1", image: UIImage(named: "cherry")),
        Fruit(title: "Kiwi 1", image: UIImage(named: "kiwi")),
        Fruit(title: "Apple 1", image: UIImage(named: "apple")),
        Fruit(title: "Pineapple 1", image: UIImage(named: "pineapple")),
        Fruit(title: "Mango 2", image: UIImage(named: "mango")),
        Fruit(title: "Banana 2", image: UIImage(named: "banana")),
        Fruit(title: "Orange 2", image: UIImage(named: "orange")),
        Fruit(title: "Pomegranad 2", image: UIImage(named: "pomegranad")),
        Fruit(title: "Cherry 3", image: UIImage(named: "cherry")),
        Fruit(title: "Kiwi 3", image: UIImage(named: "kiwi")),
        Fruit(title: "Apple 3", image: UIImage(named: "apple")),
        Fruit(title: "Pineapple 3", image: UIImage(named: "pineapple")),

    ]


    
    
    // MARK: - diff datasources properties
    
    var collecttionDatasource: UICollectionViewDiffableDataSource<Section, Fruit>!
    var tableDatasource: UITableViewDiffableDataSource<Section, Fruit>!

    

    // MARK: - viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "My Fruits"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus.circle"), style: .done, target: self, action: #selector(didTapAdd))
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: segmentControl)
        
//        view.addSubview(UIImageView(image: UIImage(named: "bg")))
        
        
        
        // MARK: - rudder stack track
        RSClient.sharedInstance().track("viewDidLoad_sadi", properties: [
            "viewDidLoad": "true",
            "selectedSegmentIndex": segmentControl.selectedSegmentIndex,
            "fruit": fruits
        ])
        
        
        // MARK: - table view viewDidLoad
        
        if segmentControl.selectedSegmentIndex == 0 {
            
            tableViewDidLoad()
//            loadDatasource()
        }
        
        
        // MARK: - collection view viewDidLoad
        
        if segmentControl.selectedSegmentIndex == 1 {
            
            collectionViewDidLoad()
//            loadDatasource()
        }

    }
    
    
    
    // MARK: - table view functions

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(100)
    }
    
    
    // MARK: - collection view functions
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 120)
    }

    
    
    // MARK: - datasource management

    func loadDatasource() {
        var initialSnapshot = NSDiffableDataSourceSnapshot<Section, Fruit>()
        initialSnapshot.appendSections([.first])
        
        if segmentControl.selectedSegmentIndex == 0 {
            tableDatasource.apply(initialSnapshot, animatingDifferences: true
            )
        }
        if segmentControl.selectedSegmentIndex == 1 {
            collecttionDatasource.apply(initialSnapshot, animatingDifferences: true)
        }
    }

    
    func updateDatasource() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Fruit>()
        snapshot.appendSections([.first])
        snapshot.appendItems(fruits)

        if segmentControl.selectedSegmentIndex == 0 {
//            tableDatasource.apply(snapshot)
            tableDatasource.apply(snapshot, animatingDifferences: true)
        }
        if segmentControl.selectedSegmentIndex == 1 {
//            collecttionDatasource.apply(snapshot)
            collecttionDatasource.apply(snapshot, animatingDifferences: true)
        }
        
     }
    
    
    
    // MARK: - viewDidLoad refactoring
    
    func tableViewDidLoad() {
        tableView.delegate = self
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.backgroundView = UIImageView(image: UIImage(named: "bg 4"))
        tableView.backgroundColor = .clear

        tableDatasource = UITableViewDiffableDataSource(tableView: tableView, cellProvider: { tableView, indexPath, itemIdentifier in
            let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as! CustomTableViewCell
//                cell.textLabel?.text = itemIdentifier.title
//                cell.setup(label: itemIdentifier.title)
//                cell.contentView.alpha = 0.4
//            cell.backgroundView = UIImageView(image: UIImage(named: "bg 4"))
            cell.setup(fruit: itemIdentifier)
            return cell
        })
    }
    
    
    func collectionViewDidLoad() {
        collectionView.delegate = self
        view.addSubview(collectionView)
        collectionView.frame = view.bounds
        collectionView.backgroundView = UIImageView(image: UIImage(named: "bg 4"))
        collectionView.backgroundColor = .clear

        collectionView.collectionViewLayout = UICollectionViewFlowLayout()

        collecttionDatasource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as! CustomCollectionViewCell
//            cell.contentView.backgroundColor = .systemRed
//            cell.myLabel.text = itemIdentifier.title
//            cell.setup(label: itemIdentifier.title)
//            cell.backgroundView = UIImageView(image: UIImage(named: "bg 4"))
            cell.setup(fruit: itemIdentifier)
            return cell
        })
    }
    
    
    // MARK: - clearing previous loaded views
    
    func removeSubviews() {
        tableView.removeFromSuperview()
        collectionView.removeFromSuperview()
    }
    
    
    
    // MARK: - add fruits

    @objc func didTapAdd() {
        
        // MARK: - rudder stack track
        RSClient.sharedInstance().track("didTapAdd_sadi", properties: [
            "actionSheet": "open"
        ])
        
        
        let actionSheet = UIAlertController(title: "Select Fruit", message: nil, preferredStyle: .actionSheet)

        // MARK: - randomly generated data with matching item error handeling
//        for x in 1...50 {
//            actionSheet.addAction(UIAlertAction(title: "fruit \(x)", style: .default, handler: { [weak self] _ in
//                let fruit = Fruit(title: "fruit \(x)", image: UIImage(systemName: "\(x).circle"))
//
//                // matching error handling
//                let matching = self?.fruits.contains(where: { $0.title == "fruit \(x)" }) // Returns true
//
//                if (matching) == true {
//                    let alert = UIAlertController(title: "Error!", message: "Unique selection required.", preferredStyle: .alert)
//                    alert.addAction(UIAlertAction(title: "cancel", style: .destructive))
//                    self?.present(alert, animated: true)
//                }
//
//                if (matching) == false {
//                    self?.fruits.append(fruit)
//                    self?.updateDatasource()
//                }
//
//            }))
//        }
        // MARK: - randomly generated data with matching item error handeling
        
        
        // MARK: - pre generated data with dynamic selection item handeling
        for x in fruitList {
            let matching = self.fruits.contains(where: { $0.title == x.title && $0.image == x.image})
            if (matching) {
                continue
            }
            else {
                actionSheet.addAction(UIAlertAction(title: x.title, style: .default, handler: { [weak self] _ in
                    let fruit = Fruit(title: x.title, image: x.image)
                    self?.fruits.append(fruit)
                    self?.updateDatasource()
                }))
            }
        }
        // MARK: - pre generated data with dynamic selection item handeling

        actionSheet.addAction(UIAlertAction(title: "cancel", style: .cancel, handler: nil))
        present(actionSheet, animated: true)
    }
    
        
    
    // MARK: - selection changing
    
    @objc func selectionChanged() {
        
        // MARK: - rudder stack track
        RSClient.sharedInstance().track("selectionChanged_sadi", properties: [
            "viewDidLoad": "1",
            "selectedSegmentIndex": segmentControl.selectedSegmentIndex,
            "fruits": fruits
        ])
        
        switch segmentControl.selectedSegmentIndex {
            case 0:
                removeSubviews()
                
                tableViewDidLoad()
//                fruits = []
                updateDatasource()
    
            case 1:
                removeSubviews()
                
                collectionViewDidLoad()
//                fruits = []
                updateDatasource()

            default:
                print("232213")
        }
    }



    
//
//
//            //tableview
//            let tableView: UITableView = {
//                let table = UITableView()
//                table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
//                return table
//            }()
//
//
//            enum Section {
//                case first
//            }
//
//            struct Fruit: Hashable {
//                let title: String
//            }
//
//            //diff datasource
//            var datasource: UITableViewDiffableDataSource<Section, Fruit>!
//
//            var fruits = [Fruit]()
//
//
//            override func viewDidLoad() {
//                super.viewDidLoad()
//
//                // rudder track
//                RSClient.sharedInstance().track("test_user_id_sadi", properties: [
//                    "key_1": "value_1",
//                    "key_2": "value_2"
//                ])
//
//
//                tableView.delegate = self
//                view.addSubview(tableView)
//                tableView.frame = view.bounds
//
//                datasource = UITableViewDiffableDataSource(tableView: tableView, cellProvider: { tableView, indexPath, itemIdentifier in
//                    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//                    cell.textLabel?.text = itemIdentifier.title
//                    return cell
//                })
//
//
//                title = "my fruits"
//                navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus.circle"), style: .done, target: self, action: #selector(didTapAdd))
//            }
//
//
//            @objc func didTapAdd() {
//                let actionSheet = UIAlertController(title: "Select Fruit", message: nil, preferredStyle: .actionSheet)
//
//                for x in 0...100 {
//                    actionSheet.addAction(UIAlertAction(title: "fruit \(x+1)", style: .default, handler: { [weak self] _ in
//                        let fruit = Fruit(title: "fruit \(x+1)")
//                        self?.fruits.append(fruit)
//                        self?.updateDatasource()
//                    }))
//                }
//
//                actionSheet.addAction(UIAlertAction(title: "cancel", style: .cancel, handler: nil))
//                present(actionSheet, animated: true)
//            }
//
//
//            func updateDatasource() {
//                var snapshot = NSDiffableDataSourceSnapshot<Section, Fruit>()
//                snapshot.appendSections([.first])
//                snapshot.appendItems(fruits)
//
//                datasource.apply(snapshot)
//            //        datasource.apply(snapshot, animatingDifferences: true, completion: nil)
//             }
//

    
    
}

