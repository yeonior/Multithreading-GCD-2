//
//  ViewController.swift
//  Multithreading-GCD2
//
//  Created by ruslan on 29.10.2021.
//

import UIKit

final class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        afterBlock(seconds: 2, queue: .main) {
            print(Thread.current)
            self.alertAction()
        }
    }
    
    private func afterBlock(seconds: Int, queue: DispatchQueue = .global(), completion: @escaping () -> Void) {
        queue.asyncAfter(deadline: .now() + .seconds(seconds)) {
            completion()
        }
    }
    
    private func alertAction() {
        let alertController = UIAlertController(title: "Done!", message: nil, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alertController.addAction(okButton)
        present(alertController, animated: true, completion: nil)
    }
}

