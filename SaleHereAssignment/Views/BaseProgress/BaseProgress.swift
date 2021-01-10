//
//  BaseProgress.swift
//  ProgressView
//
//  Created by cimbth on 28/2/2562 BE.
//  Copyright © 2562 cimbth. All rights reserved.
//

import UIKit

public class BaseProgress: UIView {
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var bgProgressView: UIView!
    @IBOutlet weak var progressBar: UIView!
    @IBOutlet weak var progressBarConstraintLeft: NSLayoutConstraint!
    
    private var fPercent: CGFloat = 0.0
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupView()
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        self.setPercent(value: self.fPercent)
    }
    
    override public func layoutIfNeeded() {
        super.layoutIfNeeded()
        self.setPercent(value: self.fPercent)
    }
    
    private func setupView() {
        Bundle(for: BaseProgress.self).loadNibNamed("BaseProgress", owner: self, options: nil)
        self.addSubview(self.contentView)
        self.contentView.frame = self.bounds
        self.contentView.autoresizingMask = [.flexibleHeight,.flexibleWidth]
        
        self.bgProgressView.layer.cornerRadius = self.bgProgressView.frame.height / 2.0
        self.bgProgressView.clipsToBounds = true
        self.bgProgressView.backgroundColor = #colorLiteral(red: 0.1960550249, green: 0.1960947514, blue: 0.1960498393, alpha: 1)
        
        self.progressBar.backgroundColor = #colorLiteral(red: 0.78613168, green: 0.364203155, blue: 0.2807894945, alpha: 1)
        self.progressBar.clipsToBounds = true
    }
    
    public func setPercent(value percent: CGFloat = 0.0) {
        self.fPercent = percent
        self.progressBarConstraintLeft.constant = self.bgProgressView.frame.width - min(max(percent, 0.0), 1.0) * self.bgProgressView.frame.width
    }
}

