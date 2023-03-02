//
//  ViewController.swift
//  Lesson 3
//
//  Created by Alex Ander on 22.02.23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
     
        var x = [(1, "x"), (4, "y"), (6, "a")]

        let k = x.map( {($0.0 * $0.0, $0.1)} ).filter( {$0.0 % 2 == 0} ).sorted(by: {$0.1 < $1.1 } )// <- [(36, "a"), (16, "y)]
    
print (k)
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    }


}

