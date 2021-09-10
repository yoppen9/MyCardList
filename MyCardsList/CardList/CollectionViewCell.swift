//
//  CollectionViewCell.swift
//  MyCardsList
//
//  Created by 山岸善将 on 2021/09/07.
//

import UIKit

protocol CollectionViewCellDelegate: AnyObject {
    func delete(cell: CollectionViewCell)
}

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var CardsImageCell: UIImageView!
    @IBOutlet weak var CardsName: UILabel!
    @IBOutlet weak var CardsTelephoneNumber: UILabel!
    @IBOutlet weak var deleteButtonBackgroundView: UIVisualEffectView!
    
    weak var delegate: CollectionViewCellDelegate?
    
    var isEdithing: Bool = false {
        didSet {
            deleteButtonBackgroundView.isHidden = !isEdithing
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        CardsImageCell.layer.cornerRadius = 12
        deleteButtonBackgroundView.layer.cornerRadius = deleteButtonBackgroundView.bounds.width / 2.0
        deleteButtonBackgroundView.layer.masksToBounds = true
        deleteButtonBackgroundView.isHidden = !isEdithing
    }
    @IBAction func deleteButtonDidTap(_ sender: Any) {
        delegate?.delete(cell: self)
    }
}
