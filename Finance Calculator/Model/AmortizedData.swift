//
//  AmortizedData.swift
//  Finance Calculator
//
//  Created by ABC on 12/7/20.
//


class AmortizedData
{
    var no: String
    var year: String
    var futureVal: String
    var effectiveRate: String
    var interest: String

    init(no: String, year: String, futureVal: String, effectiveRate: String, interest: String) {
        self.no = no
        self.year = year
        self.futureVal = futureVal
        self.effectiveRate = effectiveRate
        self.interest = interest

    }
}
