//
//  CustomCollectionViewCell.swift
//  CollectionViewDemo
//
//  Created by Meenal Kewat on 2/27/19.
//  Copyright © 2019 Happykrafts Innovations. All rights reserved.
//

import UIKit


protocol dataCollectionviewProtocol {
    func showData(indx:Int)
    func deleteData(indx:Int)
}

class CustomCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var showBtn: UIButton!
    @IBOutlet weak var deleteBtn: UIButton!
    
    var delegate: dataCollectionviewProtocol?
    var index: IndexPath?
    
    @IBAction func onShow(_ sender: Any) {
        delegate?.showData(indx: (index?.row)!)
    }
    
    @IBAction func onClick(_ sender: Any) {
        delegate?.deleteData(indx: (index?.row)!)
    }
}
