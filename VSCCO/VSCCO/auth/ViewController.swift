//
//  ViewController.swift
//  VSCCO
//
//  Created by Nikko_Cat on 10.04.2021.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var picture: UIImageView!
    
    private var imagePicker:ImagePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imagePicker = ImagePicker(presentationController: self, delegate: self)
    }
    
    @IBAction func editAction(_ sender: Any) {
        let storyboard = UIStoryboard(name:  "Editor", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "Editor") as! EditorViewController
        vc.picture = self.picture.image
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func addAction(_ sender: Any) {
        self.imagePicker.present(from: sender as! UIView)
    }
    

}

extension ViewController:  ImagePickerDelegate {
    func didSelect(image: UIImage?) {
        self.picture.image = image
    }
}

