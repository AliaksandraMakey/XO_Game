//
//  ExtensionView.swift
//  XO-game
//
//  Created by aaa on 2023-03-16.
//  Copyright © 2023 plasmon. All rights reserved.
//

import UIKit

extension UIViewController {
   public func reloadViewFromNib() {
        //TODO: Смещаеться subView, откорректировать ошибку
        let parent = view.superview
        view.removeFromSuperview()
        view = nil
        parent?.addSubview(view)
    }
}
