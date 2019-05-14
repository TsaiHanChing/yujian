//
//  sharpImageView.swift
//  yujian
//
//  Created by User23 on 2019/5/14.
//

import UIKit

class sharpImageView: UIImageView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override func layoutSubviews() {
        super.layoutSubviews()
        let path = UIBezierPath()
        path.move(to: CGPoint.zero)
        path.addLine(to: CGPoint(x: bounds.width/5*4, y: 0))
        path.addLine(to: CGPoint(x: bounds.width, y: bounds.width/5))
         path.addLine(to: CGPoint(x: bounds.width, y: bounds.height))
        path.addLine(to: CGPoint(x: bounds.width/5, y: bounds.height))
        path.addLine(to: CGPoint(x: 0, y: bounds.height-(bounds.width/5)))
        path.close()
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        layer.mask = shapeLayer
    }

}
