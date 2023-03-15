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
        case second ///fvshbvkdshiudvhiszvhdsou
    }

    struct Fruit: Hashable {
        let title: String
    }

    var fruits = [Fruit]()

    
    
    // MARK: - diff datasources properties
    
    var collecttionDatasource: UICollectionViewDiffableDataSource<Section, Fruit>!
    var tableDatasource: UITableViewDiffableDataSource<Section, Fruit>!

    

    // MARK: - viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "My Fruits"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus.circle"), style: .done, target: self, action: #selector(didTapAdd))
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: segmentControl)
        
        
        //table view viewDidLoad
        if segmentControl.selectedSegmentIndex == 0 {
            tableView.delegate = self
            view.addSubview(tableView)
            tableView.frame = view.bounds

            tableDatasource = UITableViewDiffableDataSource(tableView: tableView, cellProvider: { tableView, indexPath, itemIdentifier in
                let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as! CustomTableViewCell
//                cell.textLabel?.text = itemIdentifier.title
                cell.setup(label: itemIdentifier.title)
                return cell
            })
            
//            loadDatasource()
        }
        
        //collection view viewDidLoad
        if segmentControl.selectedSegmentIndex == 1 {
            collectionView.delegate = self
            view.addSubview(collectionView)
            collectionView.frame = view.bounds

            collectionView.collectionViewLayout = UICollectionViewFlowLayout()


            collecttionDatasource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
    //            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as! CustomCollectionViewCell
    //            cell.contentView.backgroundColor = .systemRed
    //            cell.myLabel.text = itemIdentifier.title
                cell.setup(label: itemIdentifier.title)
                return cell
            })

//            loadDatasource()
        }

    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 120)
    }


    @objc func didTapAdd() {
        let actionSheet = UIAlertController(title: "Select Fruit", message: nil, preferredStyle: .actionSheet)

        for x in 0...100 {
            actionSheet.addAction(UIAlertAction(title: "fruit \(x+1)", style: .default, handler: { [weak self] _ in
                let fruit = Fruit(title: "fruit \(x+1)")
                self?.fruits.append(fruit)
                self?.updateDatasource()
            }))
        }

        actionSheet.addAction(UIAlertAction(title: "cancel", style: .cancel, handler: nil))
        present(actionSheet, animated: true)
    }

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
    
    
    @objc func selectionChanged() {
        switch segmentControl.selectedSegmentIndex {
            case 0:
                tableView.delegate = self
                view.addSubview(tableView)
                tableView.frame = view.bounds

                tableDatasource = UITableViewDiffableDataSource(tableView: tableView, cellProvider: { tableView, indexPath, itemIdentifier in
                    let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as! CustomTableViewCell
                    cell.setup(label: itemIdentifier.title)
                    return cell
                })
                
//                fruits = []
                updateDatasource()
                
                
            case 1:
                collectionView.delegate = self
                view.addSubview(collectionView)
                collectionView.frame = view.bounds

                collectionView.collectionViewLayout = UICollectionViewFlowLayout()

                collecttionDatasource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as! CustomCollectionViewCell
                    cell.setup(label: itemIdentifier.title)
                    return cell
                })
                
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

