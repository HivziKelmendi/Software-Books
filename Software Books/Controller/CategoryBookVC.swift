//
//  ViewController.swift
//  Software Books
//
//  Created by Hivzi on 5.1.22.
//

import UIKit

class CategoryBookVC: UIViewController {
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    var categories: [CategoryBook] = [
             CategoryBook(imageCategory: "swift-og", nameCategory: "iOS&Swift"),
             CategoryBook(imageCategory: "objective-c", nameCategory: "Objective-C"),
             CategoryBook(imageCategory: "Java", nameCategory: "java"),
             CategoryBook(imageCategory: "python", nameCategory: "python"),
             CategoryBook(imageCategory: "javascript", nameCategory: "javascript"),
             CategoryBook(imageCategory: "Kotlin", nameCategory: "Kotlin"),
             CategoryBook(imageCategory: "r", nameCategory: "R"),
             CategoryBook(imageCategory: "go", nameCategory: "Go"),
             CategoryBook(imageCategory: "c++", nameCategory: "C++"),
             CategoryBook(imageCategory: "c#", nameCategory: "C#"),
             CategoryBook(imageCategory: "html", nameCategory: "HTML"),
             CategoryBook(imageCategory: "css", nameCategory: "CSS"),
             
        ]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        let layout = UICollectionViewFlowLayout()
                layout.itemSize = CGSize(width: 120, height: 120)
                categoryCollectionView.collectionViewLayout = layout
        categoryCollectionView.register(UINib(nibName: "CategoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ReusableCategoryCell")
        
    }


}

extension CategoryBookVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ReusableCategoryCell", for: indexPath) as! CategoryCollectionViewCell
        cell.label.text = categories[indexPath.row].nameCategory
        cell.imageView.image = UIImage(named: categories[indexPath.row].imageCategory)
        return cell
    }
}
    
extension CategoryBookVC: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToBookList", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! BookListVC
        if let indexPaths = categoryCollectionView!.indexPathsForSelectedItems {
        let indexPath = indexPaths[0]
            destinationVC.selectedCategory = categories[indexPath.row].nameCategory
        }
              

          
       }
    }



extension CategoryBookVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 120)
    }
    
}



