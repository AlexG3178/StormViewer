//
//  WindowController.swift
//  StormViewer
//
//  Created by Alexandr Grigoriev on 2/17/19.
//  Copyright © 2019 AlexG. All rights reserved.
//

import Cocoa

class WindowController: NSWindowController {


    @IBOutlet weak var shareButton: NSButton!
    
    override func windowDidLoad() {
        super.windowDidLoad()
    
        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    }
    
    @IBAction func  sharedClicked(_ sender: NSView) {
        guard let split = contentViewController as? NSSplitViewController else { return }
        guard let detail = split.children[1] as? DetailsViewController else { return }
        guard let image = detail.imageView.image else { return }
        let picker = NSSharingServicePicker(items: [image])
        picker.show(relativeTo: .zero, of: sender, preferredEdge: .minY)
    }

}
