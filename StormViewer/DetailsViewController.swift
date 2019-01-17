//
//  DetailsViewController.swift
//  StormViewer
//
//  Created by Alexandr Grigoriev on 1/16/19.
//  Copyright © 2019 AlexG. All rights reserved.
//

import Cocoa

class DetailsViewController: NSViewController
{
    @IBOutlet weak var imageView: NSImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func imageSelected(name: String) {
        imageView.image = NSImage.init(imageLiteralResourceName: name)
    }
}
