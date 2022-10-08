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
            self.imageImageView.loadImage(from: news?.urlToImage)
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
    func downloadImage(from url: URL, contentMode mode: ContentMode = .scaleAspectFit){
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mineType = response?.mimeType, mineType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
            else{
                DispatchQueue.main.async { [weak self] in
                    self?.image = UIImage(named: "no-image.png")
                }
                return
            }
            DispatchQueue.main.async { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    
    func loadImage(from link: String?, contentMode mode: ContentMode = .scaleAspectFit){
        guard let link = link, let url = URL(string: link) else { return}
        downloadImage(from: url, contentMode: contentMode)
    }
}

extension Date {
    func toString(with formatter: String = "dd/MM/yyy") -> String? {
        let dateFormat = DateFormatter()
        
        if Calendar.current.isDateInToday(self){
            dateFormat.dateFormat = "HH:mm"
            dateFormat.locale = Locale.init(identifier: "pt-br")
            dateFormat.timeZone = TimeZone(abbreviation: "UTC")
            return "Today at \(dateFormat.string(from: self))"
        }
        
        dateFormat.dateFormat = formatter
        return dateFormat.string(from: self)
    }
}
