//
//  CollectionViewCell.swift
//  CollectionViewDemo
//
//  Created by Shoko Nakaki on 2023/06/13.
//

import UIKit

//protocol FavoriteSelectionCellDelegate: AnyObject {
//    func favoriteButtonTapped(article: Article)
//}

class SlotCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subtitle: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var favoriteButton: UIButton!
//    weak var delegate: FavoriteSelectionCellDelegate?
    var handler: ((Article)-> Void)?
    var article: Article? {
        didSet {
            guard let article else { return }
            setupCell(article: article)
        }
    }
    
    var favorite = false {
        didSet {
            if favorite {
                favoriteButton.setBackgroundImage(UIImage(named: "favoriteOn"), for: .normal)
            } else {
                favoriteButton.setBackgroundImage(UIImage(named: "favoriteOff"), for: .normal)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    @IBAction func favoriteButtonTapped(_ sender: Any) {
        favorite.toggle()
//        handler?(Article(thumbnail: "", title: title.text!, subtitle: subtitle.text!, date: Date.now))
//        delegate?.favoriteButtonTapped(article: Article(thumbnail: "", title: title.text!, subtitle: title.text!, date: Date.now))
        article?.date = Date.now
        NotificationCenter.default.post(name: .favNotification, object: article)
    }
    
    private func setupCell(article: Article) {
        let formatter = DateFormatter()
        
        title.text = article.title
        subtitle.text = article.subtitle
        thumbnail.image = UIImage(named: article.thumbnail)
        self.date.text = formatter.formatDate(date: article.date)
    }
}


extension Notification.Name {
    static let favNotification = Notification.Name("favButtonTapped")
}
