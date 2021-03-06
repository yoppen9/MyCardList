//
//  LocalViewController.swift
//  MyCardsList
//
//  Created by 山岸善将 on 2021/07/17.
//

import UIKit

var LocalName: [String] = []
var LocalPhone: [String] = []
var LocalDescription: [String] = []
var LocalPhotos: [Data] = []

class LocalViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionViewFlowLayout: UICollectionViewFlowLayout!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(UserDefaults.standard.array(forKey: "Local1") != nil) {
            LocalName = UserDefaults.standard.array(forKey: "Local1") as! [String]
        }
        if(UserDefaults.standard.array(forKey: "Local2") != nil) {
            LocalPhone = UserDefaults.standard.array(forKey: "Local2") as! [String]
        }
        if(UserDefaults.standard.array(forKey: "Local3") != nil) {
            LocalPhotos = UserDefaults.standard.array(forKey: "Local3") as! [Data]
        }
        if(UserDefaults.standard.array(forKey: "Local4") != nil) {
            LocalDescription = UserDefaults.standard.array(forKey: "Local4") as! [String]
        }
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        collectionView.collectionViewLayout = layout
    }
    @IBAction func settingButton(_ sender: Any) {
        let nextView3 = storyboard?.instantiateViewController(identifier: "next3") as! LocalSettingViewController
        nextView3.presentationController?.delegate = self
        present(nextView3, animated: true, completion: nil)
    }
}

extension LocalViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let nameCell: UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "LocalCell", for: indexPath)
        let label = nameCell.contentView.viewWithTag(1) as! UILabel
        let label2 = nameCell.contentView.viewWithTag(2) as! UILabel
        let image3 = nameCell.contentView.viewWithTag(3) as! UIImageView
        let textView4 = nameCell.contentView.viewWithTag(4) as! UILabel
        label.text = LocalName[indexPath.row]
        label2.text = LocalPhone[indexPath.row]
        image3.image = UIImage(data: LocalPhotos[indexPath.row])
        textView4.text = LocalDescription[indexPath.row]
        return nameCell
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return LocalName.count
    }
}

extension LocalViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let horizontalSpace: CGFloat = 20
        let cellSize: CGFloat = self.view.bounds.width / 3 - horizontalSpace
        let heightSize: CGFloat = cellSize * 1.5
        return CGSize(width: cellSize, height: heightSize)
    }
}

extension LocalViewController: UIAdaptivePresentationControllerDelegate {
    func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
        collectionView.reloadData()
    }
}
