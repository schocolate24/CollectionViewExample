//
//  ThumbnailCollectionViewCell.swift
//  CollectionViewDemo
//
//  Created by Shoko Nakaki on 2023/06/13.
//

import UIKit

//protocol ThumbnailCollectionViewControllerDelegate: AnyObject {
//    func favoriteButtonTapped(article: Article)
//}


class ThumbnailCollectionViewController: UIViewController {
  
    @IBOutlet weak var collection: UICollectionView!
//    weak var delegate: ThumbnailCollectionViewControllerDelegate?
//    var handler: ((Article)-> Void)?
    @IBOutlet weak var countLabel: UILabel!
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpcollectionView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let indexPath = IndexPath(row: 6, section: 0)
        collection.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
    }
    
    @IBAction func backToFavoriteTableView(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
   
    private func setUpcollectionView() {
        let layout = UICollectionViewFlowLayout()
        collection.delegate = self
        collection.dataSource = self
        collection.register(UINib(nibName: String(describing: SlotCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: "customCell")
        layout.scrollDirection = .horizontal
        collection.collectionViewLayout = layout
    }
}


extension ThumbnailCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let margin: CGFloat = 18
//        let cellWidth: CGFloat = UIScreen.main.bounds.width / 2 - margin
//        return CGSize(width: cellWidth, height: cellWidth)
        return CGSize(width: 150, height: 150)
    }
    
    // 指定されたセクションのコンテンツに適用する余白をデリゲートに要求します。
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
    }
    
    // デリゲートに、セクションの連続した行または列間の間隔を尋ねます。
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        12
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        counter += 1
        countLabel.text = String(counter)
    }
}

extension ThumbnailCollectionViewController: UICollectionViewDataSource {
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return MockData.mockData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let slotCell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath) as! SlotCollectionViewCell
//        slotCell.delegate = self
        slotCell.article = MockData.mockData[indexPath.row]
        
//        slotCell.handler = { [weak self] article in
//            self?.delegate?.favoriteButtonTapped(article: article)
//            self?.handler?(article)
//        }
        return slotCell
    }
}

//
//extension ThumbnailCollectionViewController: FavoriteSelectionCellDelegate {
//    func favoriteButtonTapped(article: Article) {
//        delegate?.favoriteButtonTapped(article: article)
//    }
//}
