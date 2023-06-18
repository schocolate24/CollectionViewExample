//
//  ViewController.swift
//  CollectionViewDemo
//
//  Created by Shoko Nakaki on 2023/06/13.
//

import UIKit


class FavoriteTableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var favoriteMockData = [Article]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: String(describing: FavoriteTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: FavoriteTableViewCell.self))
        tableView.delegate = self
        tableView.dataSource = self
        NotificationCenter.default.addObserver(self, selector: #selector(favoriteButtonTapped), name: .favNotification, object: nil)
        navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func toCollectionViewTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: String(describing: ThumbnailCollectionViewController.self), bundle: nil)
        let thumbnailCollectionVC = storyboard.instantiateViewController(withIdentifier: "ThumbnailCollectionViewController") as! ThumbnailCollectionViewController
        self.navigationController?.pushViewController(thumbnailCollectionVC, animated: true)
        
//        thumbnailCollectionVC.modalPresentationStyle = .fullScreen
//        self.present(thumbnailCollectionVC, animated: true)
        
//        thumbnailCollectionVC.delegate = self
    
//        thumbnailCollectionVC.handler = { [weak self] article in
//            self?.favoriteMockData.append(article)
//            self?.tableView.reloadData()
//        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: .favNotification, object: nil)
    }
    
    @objc
    func favoriteButtonTapped(notification: Notification) {
        if let article = notification.object as? Article {
            favoriteMockData.append(article)
            tableView.reloadData()
        }
    }
}

extension FavoriteTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
}

extension FavoriteTableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteMockData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FavoriteTableViewCell.self), for: indexPath) as! FavoriteTableViewCell

        cell.article = favoriteMockData[indexPath.row]
        
        
        return cell
    }
}

//extension FavoriteTableViewController: ThumbnailCollectionViewControllerDelegate {
//    func favoriteButtonTapped(article: Article) {
//        favoriteMockData.append(article)
//        tableView.reloadData()
//    }
//}
