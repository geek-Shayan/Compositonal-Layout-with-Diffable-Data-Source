//
//  HeaderCollectionReusableView.swift
//  Compositonal Layout with Diffable Data Source
//
//  Created by MD. SHAYANUL HAQ SADI on 3/5/23.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {
    static let headerIdentifier = "header"
    
    private let header: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .medium)
            //        label.text = "Category"
            //        label.backgroundColor = .darkGray
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
            //        header.backgroundColor = .opaqueSeparator
        addSubview(header)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        header.frame = bounds
    }
    
    func setup(head: String) {
        header.text = head
    }
}
