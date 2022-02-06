//
//  FavoriteBookCell.swift
//  Software Books
//
//  Created by Hivzi on 1.2.22.
//

import UIKit

class FavoriteBookCell: UITableViewCell {

   
    
    @IBOutlet weak var favImage: UIImageView!
    
    @IBOutlet weak var favoriteTitle: UILabel!
    
    @IBOutlet weak var favoriteAuthor: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
