//
//  SourceViewController.swift
//  StormViewer
//
//  Created by Alexandr Grigoriev on 1/16/19.
//  Copyright © 2019 AlexG. All rights reserved.
//

import Cocoa

class SourceViewController: NSViewController, NSTableViewDelegate, NSTableViewDataSource
{
    @IBOutlet weak var sourceTable: NSTableView!
    var pictures = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath
        let items = try! fm.contentsOfDirectory(atPath: path!)
        for item in items {
            if item.hasPrefix("nssl") {
                pictures.append(item)
            }
        }
    }
    
    override func viewDidAppear() {
        super.viewDidAppear()
        sourceTable.selectRowIndexes(IndexSet(arrayLiteral: 0), byExtendingSelection: true)
    }
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return pictures.count
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        guard let vw = tableView.makeView(withIdentifier: tableColumn!.identifier, owner: self) as? NSTableCellView else { return nil }
        vw.textField?.stringValue = pictures[row]
        return vw
    }
    
    func tableViewSelectionDidChange(_ notification: Notification)
    {
        guard sourceTable.selectedRow != -1 else { return }
        guard let splitVC = parent as? NSSplitViewController else { return }
        if let detail = splitVC.children[1] as? DetailsViewController {
            detail.imageSelected(name: pictures[sourceTable.selectedRow])
        }
    }
}
