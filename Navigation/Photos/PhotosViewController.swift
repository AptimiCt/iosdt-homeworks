//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Александр Востриков on 06.02.2022.
//

import UIKit
import iOSIntPackage

class PhotosViewController: UIViewController {
    
    //MARK: - vars
    private let text = "Photo Gallery"
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    private var imagePublisherFacade: ImagePublisherFacade?
    private var photos: [UIImage] = []
    
    //MARK: - init
    init() {
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - override func
    override func viewDidLoad() {
        super.viewDidLoad()
        title = text
        imagePublisherFacade = ImagePublisherFacade()
        let userImages = Photos.fetchPhotos()
        for qos in 0...4 {
            imageProcessingInThread(userImages, qos)
        }
        imagePublisherFacade?.addImagesWithTimer(time: 1, repeat: 20, userImages: userImages)
        setupDelegate()
        setupView()
        self.collectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: Cells.cellForCollection)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
        imagePublisherFacade?.subscribe(self)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
        imagePublisherFacade?.removeSubscription(for: self)
        imagePublisherFacade?.rechargeImageLibrary()
    }
}

//MARK: - extension
extension PhotosViewController {
    private func setupDelegate(){
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    private func setupView() {
        view.addSubview(collectionView)
        collectionView.pin(to: view)
    }
    
    
    private func imageProcessingInThread(_ userImages: [UIImage], _ qos: Int) {
        switch qos {
        case 0:
            ImageProcessor().processImagesOnThread(sourceImages: userImages, filter: .allCases[qos], qos: .userInteractive) { _ in
            }
        case 1:
            ImageProcessor().processImagesOnThread(sourceImages: userImages, filter: .allCases[qos], qos: .userInitiated) { _ in
            }
        case 2:
            ImageProcessor().processImagesOnThread(sourceImages: userImages, filter: .allCases[qos], qos: .utility) { _ in
            }
        case 3:
            ImageProcessor().processImagesOnThread(sourceImages: userImages, filter: .allCases[qos], qos: .background) { _ in
            }
        case 4:
            ImageProcessor().processImagesOnThread(sourceImages: userImages, filter: .allCases[qos], qos: .default) { _ in
            }
        default:
            break
        }
    }
}

extension PhotosViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: Cells.cellForCollection,
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

extension PhotosViewController: ImageLibrarySubscriber {
    func receive(images: [UIImage]) {
        photos = images
        collectionView.reloadData()
    }
}
