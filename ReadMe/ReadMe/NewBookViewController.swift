//
//  NewBookViewController.swift
//  ReadMe
//
//  Created by Himanshu Rajput on 17/08/20.
//  Copyright © 2020 Himanshu . All rights reserved.
//

import UIKit

class NewBookViewController: UITableViewController {
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var authorTextField: UITextField!
    @IBOutlet var bookImageView: UIImageView!
    
    var newBookImage: UIImage?
    
    @IBAction func cancel() {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func saveNewBook() {
        guard let title = titleTextField.text,
            let author = authorTextField.text,
            !title.isEmpty,
            !author.isEmpty else { return }
        
        Library.addNew(book: Book(title: title, author: author, readMe: true, image: newBookImage))
        navigationController?.popViewController(animated: true)
    }
        
    @IBAction func updateImage() {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = UIImagePickerController.isSourceTypeAvailable(.camera) ? .camera : .photoLibrary
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bookImageView.layer.cornerRadius = 16
    }
}


extension NewBookViewController: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.editedImage] as? UIImage else { return }
        bookImageView.image = selectedImage
        newBookImage = selectedImage
        dismiss(animated: true, completion: nil)
    }
}

extension NewBookViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == titleTextField {
            return authorTextField.becomeFirstResponder()
        } else {
            return textField.resignFirstResponder()
        }
    }
}
