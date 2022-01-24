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
        smallThumbnail.image = UIImage(systemName: "book.fill")
        
       self.titleLabel.text = book.volumeInfo.title ?? "No available"
        self.authorLabel.text = "by \(book.volumeInfo.authors?[0] ?? "")"
        guard  book.volumeInfo.imageLinks.smallThumbnail != nil else { return }
        let url = URL(string: book.volumeInfo.imageLinks.smallThumbnail )
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url!) { data, response, error in
            if error == nil && data != nil {
                let image = UIImage(data: data!)
                DispatchQueue.main.async {
                    self.smallThumbnail.image = image
                    
                }
            }
        }
        dataTask.resume()
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}
