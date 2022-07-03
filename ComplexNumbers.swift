//  Created by Bahadir Etka Kilinc

import Foundation

struct ComplexNumber{
    var realComponent: Double
    var imaginaryComponent: Double
    func divide(complexNumber other: ComplexNumber) -> ComplexNumber{
        let complement = other.conjugate()
        let divisor = squares(complement.realComponent, complement.imaginaryComponent)
        let newComplex = multiply(complexNumber: complement)
        let newReal = newComplex.realComponent / divisor
        let newImaginary = newComplex.imaginaryComponent / divisor
        return ComplexNumber(realComponent: newReal, imaginaryComponent: newImaginary)
    }
    func squares(_ real: Double, _ imaginary: Double) -> Double{
        return pow(real, 2) + pow(imaginary, 2)
    }
    func absolute() -> Double{
        return sqrt(squares(realComponent, imaginaryComponent))
    }
    func multiply(complexNumber other: ComplexNumber) -> ComplexNumber{
        let otherReal = other.realComponent
        let otherImaginary = other.imaginaryComponent
        let newReal = (realComponent * otherReal + -(imaginaryComponent * otherImaginary))
        let newImaginary = realComponent * otherImaginary + imaginaryComponent * otherReal
        return ComplexNumber(realComponent: newReal, imaginaryComponent: newImaginary)
    }
    func conjugate() -> ComplexNumber{
        return ComplexNumber(realComponent: realComponent, imaginaryComponent: -imaginaryComponent)
    }
    func add(complexNumber other: ComplexNumber) -> ComplexNumber{
        return operation(+, other)
    }
    func subtract(complexNumber other: ComplexNumber) -> ComplexNumber{
        return operation(-, other)
    }
    func exponent() -> ComplexNumber{
        return ComplexNumber(realComponent: exp(realComponent) * cos(imaginaryComponent), imaginaryComponent: exp(realComponent) * sin(imaginaryComponent))
    }
    func getRealComponent() -> Double{
        return realComponent
    }
    func getImaginaryComponent() -> Double{
        return imaginaryComponent
    }
    private func operation(_ foo:(Double,Double) -> Double, _ other: ComplexNumber) -> ComplexNumber{
        let newReal = foo(realComponent,other.realComponent)
        let newImaginary = foo(imaginaryComponent,other.imaginaryComponent)
        return ComplexNumber(realComponent: newReal, imaginaryComponent: newImaginary)
    }
}