//
//  PersistenceManager.swift
//  Software Books
//
//  Created by Hivzi on 31.1.22.
//

import Foundation
import CoreData
import UIKit
struct PersistenceManager {

var favoriteBooks = [FavoriteBook]()

let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    mutating  func addBookToFavorites(favorite: InfoBook) {
        
        let newFavoriteBook = FavoriteBook(context: self.context)
        newFavoriteBook.title = favorite.title1
        newFavoriteBook.image = favorite.imageVariable as Data?
        newFavoriteBook.author1 = favorite.author1
        newFavoriteBook.author2 = favorite.author2
        newFavoriteBook.descript = favorite.descript
        newFavoriteBook.pageNumber = Int32(favorite.pageNumber ?? 0)
        newFavoriteBook.publishedDate = favorite.publishedData
        newFavoriteBook.publisher = favorite.publisherName
        
        

        self.favoriteBooks.append(newFavoriteBook)
        self.saveBooks()
    }

    func saveBooks() {
        do {
            try context.save()
        } catch {
            print("error saving context \(error)")
        }
    }
    mutating func loadBooks() -> [FavoriteBook] {
        let request : NSFetchRequest<FavoriteBook > = FavoriteBook.fetchRequest()
        do {
            favoriteBooks = try context.fetch(request)
        } catch {
            print("Error fetching data form context\(error)")
            
        }
      return favoriteBooks
    }
}
