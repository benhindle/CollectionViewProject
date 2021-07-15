//
//  SecondViewController.swift
//  CollectionViewProject
//
//  Created by Ben Hindle on 15/7/21.
//

import UIKit

class SecondViewController: UIViewController {

    private var collectionView: UICollectionView! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray
        setCollectionViewConstraints()
        
    }

    func setCollectionViewConstraints() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: SecondViewController.createCollectionViewLayout())
        collectionView.dataSource = self
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        view.addSubview(collectionView)
    }
    
    
    static func createCollectionViewLayout() -> UICollectionViewCompositionalLayout {
        let contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16)
        
        // Items
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .absolute(40))
        )
        
        // Groups
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .estimated(200)), //estimated 80
            subitems: [item]
        )
        
        // Sections
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = contentInsets

        // Return
        let layout = UICollectionViewCompositionalLayout {
            sectionIndex, layoutEnvironment in
            return section
        }
        
        let collectionViewConfiguration = UICollectionViewCompositionalLayoutConfiguration()
        collectionViewConfiguration.interSectionSpacing = 16
        layout.configuration = collectionViewConfiguration
        return layout
    }
}

extension SecondViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        50
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        cell.backgroundColor = .systemPink
        cell.backgroundColor = .systemBlue
        return cell
    }
    
    
}

