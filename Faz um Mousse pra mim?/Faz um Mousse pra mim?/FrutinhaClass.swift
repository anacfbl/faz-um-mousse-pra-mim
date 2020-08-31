//
//  FrutinhaClass.swift
//  Faz um Mousse pra mim?
//
//  Created by Luis Eduardo Ramos on 31/08/20.
//  Copyright © 2020 Luis Eduardo Ramos. All rights reserved.
//

import UIKit

public class Frutinha {
    
    var fotoFrutinha: UIImage
    var nomeDaFrutinha: String
    var familiaDaFrutinha: String
    var generoDaFrutinha: String
    var ordemDaFrutinha: String
    var carboidratosDaFrutinha: Int
    var proteinasDaFrutinha: Int
    var gordurasDaFrutinha: Int
    var caloriasDaFrutinha: Int
    var acucaresDaFrutinha: Int
    
    init(fotoFrutinha: UIImage, nomeDaFrutinha: String, familiaDaFrutinha: String, generoDaFrutinha: String, ordemDaFrutinha: String, carboidratosDaFrutinha: Int, proteinasDaFrutinha: Int, gordurasDaFrutinha: Int, caloriasDaFrutinha: Int, acucaresDaFrutinha: Int) {
        self.fotoFrutinha = fotoFrutinha
        self.nomeDaFrutinha = nomeDaFrutinha
        self.familiaDaFrutinha = familiaDaFrutinha
        self.generoDaFrutinha = generoDaFrutinha
        self.ordemDaFrutinha = ordemDaFrutinha
        self.carboidratosDaFrutinha = carboidratosDaFrutinha
        self.proteinasDaFrutinha = proteinasDaFrutinha
        self.gordurasDaFrutinha = gordurasDaFrutinha
        self.caloriasDaFrutinha = caloriasDaFrutinha
        self.acucaresDaFrutinha = acucaresDaFrutinha
    }
}
