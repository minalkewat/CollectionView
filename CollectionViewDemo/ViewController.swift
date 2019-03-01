//
//  ViewController.swift
//  CollectionViewDemo
//
//  Created by Meenal Kewat on 2/27/19.
//  Copyright © 2019 Happykrafts Innovations. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return actressImage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCollectionViewCell
        cell.img.image = actressImage[indexPath.row]
       // cell.lbl.text = actressNames[indexPath.row]
        cell.index = indexPath
        cell.delegate = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
    }
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var imagePicker = UIImagePickerController()
    
    var actressNames = ["Natalie Portman","Scarlett Johansson","Jennifer Lawrence","Emma Stone","Gal Gadot","Alexandra Daddario","Natalie Portman","Scarlett Johansson","Jennifer Lawrence","Emma Stone","Gal Gadot","Alexandra Daddario","Natalie Portman","Scarlett Johansson","Jennifer Lawrence","Emma Stone","Gal Gadot","Alexandra Daddario","Natalie Portman","Scarlett Johansson","Jennifer Lawrence","Emma Stone","Gal Gadot","Alexandra Daddario"]
    
    var actressImage = [UIImage(named: "Natalie Portman"),UIImage(named: "Scarlett Johansson"),UIImage(named: "jennifer"),UIImage(named: "Emma Stone"),UIImage(named: "c"),UIImage(named: "Alexandra Daddario"),UIImage(named: "Natalie Portman"),UIImage(named: "Scarlett Johansson"),UIImage(named: "jennifer"),UIImage(named: "Emma Stone"),UIImage(named: "c"),UIImage(named: "Alexandra Daddario"),UIImage(named: "Natalie Portman"),UIImage(named: "Scarlett Johansson"),UIImage(named: "jennifer"),UIImage(named: "Emma Stone"),UIImage(named: "c"),UIImage(named: "Alexandra Daddario"),UIImage(named: "Natalie Portman"),UIImage(named: "Scarlett Johansson"),UIImage(named: "jennifer"),UIImage(named: "Emma Stone"),UIImage(named: "c"),UIImage(named: "Alexandra Daddario")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
    }
    
    @IBAction func onAddClick(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
    }
    
}

extension ViewController: dataCollectionviewProtocol{
    func showData(indx: Int) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController
      //  vc?.nam = actressNames[indx]
        vc?.imag = actressImage[indx]!
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
    
    func deleteData(indx: Int) {
        actressImage.remove(at: indx)
        collectionView.reloadData()
    }
    
    
}

extension ViewController:UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage{
        actressImage.append(image)
            collectionView.reloadData()
        }
        dismiss(animated: true, completion: nil)
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return  UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bound = collectionView.bounds
        return CGSize(width: bound.width/2 - 20, height: bound.height/3)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
        
    }
}

