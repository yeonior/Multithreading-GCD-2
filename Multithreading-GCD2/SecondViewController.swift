//
//  SecondViewController.swift
//  Multithreading-GCD2
//
//  Created by ruslan on 29.10.2021.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    private var someNumber = 0 {
        didSet {
            DispatchQueue.main.sync {
                self.label.text = self.someNumber.description
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        concurrentPerform()
    }
    
    private func concurrentPerform() {
        let queue = DispatchQueue.global(qos: .utility)
        queue.async {
            DispatchQueue.concurrentPerform(iterations: 1_000_00) {
                self.someNumber = $0
                print("\($0)")
            }
        }
    }
}
