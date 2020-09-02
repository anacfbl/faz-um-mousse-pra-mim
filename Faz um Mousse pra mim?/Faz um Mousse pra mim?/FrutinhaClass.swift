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
    var carboidratosDaFrutinha: Double
    var proteinasDaFrutinha: Double
    var gordurasDaFrutinha: Double
    var caloriasDaFrutinha: Int
    var acucaresDaFrutinha: Double
    
    init(fotoFrutinha: UIImage, nomeDaFrutinha: String, familiaDaFrutinha: String, generoDaFrutinha: String, ordemDaFrutinha: String, carboidratosDaFrutinha: Double, proteinasDaFrutinha: Double, gordurasDaFrutinha: Double, caloriasDaFrutinha: Int, acucaresDaFrutinha: Double) {
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
