//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Александр Востриков on 06.02.2022.
//

import UIKit

class PhotosViewController: UIViewController {
    
    private let text = "Photo Gallery"
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    private let collectionReuseIdentifier = String(describing: UICollectionViewCell.self)
    var photos: [UIImage] = []
    
    init() {
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        title = text
        //photos = Photos.fetchPhotos()
        setupDelegate()
        setupView()
        self.collectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: collectionReuseIdentifier)
    }
    
}

extension PhotosViewController {
     func setupDelegate(){
        collectionView.dataSource = self
        collectionView.delegate = self
    }
     func setupView() {
        view.addSubview(collectionView)
        collectionView.pin(to: view)
    }
}


extension PhotosViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionReuseIdentifier,
                                                                for: indexPath) as! PhotosCollectionViewCell
        collectionCell.photoImageView.image = photos[indexPath.item]
        return collectionCell
    }
}

extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (Constants.screenWeight / 3) - 12
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
}
