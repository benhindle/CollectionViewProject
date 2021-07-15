//
//  ViewController.swift
//  CollectionViewProject
//
//  Created by Ben Hindle on 15/7/21.
//

import UIKit

class ViewController: UIViewController {

    private var collectionView: UICollectionView! = nil
    let secondViewController = SecondViewController()
    
    let button: UIButton = {
        let button = UIButton()
        button.setTitle("Tap here", for: .normal)
        button.backgroundColor = .darkGray
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray
        configButtonLayout()
    }
    
    func configButtonLayout() {
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        button.heightAnchor.constraint(equalToConstant: 100).isActive = true
        button.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    @objc func buttonTapped() {
        let navigationWrapper = UINavigationController(rootViewController: secondViewController)
        self.navigationController?.present(navigationWrapper, animated: true)
    }

}

