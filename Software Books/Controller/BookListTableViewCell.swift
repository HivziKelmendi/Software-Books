//
//  BookListTableViewCell.swift
//  Software Books
//
//  Created by Hivzi on 5.1.22.
//

import UIKit

class BookListTableViewCell: UITableViewCell {
     
    
    @IBOutlet weak var smallThumbnail: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func updateCell(from book: Item) {

       self.titleLabel.text = book.volumeInfo.title ?? "No available"
        self.authorLabel.text = "by \(book.volumeInfo.authors?[0] ?? "")"
        if let safeUrl =   book.volumeInfo.imageLinks?.smallThumbnail {
        let url = URL(string: safeUrl)
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url!) { data, response, error in
            if error == nil && data != nil {
                let image = UIImage(data: data!)
                DispatchQueue.main.async {
                    self.smallThumbnail.image = image
                    
                }
            } else {
                self.smallThumbnail.image = UIImage(systemName: "book.fill")
            }
            
        }
        dataTask.resume()
        }
        }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}
        
