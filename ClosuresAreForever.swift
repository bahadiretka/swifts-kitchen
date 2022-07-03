//  Created by Bahadir Etka Kilinc
typealias Wires = (String,String,String)
let flip: (Wires) -> Wires = {Wires($0.1,$0.0,$0.2)}
let rotate: (Wires) -> Wires = {Wires($0.1,$0.2,$0.0)}
func makeShuffle(
  flipper: @escaping (Wires) -> Wires,
  rotator: @escaping (Wires) -> Wires
) -> (UInt8, Wires) -> Wires{
    { id,wires in (0..<8).map{(id >> $0) & 1}.reduce(into: wires){ $0 = (($1 == 0) ? flipper($0) : rotator($0))} }
}