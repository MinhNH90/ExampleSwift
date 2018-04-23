//
//  MainViewController.swift
//  AlertControllerExample
//
//  Created by Nguyen Huu Minh on 4/20/18.
//  Copyright © 2018 Steadfast. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var btnChooseImageSource: UIButton?
    @IBOutlet weak var imageView: UIImageView?
    
    var alertController: UIAlertController?
    var pickerController: UIImagePickerController?
    
    @IBAction func btnChooseImageSource(sender: UIButton) {
        /*
        alertController = UIAlertController(title: "Alert", message: "Are you sure ?", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive) {
            (action) in
            print("Press cancel")
        }
        let okAction = UIAlertAction(title: "OK", style: .default) {
            (action) in
            print("Press OK")
        }
        
        alertController?.addAction(cancelAction)
        alertController?.addAction(okAction)
        self.present(alertController!, animated: true) {
            print("presented")
        }
        */
        
        alertController = UIAlertController(title: "Take image", message: "Choose image source", preferredStyle: .actionSheet)
        let cameraAction = UIAlertAction(title: "Camera", style: .default) { (action) in
            print("You choose Camera")
            self.openCamera()
        }
        let photoAction = UIAlertAction(title: "Your photos", style: .default) { (action) in
            print("You choose Photo")
            self.openPhoto()
        }
        alertController?.addAction(cameraAction)
        alertController?.addAction(photoAction)
        alertController?.view.tintColor = UIColor.magenta
        self.present(alertController!, animated: true) {
            print("presented")
        }
    }
    
    func openCamera() {
        pickerController = UIImagePickerController()
//        if (UIImagePickerController.isSourceTypeAvailable(.camera) == false) {
//            return
//        }
        pickerController?.delegate = self
        pickerController?.allowsEditing = true
        pickerController?.sourceType = .photoLibrary
        self.present(pickerController!, animated: true) {
            print("presented Camera")
        }
    }
    
    func openPhoto() {
        pickerController = UIImagePickerController()
        pickerController?.delegate = self
        pickerController?.allowsEditing = true
        pickerController?.sourceType = .photoLibrary
        self.present(pickerController!, animated: true, completion: nil)
    }
    
    //MARK - UInavigationControllerDelegate
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let chosenImage: UIImage = info[UIImagePickerControllerEditedImage] as! UIImage
        picker.dismiss(animated: true, completion: {
            let activityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
            activityIndicatorView.color = UIColor.blue
            self.view.addSubview(activityIndicatorView)
            activityIndicatorView.frame = self.view.frame
            activityIndicatorView.center = self.view.center
            activityIndicatorView.startAnimating()
            DispatchQueue.global().async {
                // Do some heavy tasks
                for index in 1...900000 {
                    print(index)
                }
                // After finishing heavy tasks, stop animationing and load image
                DispatchQueue.main.async {
                    self.imageView?.image = chosenImage
                    activityIndicatorView.stopAnimating()
                }
            }
        })
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.verifyInformation()
    }
    func verifyInformation() {
        alertController = UIAlertController(title: "Verification", message: "Enter email or password", preferredStyle: .alert)
        alertController?.addTextField(configurationHandler: { (textField) in
            textField.placeholder = "Enter email"
            textField.keyboardType = .emailAddress
        })
        alertController?.addTextField(configurationHandler: { (textField) in
            textField.placeholder = "Enter password"
            textField.isSecureTextEntry = true
        })
        let okAction = UIAlertAction(title: "OK", style: .default) { (alert) in
            let textFieldEmail = self.alertController!.textFields![0] as UITextField
            let textFieldPassword = self.alertController!.textFields![1] as UITextField
            if (textFieldEmail.text != "nguyenminh1190@gmail.com" || textFieldPassword.text != "123456") {
                self.verifyInformation()
            }
        }
        alertController?.addAction(okAction)
        self.present(alertController!, animated: true, completion: nil)
    }
}
