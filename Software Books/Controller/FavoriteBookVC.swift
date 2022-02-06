//
//  FavoriteBookVC.swift
//  Software Books
//
//  Created by Hivzi on 1.2.22.
//

import UIKit
import CoreData

class FavoriteBookVC: UITableViewController {
    var favorites = [FavoriteBook]()
   var persistence = PersistenceManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "FavoriteBookCell", bundle: nil),        forCellReuseIdentifier: "ReusableFavoriteBookCell")
       
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getFavoriteBook()
        tableView.reloadData()
    }
    
    func getFavoriteBook() {
      favorites =  persistence.loadBooks()
    }
    // MARK: - Table view data source

    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favorites.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableFavoriteBookCell", for: indexPath) as! FavoriteBookCell
        cell.favoriteTitle.text = favorites[indexPath.row].title
        cell.favoriteAuthor.text = "by: \(favorites[indexPath.row].author1 ?? "") \(favorites[indexPath.row].author2 ?? "")"
        
        if let photoData = favorites[indexPath.row].image as Data? {
            cell.favImage.image = UIImage(data: photoData)
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToBookInfo1", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! BookInfoVC
        
        if let indexPath = tableView.indexPathForSelectedRow {

            destinationVC.title1 = favorites[indexPath.row].title
            destinationVC.author1 = favorites[indexPath.row].author1 ?? "No author"
            destinationVC.author2 = favorites[indexPath.row].author2 ?? ""
            destinationVC.publisherName = favorites[indexPath.row].publisher
            destinationVC.publishedData = favorites[indexPath.row].publishedDate
            destinationVC.pageNumber = Int(favorites[indexPath.row].pageNumber)
            destinationVC.descript = favorites[indexPath.row].descript
            if let photoData = favorites[indexPath.row].image as Data? {
                destinationVC.imageVariable = UIImage(data: photoData)
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else {return}
        persistence.context.delete(favorites[indexPath.row])
        favorites.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .left)
        
        persistence.saveBooks()
        tableView.reloadData()
    }
    
    // MARK: - Table view delegate

   override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var cellHeight:CGFloat = CGFloat()
        cellHeight = 116
       
        return cellHeight
    }
}
