//
//  ModeSelectView.swift
//  Ballerina
//
//  Created by Carolina Ortega on 17/07/21.
//


import UIKit

struct PassosData {
    var tag: Int
    var image: String
    var title: String
    var description: String
}

class PassosView: UIView {

    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 50, bottom: 0, right: 50)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(PassosCell.self, forCellWithReuseIdentifier: "cell")
        return cv
    }()
 
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        backgroundColor = .systemBackground
        addSubview(collectionView)

        
        // Config Collection View
        
        collectionView.backgroundColor = .clear
       

        
    }
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        let collectionViewConstraints: [NSLayoutConstraint] = [
            collectionView.topAnchor.constraint(equalTo: topAnchor, constant: 160),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            collectionView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ]
        NSLayoutConstraint.activate(collectionViewConstraints)
    }
}
