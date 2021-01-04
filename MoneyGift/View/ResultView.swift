//
//  ResultView.swift
//  MoneyGift
//
//  Created by leeyuno on 02/08/2019.
//  Copyright © 2019 leeyuno. All rights reserved.
//

import UIKit

protocol ResultViewDelegate: class {
    func done()
}

class ResultView: UIView {

    @IBOutlet weak var resultPrice: UILabel!
    
    @IBOutlet weak var doneButton: UIButton!
    weak var resultViewDelegate: ResultViewDelegate?
    
    @IBAction func doneButton(_ sender: UIButton) {
        resultViewDelegate?.done()
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
