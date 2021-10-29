//
//  ViewController.swift
//  Multithreading-GCD2
//
//  Created by ruslan on 29.10.2021.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button.isHidden = true
        button.layer.cornerRadius = 15
        afterBlock(seconds: 2, queue: .main) {
            print(Thread.current)
            self.alertAction()
            self.button.isHidden = false
        }
    }
    
    private func afterBlock(seconds: Int, queue: DispatchQueue = .global(), completion: @escaping () -> Void) {
        queue.asyncAfter(deadline: .now() + .seconds(seconds)) {
            completion()
        }
    }
    
    private func alertAction() {
        let alertController = UIAlertController(title: "Button is presented!", message: nil, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alertController.addAction(okButton)
        present(alertController, animated: true, completion: nil)
    }
}

