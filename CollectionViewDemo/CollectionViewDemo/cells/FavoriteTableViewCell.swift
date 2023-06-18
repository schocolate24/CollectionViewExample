//
//  TableViewCell.swift
//  CollectionViewDemo
//
//  Created by Shoko Nakaki on 2023/06/13.
//

import UIKit

class FavoriteTableViewCell: UITableViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subtitle: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var thumbnail: UIImageView!
    var article: Article? {
        didSet {
            guard let article else { return }
            setupCell(article: article)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func setupCell(article: Article) {
        let formatter = DateFormatter()

        title.text = article.title
        subtitle.text = article.subtitle
        self.date.text = formatter.formatDate(date: article.date)
        thumbnail.image = UIImage(named: article.thumbnail)
    }
}
