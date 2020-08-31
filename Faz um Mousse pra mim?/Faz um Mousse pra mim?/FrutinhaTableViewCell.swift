//
//  FrutinhaTableViewCell.swift
//  Faz um Mousse pra mim?
//
//  Created by Luis Eduardo Ramos on 31/08/20.
//  Copyright © 2020 Luis Eduardo Ramos. All rights reserved.
//

import UIKit

class FrutinhaTableViewCell: UITableViewCell {
    
    //MARK: Properties
    @IBOutlet weak var imageFrutinha: UIImageView!
    @IBOutlet weak var nomeFrutinha: UILabel!
    @IBOutlet weak var familiaFrutinha: UILabel!
    @IBOutlet weak var generoFrutinha: UILabel!
    @IBOutlet weak var ordemFrutinha: UILabel!
    @IBOutlet weak var carboidratosFrutinha: UILabel!
    @IBOutlet weak var proteinasFrutinha: UILabel!
    @IBOutlet weak var gordurasFrutinha: UILabel!
    @IBOutlet weak var caloriasFrutinha: UILabel!
    @IBOutlet weak var acucaresFrutinha: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
