//
//  NewsTableViewCell.swift
//  iNews
//
//  Created by Anderson Sales on 24/08/22.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var sourceNameLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var imageImageView: UIImageView!
    @IBOutlet weak var publishedLabel: UILabel!
    @IBOutlet weak var linkImageView: UIImageView!
    
    
    public var news: NewsModel? {
        didSet {
            self.sourceNameLabel.text = news?.source.name
            self.authorLabel.text = news?.author
            self.titleLabel.text = news?.title
            self.descriptionLabel.text = news?.description
            self.imageImageView.loadImage()
            self.publishedLabel.text = news?.publishedAt?.toString()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension UIImageView {
    func loadImage(){
        self.image = UIImage(named: "no-image.png")
    }
}

extension Date {
    func toString(with formatter: String = "dd/MM/yyy") -> String? {
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = formatter
        return dateFormat.string(from: self)
    }
}
