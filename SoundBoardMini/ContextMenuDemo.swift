//
//  ContextMenuDemo.swift
//  SoundBoardMini
//
//  Created by Muhammad Thirafi on 12/04/20.
//  Copyright © 2020 Arjasa Virya Aryanera. All rights reserved.
//

import UIKit

protocol ContextMenuDemo {
    static var title: String { get }
}

extension ContextMenuDemo {
    func makeDefaultDemoMenu() -> UIMenu {
        let share = UIAction(title: "Share", image: UIImage(systemName: "square.and.arrow.up")) {
            action in
        }
        let delete = UIAction(title: "Delete", image: UIImage(systemName: "trash"),attributes: .destructive) {
            action in
        }
        return UIMenu(title: "",children: [share, delete])
    }
}
